subroutine control2state(xhat,sval,bval)
!$$$  subprogram documentation block
!                .      .    .                                       .
! subprogram:    control2state
!   prgmmr: tremolet
!
! abstract:  Converts control variable to physical space
!
! program history log:
!   2007-04-13  tremolet - initial code
!   2008-11-28  todling  - add calc of 3dp; upd rh_to_q (Cucurull 2007-07-26)
!   2009-04-21  derber   - modify call to getuv to getuv(*,0)
!   2009-06-16  parrish  - for l_hyb_ens=.true., add calls to ensemble_forward_model and strong_bk
!   2009-08-14  lueken   - update documentation
!   2009-11-27  parrish  - for uv_hyb_ens=.true., then ensemble perturbations contain u,v instead of st,vp
!                            so introduce extra code to handle this case.
!   2010-02-21  parrish  - introduce changes to allow dual resolution, with ensemble computation on
!                            lower resolution grid compared to analysis grid.
!                            new parameter dual_res=.true. if ensemble grid is different from analysis grid.
!   2010-03-23  zhu      - use cstate for generalizing control variable
!   2010-04-29  todling  - update to use gsi_bundle; some changes toward bypassing standard atmos analysis
!   2010-05-12  todling  - rename cstate to wbundle; state_vector now a bundle
!   2010-05-31  todling  - better consistency checks; add co/co2
!                        - ready to bypass analysis of (any) meteorological fields
!   2010-06-04  parrish  - bug fix: u,v copy to wbundle after getuv for hyb ensemble
!   2010-06-15  todling  - generalized handling of chemistry
!   2011-02-20  zhu      - add gust,vis,pblh
!   2011-05-15  auligne/todling - generalized cloud handling
!   2011-07-12   zhu     - add do_cw_to_hydro and cwhydromod for cloudy radiance assimilation
!   2011-11-01  eliu     - generalize the use of do_cw_to_hydro
!   2012-02-08  kleist   - remove call to strong_bk, ensemble_forward_model, 
!                             ensemble_forward_model_dual_res, and related parameters
!   2012-09-14  Syed RH Rizvi, NCAR/NESL/MMM/DAS  - updated for obs adjoint test and added ladtest_obs  
!   2013-05-23   zhu     - add ntclen and predt for aircraft temperature bias correction
!
!   input argument list:
!     xhat - Control variable
!     sval - State variable
!     bval - Bias predictors
!
!   output argument list:
!     sval - State variable
!     bval - Bias predictors
!
!$$$ end documentation block
use kinds, only: r_kind,i_kind
use control_vectors, only: control_vector
use control_vectors, only: cvars3d,cvars2d
use bias_predictors, only: predictors
use gsi_4dvar, only: nsubwin, nobs_bins, l4dvar, lsqrtb, ladtest_obs
use gridmod, only: latlon1n,latlon11,regional,lat2,lon2,nsig, nlat, nlon
use jfunc, only: nsclen,npclen,ntclen,nrclen
use cwhydromod, only: cw2hydro_tl
use gsi_bundlemod, only: gsi_bundlecreate
use gsi_bundlemod, only: gsi_bundle
use gsi_bundlemod, only: gsi_bundlegetpointer
use gsi_bundlemod, only: gsi_bundlegetvar
use gsi_bundlemod, only: gsi_bundleputvar
use gsi_bundlemod, only: gsi_bundledestroy
use gsi_bundlemod, only: assignment(=)
use gsi_chemguess_mod, only: gsi_chemguess_get
use gsi_metguess_mod, only: gsi_metguess_get
use mpeu_util, only: getindex
use constants, only : max_varname_length, zero
use general_sub2grid_mod, only: general_sub2grid,general_grid2sub
use general_commvars_mod, only: s2g_cv
implicit none
  
! Declare passed variables  
type(control_vector), intent(in   ) :: xhat
type(gsi_bundle)    , intent(inout) :: sval(nsubwin)
type(predictors)    , intent(inout) :: bval

! Declare local variables  	
character(len=*),parameter::myname='control2state'
character(len=max_varname_length),allocatable,dimension(:) :: gases
character(len=max_varname_length),allocatable,dimension(:) :: clouds
real(r_kind),dimension(nlat*nlon*s2g_cv%nlevs_alloc)      :: hwork
integer(i_kind) :: i,j,k,ii,jj,ic,id,ngases,nclouds,istatus,istatus_oz 
type(gsi_bundle):: wbundle ! work bundle

! Note: The following does not aim to get all variables in
!       the state and control vectors, but rather the ones
!       this routines knows how to handle.
! Declare required local control variables
integer(i_kind), parameter :: ncvars = 6
integer(i_kind) :: icps(ncvars)
integer(i_kind) :: icpblh,icgust,icvis,icoz
character(len=3), parameter :: mycvars(ncvars) = (/  &  ! vars from CV needed here
                               'sf ', 'vp ', 'ps ', 't  ',    &
                               'q  ', 'cw ' /)
logical :: lc_sf,lc_vp,lc_ps,lc_t,lc_rh,lc_cw
real(r_kind),pointer,dimension(:,:)   :: cv_ps,cv_vis
real(r_kind),pointer,dimension(:,:,:) :: cv_sf,cv_vp,cv_t,cv_rh

