subroutine jgrad(xhat,yhat,fjcost,gradx,lupdfgs,nprt,calledby)

!$$$  subprogram documentation block
!
! abstract: Evaluate cost function and its gradient at point xhat.
!
! program history log:
!   2009-08-15  tremolet - initial code
!   2010-09-31  el akkraoui - re-examine and update gradient calculation
!   2012-07-09  todling - update to use Kleist changes to 4d-hybrid-ensemble
!                       - also revisit handling of state vectors
!   2012-12-06  todling - add adjoint gradient update (for backward analysis)
!   2013-05-05  todling - add dry mass constraint (also used in pcgsoi)
!   2013-05-15  todling - add total water constraint (also used in pcgsoi)
!   2013-05-18  todling - evaljcdfi placed in intjcmod w/ name intjcdfi
!   2014-02-07  todling - update bias when doing 4dvar
!
!$$$

use kinds, only: r_kind,i_kind,r_quad
use gsi_4dvar, only: nobs_bins, nsubwin, l4dvar, ltlint, iwrtinc, idmodel
use constants, only: zero,zero_quad
use mpimod, only: mype
use jfunc, only : xhatsave,yhatsave
use jcmod, only: ljcdfi,ljcpdry
use intjcmod, only: intjcpdry
use jfunc, only: nclen,l_foto,xhat_dt,jiter,jiterend
use gridmod, only: lat2,lon2,nsig,twodvar_regional
use obsmod, only: yobs, lsaveobsens, l_do_adjoint
use obs_sensitivity, only: fcsens
use mod_strong, only: l_tlnmc,baldiag_inc
use control_vectors, only: control_vector
use control_vectors, only: allocate_cv,deallocate_cv,prt_control_norms
use control_vectors, only: dot_product,assignment(=)
use state_vectors, only: allocate_state,deallocate_state,prt_state_norms
use gsi_bundlemod, only: gsi_bundle
use gsi_bundlemod, only: self_add,assignment(=)
use bias_predictors, only: predictors,allocate_preds,deallocate_preds,assignment(=)
use bias_predictors, only: update_bias_preds
use intjomod, only: intjo
use intjcmod, only: intjcdfi
use gsi_4dcouplermod, only: gsi_4dcoupler_grtests
use xhat_vordivmod, only : xhat_vordiv_init, xhat_vordiv_calc, xhat_vordiv_clean
use hybrid_ensemble_parameters,only : l_hyb_ens,ntlevs_ens

implicit none

! Declare passed variables
type(control_vector), intent(in   ) :: xhat, yhat
real(r_quad)        , intent(  out) :: fjcost
type(control_vector), intent(inout) :: gradx
logical             , intent(in   ) :: lupdfgs
integer(i_kind)     , intent(in   ) :: nprt
character(len=*)    , intent(in   ) :: calledby

! Declare local variables  
character(len=*), parameter :: myname='jgrad'
type(control_vector) :: xnew, ynew 
type(gsi_bundle)     :: sval(nobs_bins), rval(nobs_bins)
type(gsi_bundle)     :: mval(nsubwin)
type(gsi_bundle)     :: eval(ntlevs_ens)
type(predictors)     :: sbias, rbias
real(r_quad)         :: zjb,zjo,zjc,zjl,zjd
integer(i_kind)      :: i,ii,iobs,ibin
real(r_kind)         :: zdummy(lat2,lon2,nsig)
logical              :: llprt,llouter
character(len=255)   :: seqcalls

!**********************************************************************

llprt=(mype==0.and.nprt>=2)
llouter=.false.
seqcalls = trim(calledby)//'::'//trim(myname)

! Allocate local variables
do ii=1,nobs_bins
   call allocate_state(sval(ii))
   call allocate_state(rval(ii))
end do
do ii=1,nsubwin
   call allocate_state(mval(ii))
end do
do ii=1,ntlevs_ens
   call allocate_state(eval(ii))
end do

call allocate_preds(sbias)
call allocate_preds(rbias)

call allocate_cv(xnew)
call allocate_cv(ynew)

!
zjl=zero_quad  ! Moisture constraint???

! Convert from control variable to state space
call control2state(xhat,mval,sbias)

if (l4dvar) then
  if (l_hyb_ens) then
     call ensctl2state(xhat,mval,eval)
     mval(1)=eval(1)
  end if

! Perform test of AGCM TLM and ADM
  call gsi_4dcoupler_grtests(mval,sval,nsubwin,nobs_bins)

! Run TL model to fill sval
  call model_tl(mval,sval,llprt)

else

! Get copy state-vector for comparison with observations
  if (l_hyb_ens) then
!    Convert ensemble control variable to state space
     call ensctl2state(xhat,mval,eval)
     do ii=1,nobs_bins
        sval(ii)=eval(ii)
     end do
  else
     do ii=1,nobs_bins
        sval(ii)=mval(1)
     end do
  endif
end if

if (nprt>=2) then
   do ii=1,nobs_bins
      call prt_state_norms(sval(ii),'sval')
   enddo
endif

! Zero gradient
do ii=1,nobs_bins
   rval(ii)=zero
end do
rbias=zero
do ii=1,nsubwin
   mval(ii)=zero