! Declare required local state variables
integer(i_kind), parameter :: nsvars = 7
integer(i_kind) :: isps(nsvars)
character(len=4), parameter :: mysvars(nsvars) = (/  &  ! vars from ST needed here
                               'u   ', 'v   ', 'p3d ', 'q   ', 'tsen', 'ql  ','qi  ' /)
logical :: ls_u,ls_v,ls_p3d,ls_q,ls_tsen,ls_ql,ls_qi
real(r_kind),pointer,dimension(:,:)   :: sv_ps,sv_sst
real(r_kind),pointer,dimension(:,:)   :: sv_gust,sv_vis,sv_pblh
real(r_kind),pointer,dimension(:,:,:) :: sv_u,sv_v,sv_p3d,sv_q,sv_tsen,sv_tv,sv_oz
real(r_kind),pointer,dimension(:,:,:) :: sv_rank3
real(r_kind),pointer,dimension(:,:)   :: sv_rank2

logical :: do_getprs_tl,do_normal_rh_to_q,do_tv_to_tsen,do_getuv,do_cw_to_hydro

!******************************************************************************

if (lsqrtb) then
   write(6,*)trim(myname),': not for sqrt(B)'
   call stop2(106)
end if
if (nsubwin/=1 .and. .not.l4dvar) then
   write(6,*)trim(myname),': error 3dvar',nsubwin,l4dvar
   call stop2(107)
end if

! Inquire about cloud-vars 
call gsi_metguess_get('clouds::3d',nclouds,istatus)
if (nclouds>0) then
   allocate(clouds(nclouds))
   call gsi_metguess_get('clouds::3d',clouds,istatus)
end if

! Inquire about chemistry
call gsi_chemguess_get('dim',ngases,istatus)
if (ngases>0) then
    allocate(gases(ngases))
    call gsi_chemguess_get('gsinames',gases,istatus)
endif

! Since each internal vector of xhat has the same structure, pointers are
! the same independent of the subwindow jj
call gsi_bundlegetpointer (xhat%step(1),mycvars,icps,istatus)
lc_sf =icps(1)>0; lc_vp =icps(2)>0; lc_ps =icps(3)>0
lc_t  =icps(4)>0; lc_rh =icps(5)>0; lc_cw =icps(6)>0

! Since each internal vector of xhat has the same structure, pointers are
! the same independent of the subwindow jj
call gsi_bundlegetpointer (sval(1),mysvars,isps,istatus)
ls_u  =isps(1)>0; ls_v   =isps(2)>0; ls_p3d=isps(3)>0
ls_q  =isps(4)>0; ls_tsen=isps(5)>0; ls_ql =isps(6)>0; ls_qi =isps(7)>0

! Define what to do depending on what's in CV and SV
do_getprs_tl     =lc_ps.and.lc_t .and.ls_p3d
do_normal_rh_to_q=lc_rh.and.lc_t .and.ls_p3d.and.ls_q
do_tv_to_tsen    =lc_t .and.ls_q .and.ls_tsen
do_getuv         =lc_sf.and.lc_vp.and.ls_u.and.ls_v

do_cw_to_hydro=.false.
if (regional) then
   do_cw_to_hydro=lc_cw.and.ls_ql.and.ls_qi
else
   do_cw_to_hydro=lc_cw.and.ls_tsen.and.ls_ql.and.ls_qi  !global
endif

call gsi_bundlegetpointer (xhat%step(1),'oz',icoz,istatus)
call gsi_bundlegetpointer (xhat%step(1),'gust',icgust,istatus)
call gsi_bundlegetpointer (xhat%step(1),'vis',icvis,istatus)
call gsi_bundlegetpointer (xhat%step(1),'pblh',icpblh,istatus)

! Loop over control steps
do jj=1,nsubwin

!  Create a temporary bundle similar to xhat, and copy contents of xhat into it
   call gsi_bundlecreate ( wbundle, xhat%step(jj), 'control2state work', istatus )
   if(istatus/=0) then
      write(6,*) trim(myname), ': trouble creating work bundle'
      call stop2(999)
   endif
   wbundle=xhat%step(jj)

!  Get pointers to required control variables
   call gsi_bundlegetpointer (wbundle,'sf' ,cv_sf ,istatus)
   call gsi_bundlegetpointer (wbundle,'vp' ,cv_vp ,istatus)
   call gsi_bundlegetpointer (wbundle,'ps' ,cv_ps ,istatus)
   call gsi_bundlegetpointer (wbundle,'t'  ,cv_t,  istatus)
   call gsi_bundlegetpointer (wbundle,'q'  ,cv_rh ,istatus)
   if (icvis >0) call gsi_bundlegetpointer (wbundle,'vis',cv_vis,istatus)
   if(ladtest_obs) then
! Convert from subdomain to full horizontal field distributed among processors
      call general_sub2grid(s2g_cv,wbundle%values,hwork)
! Put back onto subdomains
      call general_grid2sub(s2g_cv,hwork,wbundle%values)
   end if
!  Get pointers to required state variables
   call gsi_bundlegetpointer (sval(jj),'u'   ,sv_u,   istatus)
   call gsi_bundlegetpointer (sval(jj),'v'   ,sv_v,   istatus)
   call gsi_bundlegetpointer (sval(jj),'ps'  ,sv_ps,  istatus)
   call gsi_bundlegetpointer (sval(jj),'p3d' ,sv_p3d, istatus)
   call gsi_bundlegetpointer (sval(jj),'tv'  ,sv_tv,  istatus)
   call gsi_bundlegetpointer (sval(jj),'tsen',sv_tsen,istatus)
   call gsi_bundlegetpointer (sval(jj),'q'   ,sv_q ,  istatus)
!  call gsi_bundlegetpointer (sval(jj),'oz'  ,sv_oz , istatus)     
   call gsi_bundlegetpointer (sval(jj),'oz'  ,sv_oz , istatus_oz)  
   call gsi_bundlegetpointer (sval(jj),'sst' ,sv_sst, istatus)
   if (icgust>0) call gsi_bundlegetpointer (sval(jj),'gust' ,sv_gust, istatus)
   if (icpblh>0) call gsi_bundlegetpointer (sval(jj),'pblh' ,sv_pblh, istatus)
   if (icvis >0) call gsi_bundlegetpointer (sval(jj),'vis'  ,sv_vis , istatus)

!  Get 3d pressure
   if(do_getprs_tl) call getprs_tl(cv_ps,cv_t,sv_p3d)

!  Convert input normalized RH to q
   if(do_normal_rh_to_q) call normal_rh_to_q(cv_rh,cv_t,sv_p3d,sv_q)

!  Calculate sensible temperature
   if(do_tv_to_tsen) call tv_to_tsen(cv_t,sv_q,sv_tsen)

!  Convert streamfunction and velocity potential to u,v
   if(do_getuv) call getuv(sv_u,sv_v,cv_sf,cv_vp,0)

!  Convert log(vis) to vis
   if (icvis >0)  call logvis_to_vis(cv_vis,sv_vis)

!  Copy other variables
   call gsi_bundlegetvar ( wbundle, 't'  , sv_tv,  istatus )
   if (icoz>0) then
      call gsi_bundlegetvar ( wbundle, 'oz' , sv_oz,  istatus )
   else
      if(istatus_oz==0) sv_oz=zero   
   end if
   call gsi_bundlegetvar ( wbundle, 'ps' , sv_ps,  istatus )
   call gsi_bundlegetvar ( wbundle, 'sst', sv_sst, istatus )
   if (icgust>0) call gsi_bundlegetvar ( wbundle, 'gust', sv_gust, istatus )
   if (icpblh>0) call gsi_bundlegetvar ( wbundle, 'pblh', sv_pblh, istatus )

   if (do_cw_to_hydro) then
!     Case when cloud-vars do not map one-to-one (cv-to-sv)
!     e.g. cw-to-ql&qi
      if (.not. do_tv_to_tsen) then
         allocate(sv_tsen(lat2,lon2,nsig))
         call tv_to_tsen(cv_t,sv_q,sv_tsen)
      end if
      call cw2hydro_tl(sval(jj),wbundle,sv_tsen,clouds,nclouds)
      if (.not. do_tv_to_tsen) deallocate(sv_tsen)
   else
!     Case when cloud-vars map one-to-one (cv-to-sv), take care of them together
!     e.g. cw-to-cw
      do ic=1,nclouds
         id=getindex(cvars3d,clouds(ic))
         if (id>0) then
             call gsi_bundlegetpointer (sval(jj),clouds(ic),sv_rank3,istatus)
             call gsi_bundlegetvar     (wbundle, clouds(ic),sv_rank3,istatus)
         endif
      enddo
   end if

!  Same one-to-one map for chemistry-vars; take care of them together 
   do ic=1,ngases
      id=getindex(cvars3d,gases(ic))
      if (id>0) then
          call gsi_bundlegetpointer (sval(jj),gases(ic),sv_rank3,istatus)
          call gsi_bundlegetvar     (wbundle, gases(ic),sv_rank3,istatus)
      endif
      id=getindex(cvars2d,gases(ic))
      if (id>0) then
          call gsi_bundlegetpointer (sval(jj),gases(ic),sv_rank2,istatus)
          call gsi_bundlegetvar     (wbundle, gases(ic),sv_rank2,istatus)
      endif
   enddo

   call gsi_bundledestroy(wbundle,istatus)
   if(istatus/=0) then
      write(6,*) trim(myname), ': trouble destroying work bundle'
      call stop2(999)
   endif

end do

! Biases
do ii=1,nsclen
   bval%predr(ii)=xhat%predr(ii)
enddo

do ii=1,npclen
   bval%predp(ii)=xhat%predp(ii)
enddo

if (ntclen>0) then
   do ii=1,ntclen
      bval%predt(ii)=xhat%predt(ii)
   enddo
end if

! Clean up
if (ngases>0) then
    deallocate(gases)
endif

if (nclouds>0) deallocate(clouds)

return
end subroutine control2state