end do

! Compare obs to solution and transpose back to grid (H^T R^{-1} H)
do ibin=1,nobs_bins
   call intjo(yobs(ibin),rval(ibin),rbias,sval(ibin),sbias,ibin)
end do

! Evaluate Jo
call evaljo(zjo,iobs,nprt,llouter)

if (l_do_adjoint) then
  if (lsaveobsens) then
!   Observation sensitivity right hand side
     do ii=1,gradx%lencv
        gradx%values(ii) = - fcsens%values(ii)
     enddo
  else
    gradx=zero
  endif

! Moisture constraint
   zjl=zero_quad
   if (.not.ltlint) then
      do ibin=1,nobs_bins
         call evalqlim(sval(ibin),zjl,rval(ibin))
      enddo
   endif

! Dry mass constraint
   zjd=zero_quad
   if (ljcpdry) then
      do ibin=1,nobs_bins
         call intjcpdry(rval(ibin),sval(ibin),pjc=zjd)
      enddo
   endif

   if (ljcdfi) then
      call intjcdfi(rval,sval,pjc=zjc)
   else
! Jc and other 3D-Var terms
! Don't know how to deal with Jc term so comment for now...
!     call eval3dvar(sval,zjc,rval,zdummy)
      zjc=zero_quad
   endif

   if (nprt>=2) then
      do ii=1,nobs_bins
         call prt_state_norms(rval(ii),'rval')
      enddo
   endif

  if (l4dvar) then
!   Run adjoint model
    call model_ad(mval,rval,llprt)
    if (l_hyb_ens) then
       eval(1)=mval(1)
       call state2ensctl(eval,mval,gradx)
    end if

  else

!   Adjoint of copy of state-vector for observation comparison
    if (l_hyb_ens) then
       do ii=1,nobs_bins
          eval(ii)=rval(ii)
       end do
       call state2ensctl(eval,mval,gradx)
    else
       mval(1)=rval(1)
       if (nobs_bins>1) then
          do ii=2,nobs_bins
             call self_add(mval(1),rval(ii))
          enddo
       end if
    end if
  end if

! Adjoint of convert control var to state space
  call state2control(mval,rbias,gradx)
 
! Contribution from current and previous backgroun term
  do i=1,nclen
    xnew%values(i) = xhat%values(i)+ xhatsave%values(i)
    ynew%values(i) = yhat%values(i)+ yhatsave%values(i)
  end do
  zjb=dot_product(xnew,ynew,r_quad)
!$omp parallel do
  do i=1,nclen
    gradx%values(i)=gradx%values(i)+yhat%values(i)+ yhatsave%values(i)
  end do
!$omp end parallel do

! Cost function
  fjcost=zjb+zjo+zjc+zjl+zjd

! Print diagnostics
  if (nprt>=2) then
    if (l4dvar) then
      do ii=1,nsubwin
         call prt_state_norms(mval(ii),'mval')
      enddo
    endif
    call prt_control_norms(gradx,'gradx')
  endif
  if (nprt>=1.and.mype==0) write(6,999)trim(seqcalls),': grepcost J,Jb,Jo,Jc,Jl,Jd,Jq=',&
                              fjcost,zjb,zjo,zjc,zjl,zjd
endif

! Produce diagnostic when applying strong constraint
if (lupdfgs.and.l_tlnmc.and.baldiag_inc) call strong_baldiag_inc(sval,size(sval))

! Save increment (update guess)
if (lupdfgs) then
! Calculate increments of vorticity/divergence
   call xhat_vordiv_init
   call xhat_vordiv_calc(sval)

! Overwrite guess with increment (4d-var only, for now)
  if (iwrtinc>0) then
    if (mype==0) write(6,*)trim(seqcalls),': Saving increment to file'
    call inc2guess(sval)
    call view_st (sval,'xinc')
    call write_all(iwrtinc,mype)
    call prt_guess('increment')
      ! NOTE: presently in 4dvar, we handle the biases in a slightly inconsistent when
      ! as when in 3dvar - that is, the state is not updated, but the biases are.
      ! This assumes GSI handles a single iteration of the outer loop at a time
      ! when doing 4dvar (that is, multiple iterations require stop-and-go).
    call update_bias_preds(twodvar_regional,sbias)
  else ! Update guess (model background, bias correction) fields
     if (mype==0) write(6,*)trim(seqcalls),': Updating guess'
     call update_guess(sval,sbias)
     if(jiter == jiterend)call write_all(iwrtinc,mype)
     call prt_guess('analysis')
  endif

! Clean up increments of vorticity/divergence
  call xhat_vordiv_clean
endif

! Release memory
call deallocate_cv(xnew)
call deallocate_cv(ynew)
call deallocate_preds(rbias)
call deallocate_preds(sbias)

do ii=1,ntlevs_ens
   call deallocate_state(eval(ii))
end do
do ii=1,nsubwin
   call deallocate_state(mval(ii))
end do
do ii=1,nobs_bins
   call deallocate_state(rval(ii))
   call deallocate_state(sval(ii))
end do

999 format(2A,7(1X,ES25.18))

return
end subroutine jgrad