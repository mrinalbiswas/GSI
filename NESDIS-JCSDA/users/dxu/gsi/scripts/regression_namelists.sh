# Define namelist for global run (pcgsoi minimization)

export global_T62_namelist=" 

 &SETUP
   miter=2,niter(1)=100,niter(2)=150,
   niter_no_qc(1)=50,niter_no_qc(2)=0,
   write_diag(1)=.true.,write_diag(2)=.false.,write_diag(3)=.true.,
   gencode=82,qoption=2,
   factqmin=5.0,factqmax=5.0,deltim=$DELTIM,
   ndat=69,iguess=-1,
   oneobtest=.false.,retrieval=.false.,l_foto=.false.,
   use_pbl=.false.,use_compress=.true.,nsig_ext=12,gpstop=50.,
   use_gfs_nemsio=.false.,lrun_subdirs=.true.,
   $SETUP
 /
 &GRIDOPTS
   JCAP=$JCAP,JCAP_B=$JCAP_B,NLAT=$NLAT,NLON=$LONA,nsig=$LEVS,
   regional=.false.,nlayers(63)=3,nlayers(64)=6,
   $GRIDOPTS
 /
 &BKGERR
   vs=0.7,
   hzscl=1.7,0.8,0.5,
   hswgt=0.45,0.3,0.25,
   bw=0.0,norsp=4,
   bkgv_flowdep=.true.,bkgv_rewgtfct=1.5,
   $BKGVERR
 /
 &ANBKGERR
   anisotropic=.false.,
   $ANBKGERR
 /
 &JCOPTS
   ljcdfi=.false.,alphajc=0.0,ljcpdry=.true.,bamp_jcpdry=5.0e7,
   $JCOPTS
 /
 &STRONGOPTS
   tlnmc_option=1,nstrong=1,nvmodes_keep=8,period_max=6.,period_width=1.5,
   baldiag_full=.true.,baldiag_inc=.true.,
   $STRONGOPTS
 /
 &OBSQC
   dfact=0.75,dfact1=3.0,noiqc=.true.,oberrflg=.false.,c_varqc=0.02,
   use_poq7=.true.,
   $OBSQC
 /
 &OBS_INPUT
   dmesh(1)=145.0,dmesh(2)=150.0,time_window_max=3.0,
   dfile(01)='prepbufr',  dtype(01)='ps',        dplat(01)=' ',       dsis(01)='ps',                 dval(01)=0.0, dthin(01)=0, dsfcalc(01)=0,
   dfile(02)='prepbufr'   dtype(02)='t',         dplat(02)=' ',       dsis(02)='t',                  dval(02)=0.0, dthin(02)=0, dsfcalc(02)=0,
   dfile(03)='prepbufr',  dtype(03)='q',         dplat(03)=' ',       dsis(03)='q',                  dval(03)=0.0, dthin(03)=0, dsfcalc(03)=0,
   dfile(04)='prepbufr',  dtype(04)='pw',        dplat(04)=' ',       dsis(04)='pw',                 dval(04)=0.0, dthin(04)=0, dsfcalc(04)=0,
   dfile(05)='satwndbufr',    dtype(05)='uv',        dplat(05)=' ',       dsis(05)='uv',                 dval(05)=0.0, dthin(05)=0, dsfcalc(05)=0,
   dfile(06)='prepbufr',  dtype(06)='uv',        dplat(06)=' ',       dsis(06)='uv',                 dval(06)=0.0, dthin(06)=0, dsfcalc(06)=0,
   dfile(07)='prepbufr',  dtype(07)='spd',       dplat(07)=' ',       dsis(07)='spd',                dval(07)=0.0, dthin(07)=0, dsfcalc(07)=0,
   dfile(08)='prepbufr',  dtype(08)='dw',        dplat(08)=' ',       dsis(08)='dw',                 dval(08)=0.0, dthin(08)=0, dsfcalc(08)=0,
   dfile(09)='radarbufr', dtype(09)='rw',        dplat(09)=' ',       dsis(09)='rw',                 dval(09)=0.0, dthin(09)=0, dsfcalc(09)=0,
   dfile(10)='prepbufr',  dtype(10)='sst',       dplat(10)=' ',       dsis(10)='sst',                dval(10)=0.0, dthin(10)=0, dsfcalc(10)=0,
   dfile(11)='gpsrobufr', dtype(11)='$gps_dtype',   dplat(11)=' ',       dsis(11)='gps',             dval(11)=0.0, dthin(11)=0, dsfcalc(11)=0,
   dfile(12)='ssmirrbufr',dtype(12)='pcp_ssmi',  dplat(12)='dmsp',    dsis(12)='pcp_ssmi',           dval(12)=0.0, dthin(12)=-1,dsfcalc(12)=0,
   dfile(13)='tmirrbufr', dtype(13)='pcp_tmi',   dplat(13)='trmm',    dsis(13)='pcp_tmi',            dval(13)=0.0, dthin(13)=-1,dsfcalc(13)=0,
   dfile(14)='sbuvbufr',  dtype(14)='sbuv2',     dplat(14)='n16',     dsis(14)='sbuv8_n16',          dval(14)=0.0, dthin(14)=0, dsfcalc(14)=0,
   dfile(15)='sbuvbufr',  dtype(15)='sbuv2',     dplat(15)='n17',     dsis(15)='sbuv8_n17',          dval(15)=0.0, dthin(15)=0, dsfcalc(15)=0,
   dfile(16)='sbuvbufr',  dtype(16)='sbuv2',     dplat(16)='n18',     dsis(16)='sbuv8_n18',          dval(16)=0.0, dthin(16)=0, dsfcalc(16)=0,
   dfile(17)='hirs3bufr', dtype(17)='hirs3',     dplat(17)='n17',     dsis(17)='hirs3_n17',          dval(17)=0.0, dthin(17)=1, dsfcalc(17)=1,
   dfile(18)='hirs4bufr', dtype(18)='hirs4',     dplat(18)='metop-a', dsis(18)='hirs4_metop-a',      dval(18)=0.0, dthin(18)=1, dsfcalc(18)=1,
   dfile(19)='gimgrbufr', dtype(19)='goes_img',  dplat(19)='g11',     dsis(19)='imgr_g11',           dval(19)=0.0, dthin(19)=1, dsfcalc(19)=0,
   dfile(20)='gimgrbufr', dtype(20)='goes_img',  dplat(20)='g12',     dsis(20)='imgr_g12',           dval(20)=0.0, dthin(20)=1, dsfcalc(20)=0,
   dfile(21)='airsbufr',  dtype(21)='airs',      dplat(21)='aqua',    dsis(21)='airs281SUBSET_aqua', dval(21)=0.0, dthin(21)=1, dsfcalc(21)=1,
   dfile(22)='amsuabufr', dtype(22)='amsua',     dplat(22)='n15',     dsis(22)='amsua_n15',          dval(22)=0.0, dthin(22)=1, dsfcalc(22)=1,
   dfile(23)='amsuabufr', dtype(23)='amsua',     dplat(23)='n18',     dsis(23)='amsua_n18',          dval(23)=0.0, dthin(23)=1, dsfcalc(23)=1,
   dfile(24)='amsuabufr', dtype(24)='amsua',     dplat(24)='metop-a', dsis(24)='amsua_metop-a',      dval(24)=0.0, dthin(24)=1, dsfcalc(24)=1,
   dfile(25)='airsbufr',  dtype(25)='amsua',     dplat(25)='aqua',    dsis(25)='amsua_aqua',         dval(25)=0.0, dthin(25)=1, dsfcalc(25)=1,
   dfile(26)='amsubbufr', dtype(26)='amsub',     dplat(26)='n17',     dsis(26)='amsub_n17',          dval(26)=0.0, dthin(26)=1, dsfcalc(26)=1,
   dfile(27)='mhsbufr',   dtype(27)='mhs',       dplat(27)='n18',     dsis(27)='mhs_n18',            dval(27)=0.0, dthin(27)=1, dsfcalc(27)=1,
   dfile(28)='mhsbufr',   dtype(28)='mhs',       dplat(28)='metop-a', dsis(28)='mhs_metop-a',        dval(28)=0.0, dthin(28)=1, dsfcalc(28)=1,
   dfile(29)='ssmitbufr', dtype(29)='ssmi',      dplat(29)='f14',     dsis(29)='ssmi_f14',           dval(29)=0.0, dthin(29)=1, dsfcalc(29)=0,
   dfile(30)='ssmitbufr', dtype(30)='ssmi',      dplat(30)='f15',     dsis(30)='ssmi_f15',           dval(30)=0.0, dthin(30)=1, dsfcalc(30)=0,
   dfile(31)='amsrebufr', dtype(31)='amsre_low', dplat(31)='aqua',    dsis(31)='amsre_aqua',         dval(31)=0.0, dthin(31)=1, dsfcalc(31)=0,
   dfile(32)='amsrebufr', dtype(32)='amsre_mid', dplat(32)='aqua',    dsis(32)='amsre_aqua',         dval(32)=0.0, dthin(32)=1, dsfcalc(32)=0,
   dfile(33)='amsrebufr', dtype(33)='amsre_hig', dplat(33)='aqua',    dsis(33)='amsre_aqua',         dval(33)=0.0, dthin(33)=1, dsfcalc(33)=0,
   dfile(34)='ssmisbufr', dtype(34)='ssmis_las', dplat(34)='f16',     dsis(34)='ssmis_f16',          dval(34)=0.0, dthin(34)=1, dsfcalc(34)=0,
   dfile(35)='ssmisbufr', dtype(35)='ssmis_uas', dplat(35)='f16',     dsis(35)='ssmis_f16',          dval(35)=0.0, dthin(35)=1, dsfcalc(35)=0,
   dfile(36)='ssmisbufr', dtype(36)='ssmis_img', dplat(36)='f16',     dsis(36)='ssmis_f16',          dval(36)=0.0, dthin(36)=1, dsfcalc(36)=0,
   dfile(37)='ssmisbufr', dtype(37)='ssmis_env', dplat(37)='f16',     dsis(37)='ssmis_f16',          dval(37)=0.0, dthin(37)=1, dsfcalc(37)=0,
   dfile(38)='gsnd1bufr', dtype(38)='sndrd1',    dplat(38)='g12',     dsis(38)='sndrD1_g12',         dval(38)=0.0, dthin(38)=1, dsfcalc(38)=0,
   dfile(39)='gsnd1bufr', dtype(39)='sndrd2',    dplat(39)='g12',     dsis(39)='sndrD2_g12',         dval(39)=0.0, dthin(39)=1, dsfcalc(39)=0,
   dfile(40)='gsnd1bufr', dtype(40)='sndrd3',    dplat(40)='g12',     dsis(40)='sndrD3_g12',         dval(40)=0.0, dthin(40)=1, dsfcalc(40)=0,
   dfile(41)='gsnd1bufr', dtype(41)='sndrd4',    dplat(41)='g12',     dsis(41)='sndrD4_g12',         dval(41)=0.0, dthin(41)=1, dsfcalc(41)=0,
   dfile(42)='gsnd1bufr', dtype(42)='sndrd1',    dplat(42)='g11',     dsis(42)='sndrD1_g11',         dval(42)=0.0, dthin(42)=1, dsfcalc(42)=0,
   dfile(43)='gsnd1bufr', dtype(43)='sndrd2',    dplat(43)='g11',     dsis(43)='sndrD2_g11',         dval(43)=0.0, dthin(43)=1, dsfcalc(43)=0,
   dfile(44)='gsnd1bufr', dtype(44)='sndrd3',    dplat(44)='g11',     dsis(44)='sndrD3_g11',         dval(44)=0.0, dthin(44)=1, dsfcalc(44)=0,
   dfile(45)='gsnd1bufr', dtype(45)='sndrd4',    dplat(45)='g11',     dsis(45)='sndrD4_g11',         dval(45)=0.0, dthin(45)=1, dsfcalc(45)=0,
   dfile(46)='gsnd1bufr', dtype(46)='sndrd1',    dplat(46)='g13',     dsis(46)='sndrD1_g13',         dval(46)=0.0, dthin(46)=1, dsfcalc(46)=0,
   dfile(47)='gsnd1bufr', dtype(47)='sndrd2',    dplat(47)='g13',     dsis(47)='sndrD2_g13',         dval(47)=0.0, dthin(47)=1, dsfcalc(47)=0,
   dfile(48)='gsnd1bufr', dtype(48)='sndrd3',    dplat(48)='g13',     dsis(48)='sndrD3_g13',         dval(48)=0.0, dthin(48)=1, dsfcalc(48)=0,
   dfile(49)='gsnd1bufr', dtype(49)='sndrd4',    dplat(49)='g13',     dsis(49)='sndrD4_g13',         dval(49)=0.0, dthin(49)=1, dsfcalc(49)=0,
   dfile(50)='iasibufr',  dtype(50)='iasi',      dplat(50)='metop-a', dsis(50)='iasi616_metop-a',    dval(50)=0.0, dthin(50)=1, dsfcalc(50)=1,
   dfile(51)='gomebufr',  dtype(51)='gome',      dplat(51)='metop-a', dsis(51)='gome_metop-a',       dval(51)=0.0, dthin(51)=2, dsfcalc(51)=0,
   dfile(52)='omibufr',   dtype(52)='omi',       dplat(52)='aura',    dsis(52)='omi_aura',           dval(52)=0.0, dthin(52)=2, dsfcalc(52)=0,
   dfile(53)='sbuvbufr',  dtype(53)='sbuv2',     dplat(53)='n19',     dsis(53)='sbuv8_n19',          dval(53)=0.0, dthin(53)=0, dsfcalc(53)=0,
   dfile(54)='hirs4bufr', dtype(54)='hirs4',     dplat(54)='n19',     dsis(54)='hirs4_n19',          dval(54)=0.0, dthin(54)=1, dsfcalc(54)=1,
   dfile(55)='amsuabufr', dtype(55)='amsua',     dplat(55)='n19',     dsis(55)='amsua_n19',          dval(55)=0.0, dthin(55)=1, dsfcalc(55)=1,
   dfile(56)='mhsbufr',   dtype(56)='mhs',       dplat(56)='n19',     dsis(56)='mhs_n19',            dval(56)=0.0, dthin(56)=1, dsfcalc(56)=1,
   dfile(57)='tcvitl'     dtype(57)='tcp',       dplat(57)=' ',       dsis(57)='tcp',                dval(57)=0.0, dthin(57)=0, dsfcalc(57)=0,
   dfile(58)='seviribufr',dtype(58)='seviri',    dplat(58)='m08',     dsis(58)='seviri_m08',         dval(58)=0.0, dthin(58)=1, dsfcalc(58)=0,
   dfile(59)='seviribufr',dtype(59)='seviri',    dplat(59)='m09',     dsis(59)='seviri_m09',         dval(59)=0.0, dthin(59)=1, dsfcalc(59)=0,
   dfile(60)='seviribufr',dtype(60)='seviri',    dplat(60)='m10',     dsis(60)='seviri_m10',         dval(60)=0.0, dthin(60)=1, dsfcalc(60)=0,
   dfile(61)='hirs4bufr', dtype(61)='hirs4',     dplat(61)='metop-b', dsis(61)='hirs4_metop-b',      dval(61)=0.0, dthin(61)=1, dsfcalc(61)=0,
   dfile(62)='amsuabufr', dtype(62)='amsua',     dplat(62)='metop-b', dsis(62)='amsua_metop-b',      dval(62)=0.0, dthin(62)=1, dsfcalc(62)=0,
   dfile(63)='mhsbufr',   dtype(63)='mhs',       dplat(63)='metop-b', dsis(63)='mhs_metop-b',        dval(63)=0.0, dthin(63)=1, dsfcalc(63)=0,
   dfile(64)='iasibufr',  dtype(64)='iasi',      dplat(64)='metop-b', dsis(64)='iasi616_metop-b',    dval(64)=0.0, dthin(64)=1, dsfcalc(64)=0,
   dfile(65)='gomebufr',  dtype(65)='gome',      dplat(65)='metop-b', dsis(65)='gome_metop-b',       dval(65)=0.0, dthin(65)=2, dsfcalc(65)=0,
   dfile(66)='atmsbufr',  dtype(66)='atms',      dplat(66)='npp',     dsis(66)='atms_npp',           dval(66)=0.0, dthin(66)=1, dsfcalc(66)=0,
   dfile(67)='crisbufr',  dtype(67)='cris',      dplat(67)='npp',     dsis(67)='cris_npp',           dval(67)=0.0, dthin(67)=1, dsfcalc(67)=0,
   dfile(68)='mlsbufr',   dtype(68)='mls30',     dplat(68)='aura',    dsis(68)='mls30_aura',         dval(68)=0.0, dthin(68)=0, dsfcalc(68)=0,
   dfile(69)='oscatbufr', dtype(69)='uv',        dplat(69)=' ',       dsis(69)='uv',                 dval(69)=0.0, dthin(69)=0, dsfcalc(69)=0,
   $OBSINPUT
 /
  &SUPEROB_RADAR
   $SUPERRAD
 /
 &LAG_DATA
 /
 &HYBRID_ENSEMBLE
   l_hyb_ens=${HYBENS_GLOBAL},
   n_ens=${ENSEMBLE_SIZE_GLOBAL},
   uv_hyb_ens=${HYBENS_UV_GLOBAL},
   beta1_inv=${BETA1_INV_GLOBAL},
   s_ens_h=${HYBENS_HOR_SCALE_GLOBAL},
   s_ens_v=${HYBENS_VER_SCALE_GLOBAL},
   generate_ens=${GENERATE_ENS_GLOBAL},
   aniso_a_en=${HYBENS_ANISO_GLOBAL},
   nlon_ens=${LONA},
   nlat_ens=${NLAT},
   jcap_ens=${JCAP},
   jcap_ens_test=${JCAP},
 /
 &RAPIDREFRESH_CLDSURF
   dfi_radar_latent_heat_time_period=30.0,
 /
 &CHEM
 /
 &SINGLEOB_TEST
   maginnov=0.1,magoberr=0.1,oneob_type='t',
   oblat=45.,oblon=180.,obpres=1000.,obdattim=${adate},
   obhourset=0.,
   $SINGLEOB
 /"

# Define namelist for global run (lanczos minimization)

export global_lanczos_T62_namelist=" 

 &SETUP
   miter=2,niter(1)=50,niter(2)=50,
   niter_no_qc(1)=500,niter_no_qc(2)=500,
   write_diag(1)=.true.,write_diag(2)=.false.,write_diag(3)=.true.,
   gencode=82,qoption=2,
   factqmin=0.005,factqmax=0.005,deltim=$DELTIM,
   ndat=70,iguess=-1,
   oneobtest=.false.,retrieval=.false.,l_foto=.false.,
   use_pbl=.false.,use_compress=.false.,nsig_ext=10,gpstop=30.,
   lsqrtb=.true.,lcongrad=.true.,ltlint=.true.,ladtest=.true.,lgrtest=.false.,
   use_gfs_nemsio=.false.,lrun_subdirs=.true.,
   $SETUP
 /
 &GRIDOPTS
   JCAP=$JCAP,JCAP_B=$JCAP_B,NLAT=$NLAT,NLON=$LONA,nsig=$LEVS,
   regional=.false.,nlayers(63)=3,nlayers(64)=6,
   $GRIDOPTS
 /
 &BKGERR
   vs=0.7,
   hzscl=1.7,0.8,0.5,
   hswgt=0.45,0.3,0.25,
   bw=0.0,norsp=4,
   bkgv_flowdep=.true.,bkgv_rewgtfct=1.5,
   $BKGVERR
 /
 &ANBKGERR
   anisotropic=.false.,
   $ANBKGERR
 /
 &JCOPTS
   ljcpdry=.false.,bamp_jcpdry=2.5e7,
   $JCOPTS
 /
 &STRONGOPTS
   tlnmc_option=1,nstrong=1,nvmodes_keep=8,period_max=6.,period_width=1.5,
   baldiag_full=.true.,baldiag_inc=.true.,
   $STRONGOPTS
 /
 &OBSQC
   dfact=0.75,dfact1=3.0,noiqc=.false.,oberrflg=.false.,c_varqc=0.02,
   use_poq7=.true.,
   $OBSQC
 /
 &OBS_INPUT
   dmesh(1)=180.0,dmesh(2)=145.0,dmesh(3)=240.0,dmesh(4)=160.0,dmesh(5)=180.0,dmesh(6)=150.0,dmesh(7)=145.0,time_window_max=3.0,
   dfile(01)='prepbufr',  dtype(01)='ps',        dplat(01)=' ',       dsis(01)='ps',                 dval(01)=1.0, dthin(01)=0, dsfcalc(01)=0,
   dfile(02)='prepbufr'   dtype(02)='t',         dplat(02)=' ',       dsis(02)='t',                  dval(02)=1.0, dthin(02)=0, dsfcalc(02)=0,
   dfile(03)='prepbufr',  dtype(03)='q',         dplat(03)=' ',       dsis(03)='q',                  dval(03)=1.0, dthin(03)=0, dsfcalc(03)=0,
   dfile(04)='prepbufr',  dtype(04)='pw',        dplat(04)=' ',       dsis(04)='pw',                 dval(04)=1.0, dthin(04)=0, dsfcalc(04)=0,
   dfile(05)='satwndbufr',    dtype(05)='uv',        dplat(05)=' ',       dsis(05)='uv',                 dval(05)=1.0, dthin(05)=0, dsfcalc(05)=0,
   dfile(06)='prepbufr',  dtype(06)='uv',        dplat(06)=' ',       dsis(06)='uv',                 dval(06)=1.0, dthin(06)=0, dsfcalc(06)=0,
   dfile(07)='prepbufr',  dtype(07)='spd',       dplat(07)=' ',       dsis(07)='spd',                dval(07)=1.0, dthin(07)=0, dsfcalc(07)=0,
   dfile(08)='prepbufr',  dtype(08)='dw',        dplat(08)=' ',       dsis(08)='dw',                 dval(08)=1.0, dthin(08)=0, dsfcalc(08)=0,
   dfile(09)='radarbufr', dtype(09)='rw',        dplat(09)=' ',       dsis(09)='rw',                 dval(09)=1.0, dthin(09)=0, dsfcalc(09)=0,
   dfile(10)='prepbufr',  dtype(10)='sst',       dplat(10)=' ',       dsis(10)='sst',                dval(10)=1.0, dthin(10)=0, dsfcalc(10)=0,
   dfile(11)='gpsrobufr', dtype(11)='$gps_dtype',   dplat(11)=' ',       dsis(11)='gps',            dval(11)=1.0, dthin(11)=0, dsfcalc(11)=0,
   dfile(12)='ssmirrbufr',dtype(12)='pcp_ssmi',  dplat(12)='dmsp',    dsis(12)='pcp_ssmi',           dval(12)=1.0, dthin(12)=-1,dsfcalc(12)=0,
   dfile(13)='tmirrbufr', dtype(13)='pcp_tmi',   dplat(13)='trmm',    dsis(13)='pcp_tmi',            dval(13)=1.0, dthin(13)=-1,dsfcalc(13)=0,
   dfile(14)='sbuvbufr',  dtype(14)='sbuv2',     dplat(14)='n16',     dsis(14)='sbuv8_n16',          dval(14)=1.0, dthin(14)=0, dsfcalc(14)=0,
   dfile(15)='sbuvbufr',  dtype(15)='sbuv2',     dplat(15)='n17',     dsis(15)='sbuv8_n17',          dval(15)=1.0, dthin(15)=0, dsfcalc(15)=0,
   dfile(16)='sbuvbufr',  dtype(16)='sbuv2',     dplat(16)='n18',     dsis(16)='sbuv8_n18',          dval(16)=1.0, dthin(16)=0, dsfcalc(16)=0,
   dfile(17)='hirs2bufr', dtype(17)='hirs2',     dplat(17)='n14',     dsis(17)='hirs2_n14',          dval(17)=6.0, dthin(17)=1, dsfcalc(17)=1,
   dfile(18)='hirs3bufr', dtype(18)='hirs3',     dplat(18)='n16',     dsis(18)='hirs3_n16',          dval(18)=0.0, dthin(18)=1, dsfcalc(18)=1,
   dfile(19)='hirs3bufr', dtype(19)='hirs3',     dplat(19)='n17',     dsis(19)='hirs3_n17',          dval(19)=6.0, dthin(19)=1, dsfcalc(19)=1,
   dfile(20)='hirs4bufr', dtype(20)='hirs4',     dplat(20)='n18',     dsis(20)='hirs4_n18',          dval(20)=0.0, dthin(20)=1, dsfcalc(20)=1,
   dfile(21)='hirs4bufr', dtype(21)='hirs4',     dplat(21)='metop-a', dsis(21)='hirs4_metop-a',      dval(21)=6.0, dthin(21)=1, dsfcalc(21)=1,
   dfile(22)='gsndrbufr', dtype(22)='sndr',      dplat(22)='g11',     dsis(22)='sndr_g11',           dval(22)=0.0, dthin(22)=1, dsfcalc(22)=0,
   dfile(23)='gsndrbufr', dtype(23)='sndr',      dplat(23)='g12',     dsis(23)='sndr_g12',           dval(23)=0.0, dthin(23)=1, dsfcalc(23)=0,
   dfile(24)='gimgrbufr', dtype(24)='goes_img',  dplat(24)='g11',     dsis(24)='imgr_g11',           dval(24)=0.0, dthin(24)=1, dsfcalc(24)=0,
   dfile(25)='gimgrbufr', dtype(25)='goes_img',  dplat(25)='g12',     dsis(25)='imgr_g12',           dval(25)=0.0, dthin(25)=1, dsfcalc(25)=0,
   dfile(26)='airsbufr',  dtype(26)='airs',      dplat(26)='aqua',    dsis(26)='airs281SUBSET_aqua', dval(26)=20.0,dthin(26)=1, dsfcalc(26)=1,
   dfile(27)='msubufr',   dtype(27)='msu',       dplat(27)='n14',     dsis(27)='msu_n14',            dval(27)=2.0, dthin(27)=2, dsfcalc(27)=1,
   dfile(28)='amsuabufr', dtype(28)='amsua',     dplat(28)='n15',     dsis(28)='amsua_n15',          dval(28)=10.0,dthin(28)=2, dsfcalc(28)=1,
   dfile(29)='amsuabufr', dtype(29)='amsua',     dplat(29)='n16',     dsis(29)='amsua_n16',          dval(29)=0.0, dthin(29)=2, dsfcalc(29)=1,
   dfile(30)='amsuabufr', dtype(30)='amsua',     dplat(30)='n17',     dsis(30)='amsua_n17',          dval(30)=0.0, dthin(30)=2, dsfcalc(30)=1,
   dfile(31)='amsuabufr', dtype(31)='amsua',     dplat(31)='n18',     dsis(31)='amsua_n18',          dval(31)=10.0,dthin(31)=2, dsfcalc(31)=1,
   dfile(32)='amsuabufr', dtype(32)='amsua',     dplat(32)='metop-a', dsis(32)='amsua_metop-a',      dval(32)=10.0,dthin(32)=2, dsfcalc(32)=1,
   dfile(33)='airsbufr',  dtype(33)='amsua',     dplat(33)='aqua',    dsis(33)='amsua_aqua',         dval(33)=5.0, dthin(33)=2, dsfcalc(33)=1,
   dfile(34)='amsubbufr', dtype(34)='amsub',     dplat(34)='n15',     dsis(34)='amsub_n15',          dval(34)=3.0, dthin(34)=3, dsfcalc(34)=1,
   dfile(35)='amsubbufr', dtype(35)='amsub',     dplat(35)='n16',     dsis(35)='amsub_n16',          dval(35)=3.0, dthin(35)=3, dsfcalc(35)=1,
   dfile(36)='amsubbufr', dtype(36)='amsub',     dplat(36)='n17',     dsis(36)='amsub_n17',          dval(36)=3.0, dthin(36)=3, dsfcalc(36)=1,
   dfile(37)='mhsbufr',   dtype(37)='mhs',       dplat(37)='n18',     dsis(37)='mhs_n18',            dval(37)=3.0, dthin(37)=3, dsfcalc(37)=1,
   dfile(38)='mhsbufr',   dtype(38)='mhs',       dplat(38)='metop-a', dsis(38)='mhs_metop-a',        dval(38)=3.0, dthin(38)=3, dsfcalc(38)=1,
   dfile(39)='ssmitbufr', dtype(39)='ssmi',      dplat(39)='f13',     dsis(39)='ssmi_f13',           dval(39)=0.0, dthin(39)=4, dsfcalc(39)=0,
   dfile(40)='ssmitbufr', dtype(40)='ssmi',      dplat(40)='f14',     dsis(40)='ssmi_f14',           dval(40)=0.0, dthin(40)=4, dsfcalc(40)=0,
   dfile(41)='ssmitbufr', dtype(41)='ssmi',      dplat(41)='f15',     dsis(41)='ssmi_f15',           dval(41)=0.0, dthin(41)=4, dsfcalc(41)=0,
   dfile(42)='amsrebufr', dtype(42)='amsre_low', dplat(42)='aqua',    dsis(42)='amsre_aqua',         dval(42)=0.0, dthin(42)=4, dsfcalc(42)=1,
   dfile(43)='amsrebufr', dtype(43)='amsre_mid', dplat(43)='aqua',    dsis(43)='amsre_aqua',         dval(43)=0.0, dthin(43)=4, dsfcalc(43)=1,
   dfile(44)='amsrebufr', dtype(44)='amsre_hig', dplat(44)='aqua',    dsis(44)='amsre_aqua',         dval(44)=0.0, dthin(44)=4, dsfcalc(44)=1,
   dfile(45)='ssmisbufr', dtype(45)='ssmis',     dplat(45)='f16',     dsis(45)='ssmis_f16',          dval(45)=0.0, dthin(45)=4, dsfcalc(45)=1,
   dfile(46)='gsnd1bufr', dtype(46)='sndrd1',    dplat(46)='g12',     dsis(46)='sndrD1_g12',         dval(46)=1.5, dthin(46)=5, dsfcalc(46)=0,
   dfile(47)='gsnd1bufr', dtype(47)='sndrd2',    dplat(47)='g12',     dsis(47)='sndrD2_g12',         dval(47)=1.5, dthin(47)=5, dsfcalc(47)=0,
   dfile(48)='gsnd1bufr', dtype(48)='sndrd3',    dplat(48)='g12',     dsis(48)='sndrD3_g12',         dval(48)=1.5, dthin(48)=5, dsfcalc(48)=0,
   dfile(49)='gsnd1bufr', dtype(49)='sndrd4',    dplat(49)='g12',     dsis(49)='sndrD4_g12',         dval(49)=1.5, dthin(49)=5, dsfcalc(49)=0,
   dfile(50)='gsnd1bufr', dtype(50)='sndrd1',    dplat(50)='g11',     dsis(50)='sndrD1_g11',         dval(50)=1.5, dthin(50)=5, dsfcalc(50)=0,
   dfile(51)='gsnd1bufr', dtype(51)='sndrd2',    dplat(51)='g11',     dsis(51)='sndrD2_g11',         dval(51)=1.5, dthin(51)=5, dsfcalc(51)=0,
   dfile(52)='gsnd1bufr', dtype(52)='sndrd3',    dplat(52)='g11',     dsis(52)='sndrD3_g11',         dval(52)=1.5, dthin(52)=5, dsfcalc(52)=0,
   dfile(53)='gsnd1bufr', dtype(53)='sndrd4',    dplat(53)='g11',     dsis(53)='sndrD4_g11',         dval(53)=1.5, dthin(53)=5, dsfcalc(53)=0,
   dfile(54)='gsnd1bufr', dtype(54)='sndrd1',    dplat(54)='g13',     dsis(54)='sndrD1_g13',         dval(54)=1.5, dthin(54)=5, dsfcalc(54)=0,
   dfile(55)='gsnd1bufr', dtype(55)='sndrd2',    dplat(55)='g13',     dsis(55)='sndrD2_g13',         dval(55)=1.5, dthin(55)=5, dsfcalc(55)=0,
   dfile(56)='gsnd1bufr', dtype(56)='sndrd3',    dplat(56)='g13',     dsis(56)='sndrD3_g13',         dval(56)=1.5, dthin(56)=5, dsfcalc(56)=0,
   dfile(57)='gsnd1bufr', dtype(57)='sndrd4',    dplat(57)='g13',     dsis(57)='sndrD4_g13',         dval(57)=1.5, dthin(57)=5, dsfcalc(57)=0,
   dfile(58)='iasibufr',  dtype(58)='iasi',      dplat(58)='metop-a', dsis(58)='iasi616_metop-a',    dval(58)=20.0,dthin(58)=1, dsfcalc(58)=1,
   dfile(59)='gomebufr',  dtype(59)='gome',      dplat(59)='metop-a', dsis(59)='gome_metop-a',       dval(59)=1.0, dthin(59)=6, dsfcalc(59)=0,
   dfile(60)='omibufr',   dtype(60)='omi',       dplat(60)='aura',    dsis(60)='omi_aura',           dval(60)=1.0, dthin(60)=6, dsfcalc(60)=0,
   dfile(61)='sbuvbufr',  dtype(61)='sbuv2',     dplat(61)='n19',     dsis(61)='sbuv8_n19',          dval(61)=1.0, dthin(61)=0, dsfcalc(61)=0,
   dfile(62)='hirs4bufr', dtype(62)='hirs4',     dplat(62)='n19',     dsis(62)='hirs4_n19',          dval(62)=6.0, dthin(62)=1, dsfcalc(62)=1,
   dfile(63)='amsuabufr', dtype(63)='amsua',     dplat(63)='n19',     dsis(63)='amsua_n19',          dval(63)=10.0,dthin(63)=2, dsfcalc(63)=1,
   dfile(64)='mhsbufr',   dtype(64)='mhs',       dplat(64)='n19',     dsis(64)='mhs_n19',            dval(64)=3.0, dthin(64)=3, dsfcalc(64)=1,
   dfile(65)='tcvitl'     dtype(65)='tcp',       dplat(65)=' ',       dsis(65)='tcp',                dval(65)=1.0, dthin(65)=0, dsfcalc(65)=0,
   dfile(66)='mlsbufr',   dtype(66)='mls30',     dplat(66)='aura',    dsis(66)='mls30_aura',         dval(66)=1.0, dthin(66)=0, dsfcalc(66)=0,
   dfile(67)='seviribufr',dtype(67)='seviri',    dplat(67)='m08',     dsis(67)='seviri_m08',         dval(67)=0.0, dthin(67)=7, dsfcalc(67)=0,
   dfile(68)='seviribufr',dtype(68)='seviri',    dplat(68)='m09',     dsis(68)='seviri_m09',         dval(68)=0.0, dthin(68)=7, dsfcalc(68)=0,
   dfile(69)='seviribufr',dtype(69)='seviri',    dplat(69)='m10',     dsis(69)='seviri_m10',         dval(69)=0.0, dthin(69)=7, dsfcalc(69)=0,
   dfile(70)='oscatbufr', dtype(70)='uv',        dplat(70)=' ',       dsis(70)='uv',                 dval(70)=1.0, dthin(70)=0, dsfcalc(70)=0,
   $OBSINPUT
 /
  &SUPEROB_RADAR
   $SUPERRAD
 /
 &LAG_DATA
 /
 &HYBRID_ENSEMBLE
 /
 &RAPIDREFRESH_CLDSURF
   dfi_radar_latent_heat_time_period=30.0,
 /
 &CHEM
 /
 &SINGLEOB_TEST
   maginnov=0.1,magoberr=0.1,oneob_type='t',
   oblat=45.,oblon=180.,obpres=1000.,obdattim=${adate},
   obhourset=0.,
   $SINGLEOB
 /"

export global_hybrid_T126_namelist="

 &SETUP
   miter=1,niter(1)=5,niter(2)=150,
   niter_no_qc(1)=50,niter_no_qc(2)=0,
   write_diag(1)=.true.,write_diag(2)=.false.,write_diag(3)=.true.,
   qoption=2,
   gencode=82,factqmin=0.1,factqmax=0.1,deltim=$DELTIM,
   ndat=75,iguess=-1,
   oneobtest=.false.,retrieval=.false.,l_foto=.false.,
   use_pbl=.false.,use_prepb_satwnd=.false.,
   nhr_assimilation=6,lrun_subdirs=.true.,
   $SETUP
 /
 &GRIDOPTS
   JCAP_B=$JCAP_B,JCAP=$JCAP,NLAT=$NLAT,NLON=$LONA,nsig=$LEVS,
   regional=.false.,nlayers(63)=3,nlayers(64)=6,
   $GRIDOPTS
 /
 &BKGERR
   hzscl=1.7,0.8,0.5,
   hswgt=0.45,0.3,0.25,

   bw=0.0,norsp=4,
   bkgv_flowdep=.true.,bkgv_rewgtfct=1.5,
   bkgv_write=.false.,
   $BKGVERR
 /
 &ANBKGERR
   anisotropic=.false.,
   $ANBKGERR
 /
 &JCOPTS
   ljcdfi=.false.,alphajc=0.0,ljcpdry=.true.,bamp_jcpdry=2.5e7,
   $JCOPTS
 /
 &STRONGOPTS
   tlnmc_option=1,nstrong=1,nvmodes_keep=8,period_max=6.,period_width=1.5,
   baldiag_full=.true.,baldiag_inc=.true.,
   $STRONGOPTS
 /
 &OBSQC
   dfact=0.75,dfact1=3.0,noiqc=.true.,oberrflg=.false.,c_varqc=0.02,
   use_poq7=.true.,
   $OBSQC
 /
 &OBS_INPUT
   dmesh(1)=145.0,dmesh(2)=150.0,time_window_max=3.0,
   dfile(01)='prepbufr',  dtype(01)='ps',        dplat(01)=' ',       dsis(01)='ps',              dval(01)=0.0,  dthin(01)=0,  dsfcalc(01)=0,
   dfile(02)='prepbufr'   dtype(02)='t',         dplat(02)=' ',       dsis(02)='t',               dval(02)=0.0,  dthin(02)=0,  dsfcalc(02)=0,
   dfile(03)='prepbufr',  dtype(03)='q',         dplat(03)=' ',       dsis(03)='q',               dval(03)=0.0,  dthin(03)=0,  dsfcalc(03)=0,
   dfile(04)='prepbufr',  dtype(04)='pw',        dplat(04)=' ',       dsis(04)='pw',              dval(04)=0.0,  dthin(04)=0,  dsfcalc(04)=0,
   dfile(05)='prepbufr',  dtype(05)='uv',        dplat(05)=' ',       dsis(05)='uv',              dval(05)=0.0,  dthin(05)=0,  dsfcalc(05)=0,
   dfile(06)='satwndbufr',dtype(06)='uv',        dplat(06)=' ',       dsis(06)='uv',              dval(06)=0.0,  dthin(06)=0,  dsfcalc(06)=0,
   dfile(07)='prepbufr',  dtype(07)='spd',       dplat(07)=' ',       dsis(07)='spd',             dval(07)=0.0,  dthin(07)=0,  dsfcalc(07)=0,
   dfile(08)='prepbufr',  dtype(08)='dw',        dplat(08)=' ',       dsis(08)='dw',              dval(08)=0.0,  dthin(08)=0,  dsfcalc(08)=0,
   dfile(09)='radarbufr', dtype(09)='rw',        dplat(09)=' ',       dsis(09)='rw',              dval(09)=0.0,  dthin(09)=0,  dsfcalc(09)=0,
   dfile(10)='prepbufr',  dtype(10)='sst',       dplat(10)=' ',       dsis(10)='sst',             dval(10)=0.0,  dthin(10)=0,  dsfcalc(10)=0,
   dfile(11)='gpsrobufr', dtype(11)='gps_bnd',   dplat(11)=' ',       dsis(11)='gps',             dval(11)=0.0,  dthin(11)=0,  dsfcalc(11)=0,
   dfile(12)='ssmirrbufr',dtype(12)='pcp_ssmi',  dplat(12)='dmsp',    dsis(12)='pcp_ssmi',        dval(12)=0.0,  dthin(12)=-1, dsfcalc(12)=0,
   dfile(13)='tmirrbufr', dtype(13)='pcp_tmi',   dplat(13)='trmm',    dsis(13)='pcp_tmi',         dval(13)=0.0,  dthin(13)=-1, dsfcalc(13)=0,
   dfile(14)='sbuvbufr',  dtype(14)='sbuv2',     dplat(14)='n16',     dsis(14)='sbuv8_n16',       dval(14)=0.0,  dthin(14)=0,  dsfcalc(14)=0,
   dfile(15)='sbuvbufr',  dtype(15)='sbuv2',     dplat(15)='n17',     dsis(15)='sbuv8_n17',       dval(15)=0.0,  dthin(15)=0,  dsfcalc(15)=0,
   dfile(16)='sbuvbufr',  dtype(16)='sbuv2',     dplat(16)='n18',     dsis(16)='sbuv8_n18',       dval(16)=0.0,  dthin(16)=0,  dsfcalc(16)=0,
   dfile(17)='hirs3bufr', dtype(17)='hirs3',     dplat(17)='n17',     dsis(17)='hirs3_n17',       dval(17)=0.0,  dthin(17)=1,  dsfcalc(17)=0,
   dfile(18)='hirs4bufr', dtype(18)='hirs4',     dplat(18)='metop-a', dsis(18)='hirs4_metop-a',   dval(18)=0.0,  dthin(18)=1,  dsfcalc(18)=1,
   dfile(19)='gimgrbufr', dtype(19)='goes_img',  dplat(19)='g11',     dsis(19)='imgr_g11',        dval(19)=0.0,  dthin(19)=1,  dsfcalc(19)=0,
   dfile(20)='gimgrbufr', dtype(20)='goes_img',  dplat(20)='g12',     dsis(20)='imgr_g12',        dval(20)=0.0,  dthin(20)=1,  dsfcalc(20)=0,
   dfile(21)='airsbufr',  dtype(21)='airs',      dplat(21)='aqua',    dsis(21)='airs281SUBSET_aqua',dval(21)=0.0,dthin(21)=1, dsfcalc(21)=1,
   dfile(22)='amsuabufr', dtype(22)='amsua',     dplat(22)='n15',     dsis(22)='amsua_n15',       dval(22)=0.0,  dthin(22)=1,  dsfcalc(22)=1,
   dfile(23)='amsuabufr', dtype(23)='amsua',     dplat(23)='n18',     dsis(23)='amsua_n18',       dval(23)=0.0,  dthin(23)=1,  dsfcalc(23)=1,
   dfile(24)='amsuabufr', dtype(24)='amsua',     dplat(24)='metop-a', dsis(24)='amsua_metop-a',   dval(24)=0.0,  dthin(24)=1,  dsfcalc(24)=1,
   dfile(25)='airsbufr',  dtype(25)='amsua',     dplat(25)='aqua',    dsis(25)='amsua_aqua',      dval(25)=0.0,  dthin(25)=1,  dsfcalc(25)=1,
   dfile(26)='amsubbufr', dtype(26)='amsub',     dplat(26)='n17',     dsis(26)='amsub_n17',       dval(26)=0.0,  dthin(26)=1,  dsfcalc(26)=1,
   dfile(27)='mhsbufr',   dtype(27)='mhs',       dplat(27)='n18',     dsis(27)='mhs_n18',         dval(27)=0.0,  dthin(27)=1,  dsfcalc(27)=1,
   dfile(28)='mhsbufr',   dtype(28)='mhs',       dplat(28)='metop-a', dsis(28)='mhs_metop-a',     dval(28)=0.0,  dthin(28)=1,  dsfcalc(28)=1,
   dfile(29)='ssmitbufr', dtype(29)='ssmi',      dplat(29)='f14',     dsis(29)='ssmi_f14',        dval(29)=0.0,  dthin(29)=1,  dsfcalc(29)=0,
   dfile(30)='ssmitbufr', dtype(30)='ssmi',      dplat(30)='f15',     dsis(30)='ssmi_f15',        dval(30)=0.0,  dthin(30)=1,  dsfcalc(30)=0,
   dfile(31)='amsrebufr', dtype(31)='amsre_low', dplat(31)='aqua',    dsis(31)='amsre_aqua',      dval(31)=0.0,  dthin(31)=1,  dsfcalc(31)=0,
   dfile(32)='amsrebufr', dtype(32)='amsre_mid', dplat(32)='aqua',    dsis(32)='amsre_aqua',      dval(32)=0.0,  dthin(32)=1,  dsfcalc(32)=0,
   dfile(33)='amsrebufr', dtype(33)='amsre_hig', dplat(33)='aqua',    dsis(33)='amsre_aqua',      dval(33)=0.0,  dthin(33)=1,  dsfcalc(33)=0,
   dfile(34)='ssmisbufr', dtype(34)='ssmis_las', dplat(34)='f16',     dsis(34)='ssmis_f16',       dval(34)=0.0,  dthin(34)=1,  dsfcalc(34)=0,
   dfile(35)='ssmisbufr', dtype(35)='ssmis_uas', dplat(35)='f16',     dsis(35)='ssmis_f16',       dval(35)=0.0,  dthin(35)=1,  dsfcalc(35)=0,
   dfile(36)='ssmisbufr', dtype(36)='ssmis_img', dplat(36)='f16',     dsis(36)='ssmis_f16',       dval(36)=0.0,  dthin(36)=1,  dsfcalc(36)=0,
   dfile(37)='ssmisbufr', dtype(37)='ssmis_env', dplat(37)='f16',     dsis(37)='ssmis_f16',       dval(37)=0.0,  dthin(37)=1,  dsfcalc(37)=0,
   dfile(38)='gsnd1bufr', dtype(38)='sndrd1',    dplat(38)='g12',     dsis(38)='sndrD1_g12',      dval(38)=0.0,  dthin(38)=1,  dsfcalc(38)=0,
   dfile(39)='gsnd1bufr', dtype(39)='sndrd2',    dplat(39)='g12',     dsis(39)='sndrD2_g12',      dval(39)=0.0,  dthin(39)=1,  dsfcalc(39)=0,
   dfile(40)='gsnd1bufr', dtype(40)='sndrd3',    dplat(40)='g12',     dsis(40)='sndrD3_g12',      dval(40)=0.0,  dthin(40)=1,  dsfcalc(40)=0,
   dfile(41)='gsnd1bufr', dtype(41)='sndrd4',    dplat(41)='g12',     dsis(41)='sndrD4_g12',      dval(41)=0.0,  dthin(41)=1,  dsfcalc(41)=0,
   dfile(42)='gsnd1bufr', dtype(42)='sndrd1',    dplat(42)='g11',     dsis(42)='sndrD1_g11',      dval(42)=0.0,  dthin(42)=1,  dsfcalc(42)=0,
   dfile(43)='gsnd1bufr', dtype(43)='sndrd2',    dplat(43)='g11',     dsis(43)='sndrD2_g11',      dval(43)=0.0,  dthin(43)=1,  dsfcalc(43)=0,
   dfile(44)='gsnd1bufr', dtype(44)='sndrd3',    dplat(44)='g11',     dsis(44)='sndrD3_g11',      dval(44)=0.0,  dthin(44)=1,  dsfcalc(44)=0,
   dfile(45)='gsnd1bufr', dtype(45)='sndrd4',    dplat(45)='g11',     dsis(45)='sndrD4_g11',      dval(45)=0.0,  dthin(45)=1,  dsfcalc(45)=0,
   dfile(46)='gsnd1bufr', dtype(46)='sndrd1',    dplat(46)='g13',     dsis(46)='sndrD1_g13',      dval(46)=0.0,  dthin(46)=1,  dsfcalc(46)=0,
   dfile(47)='gsnd1bufr', dtype(47)='sndrd2',    dplat(47)='g13',     dsis(47)='sndrD2_g13',      dval(47)=0.0,  dthin(47)=1,  dsfcalc(47)=0,
   dfile(48)='gsnd1bufr', dtype(48)='sndrd3',    dplat(48)='g13',     dsis(48)='sndrD3_g13',      dval(48)=0.0,  dthin(48)=1,  dsfcalc(48)=0,
   dfile(49)='gsnd1bufr', dtype(49)='sndrd4',    dplat(49)='g13',     dsis(49)='sndrD4_g13',      dval(49)=0.0,  dthin(49)=1,  dsfcalc(49)=0,
   dfile(50)='iasibufr',  dtype(50)='iasi',      dplat(50)='metop-a', dsis(50)='iasi616_metop-a', dval(50)=0.0,  dthin(50)=1,  dsfcalc(50)=1,
   dfile(51)='gomebufr',  dtype(51)='gome',      dplat(51)='metop-a', dsis(51)='gome_metop-a',    dval(51)=0.0,  dthin(51)=2,  dsfcalc(51)=0,
   dfile(52)='omibufr',   dtype(52)='omi',       dplat(52)='aura',    dsis(52)='omi_aura',        dval(52)=0.0,  dthin(52)=2,  dsfcalc(52)=0,
   dfile(53)='sbuvbufr',  dtype(53)='sbuv2',     dplat(53)='n19',     dsis(53)='sbuv8_n19',       dval(53)=0.0,  dthin(53)=0,  dsfcalc(53)=0,
   dfile(54)='hirs4bufr', dtype(54)='hirs4',     dplat(54)='n19',     dsis(54)='hirs4_n19',       dval(54)=0.0,  dthin(54)=1,  dsfcalc(54)=1,
   dfile(55)='amsuabufr', dtype(55)='amsua',     dplat(55)='n19',     dsis(55)='amsua_n19',       dval(55)=0.0,  dthin(55)=1,  dsfcalc(55)=1,
   dfile(56)='mhsbufr',   dtype(56)='mhs',       dplat(56)='n19',     dsis(56)='mhs_n19',         dval(56)=0.0,  dthin(56)=1,  dsfcalc(56)=1,
   dfile(57)='tcvitl'     dtype(57)='tcp',       dplat(57)=' ',       dsis(57)='tcp',             dval(57)=0.0,  dthin(57)=0,  dsfcalc(57)=0,
   dfile(58)='seviribufr',dtype(58)='seviri',    dplat(58)='m08',     dsis(58)='seviri_m08',      dval(58)=0.0,  dthin(58)=1,  dsfcalc(58)=0,
   dfile(59)='seviribufr',dtype(59)='seviri',    dplat(59)='m09',     dsis(59)='seviri_m09',      dval(59)=0.0,  dthin(59)=1,  dsfcalc(59)=0,
   dfile(60)='seviribufr',dtype(60)='seviri',    dplat(60)='m10',     dsis(60)='seviri_m10',      dval(60)=0.0,  dthin(60)=1,  dsfcalc(60)=0,
   dfile(61)='hirs4bufr', dtype(61)='hirs4',     dplat(61)='metop-b', dsis(61)='hirs4_metop-b',   dval(61)=0.0,  dthin(61)=1,  dsfcalc(61)=0,
   dfile(62)='amsuabufr', dtype(62)='amsua',     dplat(62)='metop-b', dsis(62)='amsua_metop-b',   dval(62)=0.0,  dthin(62)=1,  dsfcalc(62)=0,
   dfile(63)='mhsbufr',   dtype(63)='mhs',       dplat(63)='metop-b', dsis(63)='mhs_metop-b',     dval(63)=0.0,  dthin(63)=1,  dsfcalc(63)=0,
   dfile(64)='iasibufr',  dtype(64)='iasi',      dplat(64)='metop-b', dsis(64)='iasi616_metop-b', dval(64)=0.0,  dthin(64)=1,  dsfcalc(64)=0,
   dfile(65)='gomebufr',  dtype(65)='gome',      dplat(65)='metop-b', dsis(65)='gome_metop-b',    dval(65)=0.0,  dthin(65)=2,  dsfcalc(65)=0,
   dfile(66)='atmsbufr',  dtype(66)='atms',      dplat(66)='npp',     dsis(66)='atms_npp',        dval(66)=0.0,  dthin(66)=1,  dsfcalc(66)=0,
   dfile(67)='crisbufr',  dtype(67)='cris',      dplat(67)='npp',     dsis(67)='cris_npp',        dval(67)=0.0,  dthin(67)=1,  dsfcalc(67)=0,
   dfile(68)='gsnd1bufr', dtype(68)='sndrd1',    dplat(68)='g14',     dsis(68)='sndrD1_g14',      dval(68)=0.0,  dthin(68)=1,  dsfcalc(68)=0,
   dfile(69)='gsnd1bufr', dtype(69)='sndrd2',    dplat(69)='g14',     dsis(69)='sndrD2_g14',      dval(69)=0.0,  dthin(69)=1,  dsfcalc(69)=0,
   dfile(70)='gsnd1bufr', dtype(70)='sndrd3',    dplat(70)='g14',     dsis(70)='sndrD3_g14',      dval(70)=0.0,  dthin(70)=1,  dsfcalc(70)=0,
   dfile(71)='gsnd1bufr', dtype(71)='sndrd4',    dplat(71)='g14',     dsis(71)='sndrD4_g14',      dval(71)=0.0,  dthin(71)=1,  dsfcalc(71)=0,
   dfile(72)='gsnd1bufr', dtype(72)='sndrd1',    dplat(72)='g15',     dsis(72)='sndrD1_g15',      dval(72)=0.0,  dthin(72)=1,  dsfcalc(72)=0,
   dfile(73)='gsnd1bufr', dtype(73)='sndrd2',    dplat(73)='g15',     dsis(73)='sndrD2_g15',      dval(73)=0.0,  dthin(73)=1,  dsfcalc(73)=0,
   dfile(74)='gsnd1bufr', dtype(74)='sndrd3',    dplat(74)='g15',     dsis(74)='sndrD3_g15',      dval(74)=0.0,  dthin(74)=1,  dsfcalc(74)=0,
   dfile(75)='gsnd1bufr', dtype(75)='sndrd4',    dplat(75)='g15',     dsis(75)='sndrD4_g15',      dval(75)=0.0,  dthin(75)=1,  dsfcalc(75)=0,
   $OBSINPUT
 /
  &SUPEROB_RADAR
   $SUPERRAD
 /
 &LAG_DATA
   $LAGDATA
 /
 &HYBRID_ENSEMBLE
   l_hyb_ens=.true.,n_ens=20,beta1_inv=0.25,s_ens_h=800,s_ens_v=-0.7,generate_ens=.false.,uv_hyb_ens=.true.,jcap_ens=62,
   nlat_ens=94,nlon_ens=192,ANISO_A_EN=.false.,jcap_ens_test=62,oz_univ_static=.true.,readin_localization=.true.,
   write_ens_sprd=.false.,
   $HYBRID_ENSEMBLE
 /
 &RAPIDREFRESH_CLDSURF
   dfi_radar_latent_heat_time_period=30.0,
 /
 &CHEM

 /
 &SINGLEOB_TEST
   maginnov=0.1,magoberr=0.1,oneob_type='t',
   oblat=45.,oblon=180.,obpres=1000.,obdattim=${global_hybrid_T126_adate},
   obhourset=0.,
   $SINGLEOB
 /"

# Define namelist for RTMA runs

export RTMA_namelist="

 &SETUP
   miter=2,niter(1)=50,niter(2)=50,
   write_diag(1)=.true.,write_diag(2)=.true.,write_diag(3)=.true.,
   gencode=78,qoption=1,tsensible=.true.
   factqmin=1.0,factqmax=1.0,deltim=$DELTIM,
   ndat=9,iguess=-1,
   oneobtest=.false.,retrieval=.false.,
   diag_rad=.false.,diag_pcp=.false.,diag_ozone=.false.,diag_aero=.false.,
   nhr_assimilation=6,use_compress=.false.,lrun_subdirs=.true.,
   $SETUP
 /
 &GRIDOPTS
   JCAP=$JCAP,JCAP_B=$JCAP_B,NLAT=$NLAT,NLON=$LONA,nsig=$LEVS,
   wrf_nmm_regional=.false.,wrf_mass_regional=.false.,twodvar_regional=.true.,
   diagnostic_reg=.false.,
   filled_grid=.false.,half_grid=.true.,netcdf=.false.,
 /
 &BKGERR
   hzscl=1.414,1.000,0.707,
   vs=0.5,bw=0.0,
 /
 &ANBKGERR
   anisotropic=.true.,an_vs=0.5,ngauss=1,
   an_flen_u=-5.,an_flen_t=3.,an_flen_z=-200.,
   ifilt_ord=2,npass=3,normal=-200,grid_ratio=1.,nord_f2a=4,
   rtma_subdomain_option=.true.,triad4=.true.,nsmooth=0,nsmooth_shapiro=0,lreadnorm=.true.
 /
 &JCOPTS
 /
 &STRONGOPTS
   nstrong=1,nvmodes_keep=20,period_max=3.,
   baldiag_full=.true.,baldiag_inc=.true.,
 /
 &OBSQC
   dfact=0.75,dfact1=3.0,noiqc=.false.,oberrflg=.false.,c_varqc=0.02,vadfile='prepbufr',
   hilbert_curve=.true.,
 /
 &OBS_INPUT
   dmesh(1)=60.0,dmesh(2)=60.0,dmesh(3)=60.0,dmesh(4)=60.0,time_window_max=3.0,
   dfile(01)='prepbufr',  dtype(01)='ps',  dplat(01)=' ', dsis(01)='ps',  dval(01)=1.0,  dthin(01)=0,
   dfile(02)='prepbufr'   dtype(02)='t',   dplat(02)=' ', dsis(02)='t',   dval(02)=1.0,  dthin(02)=0,
   dfile(03)='prepbufr',  dtype(03)='q',   dplat(03)=' ', dsis(03)='q',   dval(03)=1.0,  dthin(03)=0,
   dfile(04)='prepbufr',  dtype(04)='uv',  dplat(04)=' ', dsis(04)='uv',  dval(04)=1.0,  dthin(04)=0,
   dfile(05)='satwndbufr',    dtype(05)='uv',  dplat(05)=' ', dsis(05)='uv',  dval(05)=1.0,  dthin(05)=0, 
   dfile(06)='prepbufr',  dtype(06)='spd', dplat(06)=' ', dsis(06)='spd', dval(06)=1.0,  dthin(06)=0,
   dfile(07)='prepbufr',  dtype(07)='gust',dplat(07)=' ', dsis(07)='gust',dval(07)=1.0,  dthin(07)=0,
   dfile(08)='prepbufr',  dtype(08)='vis', dplat(08)=' ', dsis(08)='vis', dval(08)=1.0,  dthin(08)=0,
   dfile(09)='oscatbufr', dtype(09)='uv',  dplat(09)=' ', dsis(09)='uv',  dval(09)=1.0,  dthin(09)=0, 
 /
 &SUPEROB_RADAR
 /
 &LAG_DATA
 /
 &HYBRID_ENSEMBLE
 /
 &RAPIDREFRESH_CLDSURF
   dfi_radar_latent_heat_time_period=30.0,
 /
 &CHEM
 /
 &SINGLEOB_TEST
   maginnov=0.1,magoberr=0.1,oneob_type='t',
   oblat=36.,oblon=260.,obpres=1000.,obdattim=${adate},
   obhourset=0.,
 /"

# Define namelist for arw binary run

export arw_binary_namelist="

 &SETUP
   miter=2,niter(1)=50,niter(2)=50,
   write_diag(1)=.true.,write_diag(2)=.false.,write_diag(3)=.true.,
   gencode=78,qoption=2,
   factqmin=0.0,factqmax=0.0,deltim=$DELTIM,
   ndat=62,iguess=-1,
   oneobtest=.false.,retrieval=.false.,
   nhr_assimilation=3,l_foto=.false.,
   use_pbl=.false.,use_compress=.false.,nsig_ext=13,gpstop=30.,
   lrun_subdirs=.true.,
   $SETUP
 /
 &GRIDOPTS
   JCAP=$JCAP,NLAT=$NLAT,NLON=$LONA,nsig=$LEVS,
   wrf_nmm_regional=.false.,wrf_mass_regional=.true.,diagnostic_reg=.false.,
   filled_grid=.false.,half_grid=.true.,netcdf=$NETCDF,
 /
 &BKGERR
   hzscl=0.373,0.746,1.50,
   vs=1.0,bw=0.,fstat=.true.,
 /
 &ANBKGERR
   anisotropic=.false.,an_vs=1.0,ngauss=1,
   an_flen_u=-5.,an_flen_t=3.,an_flen_z=-200.,
   ifilt_ord=2,npass=3,normal=-200,grid_ratio=4.,nord_f2a=4,
 /
 &JCOPTS
 /
 &STRONGOPTS
   nstrong=0,nvmodes_keep=20,period_max=3.,
   baldiag_full=.true.,baldiag_inc=.true.,
 /
 &OBSQC
   dfact=0.75,dfact1=3.0,noiqc=.false.,c_varqc=0.02,vadfile='prepbufr',
 /
 &OBS_INPUT
   dmesh(1)=120.0,dmesh(2)=60.0,dmesh(3)=60.0,dmesh(4)=60.0,dmesh(5)=120,time_window_max=1.5,
   dfile(01)='prepbufr',  dtype(01)='ps',        dplat(01)=' ',         dsis(01)='ps',                  dval(01)=1.0,  dthin(01)=0, dsfcalc(01)=0, 
   dfile(02)='prepbufr'   dtype(02)='t',         dplat(02)=' ',         dsis(02)='t',                   dval(02)=1.0,  dthin(02)=0, dsfcalc(02)=0,
   dfile(03)='prepbufr',  dtype(03)='q',         dplat(03)=' ',         dsis(03)='q',                   dval(03)=1.0,  dthin(03)=0, dsfcalc(03)=0,
   dfile(04)='prepbufr',  dtype(04)='uv',        dplat(04)=' ',         dsis(04)='uv',                  dval(04)=1.0,  dthin(04)=0, dsfcalc(04)=0,
   dfile(05)='satwndbufr',    dtype(05)='uv',        dplat(05)=' ',         dsis(05)='uv',                  dval(05)=1.0,  dthin(05)=0, dsfcalc(05)=0,
   dfile(06)='prepbufr',  dtype(06)='spd',       dplat(06)=' ',         dsis(06)='spd',                 dval(06)=1.0,  dthin(06)=0, dsfcalc(06)=0,
   dfile(07)='radarbufr', dtype(07)='rw',        dplat(07)=' ',         dsis(07)='rw',                  dval(07)=1.0,  dthin(07)=0, dsfcalc(07)=0,
   dfile(08)='prepbufr',  dtype(08)='dw',        dplat(08)=' ',         dsis(08)='dw',                  dval(08)=1.0,  dthin(08)=0, dsfcalc(08)=0,
   dfile(09)='prepbufr',  dtype(09)='sst',       dplat(09)=' ',         dsis(09)='sst',                 dval(09)=1.0,  dthin(09)=0, dsfcalc(09)=0,
   dfile(10)='prepbufr',  dtype(10)='pw',        dplat(10)=' ',         dsis(10)='pw',                  dval(10)=1.0,  dthin(10)=0, dsfcalc(10)=0,
   dfile(11)='gpsrobufr', dtype(11)='$gps_dtype',   dplat(11)=' ',         dsis(11)='gps',             dval(11)=1.0,  dthin(11)=0, dsfcalc(11)=0,
   dfile(12)='ssmirrbufr',dtype(12)='pcp_ssmi',  dplat(12)='dmsp',      dsis(12)='pcp_ssmi',            dval(12)=1.0,  dthin(12)=-1,dsfcalc(12)=0,
   dfile(13)='tmirrbufr', dtype(13)='pcp_tmi',   dplat(13)='trmm',      dsis(13)='pcp_tmi',             dval(13)=1.0,  dthin(13)=-1,dsfcalc(13)=0,
   dfile(14)='sbuvbufr',  dtype(14)='sbuv2',     dplat(14)='n16',       dsis(14)='sbuv8_n16',           dval(14)=1.0,  dthin(14)=0, dsfcalc(14)=0,
   dfile(15)='sbuvbufr',  dtype(15)='sbuv2',     dplat(15)='n17',       dsis(15)='sbuv8_n17',           dval(15)=1.0,  dthin(15)=0, dsfcalc(15)=0,
   dfile(16)='sbuvbufr',  dtype(16)='sbuv2',     dplat(16)='n18',       dsis(16)='sbuv8_n18',           dval(16)=1.0,  dthin(16)=0, dsfcalc(16)=0,
   dfile(17)='omi',       dtype(17)='omi',       dplat(17)='aura',      dsis(17)='omi_aura',            dval(17)=1.0,  dthin(17)=6, dsfcalc(17)=0,
   dfile(18)='hirs2bufr', dtype(18)='hirs2',     dplat(18)='n14',       dsis(18)='hirs2_n14',           dval(18)=6.0,  dthin(18)=1, dsfcalc(18)=1,
   dfile(19)='hirs3bufr', dtype(19)='hirs3',     dplat(19)='n16',       dsis(19)='hirs3_n16',           dval(19)=0.0,  dthin(19)=1, dsfcalc(19)=1,
   dfile(20)='hirs3bufr', dtype(20)='hirs3',     dplat(20)='n17',       dsis(20)='hirs3_n17',           dval(20)=6.0,  dthin(20)=1, dsfcalc(20)=1,
   dfile(21)='hirs4bufr', dtype(21)='hirs4',     dplat(21)='n18',       dsis(21)='hirs4_n18',           dval(21)=0.0,  dthin(21)=1, dsfcalc(21)=1,
   dfile(22)='hirs4bufr', dtype(22)='hirs4',     dplat(22)='metop-a',   dsis(22)='hirs4_metop-a',       dval(22)=6.0,  dthin(22)=1, dsfcalc(22)=1,
   dfile(23)='gsndrbufr', dtype(23)='sndr',      dplat(23)='g11',       dsis(23)='sndr_g11',            dval(23)=0.0,  dthin(23)=1, dsfcalc(23)=0,
   dfile(24)='gsndrbufr', dtype(24)='sndr',      dplat(24)='g12',       dsis(24)='sndr_g12',            dval(24)=0.0,  dthin(24)=1, dsfcalc(24)=0,
   dfile(25)='gimgrbufr', dtype(25)='goes_img',  dplat(25)='g11',       dsis(25)='imgr_g11',            dval(25)=0.0,  dthin(25)=1, dsfcalc(25)=0,
   dfile(26)='gimgrbufr', dtype(26)='goes_img',  dplat(26)='g12',       dsis(26)='imgr_g12',            dval(26)=0.0,  dthin(26)=1, dsfcalc(26)=0,
   dfile(27)='airsbufr',  dtype(27)='airs',      dplat(27)='aqua',      dsis(27)='airs281SUBSET_aqua',  dval(27)=20.0, dthin(27)=1, dsfcalc(27)=1,
   dfile(28)='msubufr',   dtype(28)='msu',       dplat(28)='n14',       dsis(28)='msu_n14',             dval(28)=2.0,  dthin(28)=2, dsfcalc(28)=1,
   dfile(29)='amsuabufr', dtype(29)='amsua',     dplat(29)='n15',       dsis(29)='amsua_n15',           dval(29)=10.0, dthin(29)=2, dsfcalc(29)=1,
   dfile(30)='amsuabufr', dtype(30)='amsua',     dplat(30)='n16',       dsis(30)='amsua_n16',           dval(30)=0.0,  dthin(30)=2, dsfcalc(30)=1,
   dfile(31)='amsuabufr', dtype(31)='amsua',     dplat(31)='n17',       dsis(31)='amsua_n17',           dval(31)=0.0,  dthin(31)=2, dsfcalc(31)=1,
   dfile(32)='amsuabufr', dtype(32)='amsua',     dplat(32)='n18',       dsis(32)='amsua_n18',           dval(32)=10.0, dthin(32)=2, dsfcalc(32)=1,
   dfile(33)='amsuabufr', dtype(33)='amsua',     dplat(33)='metop-a',   dsis(33)='amsua_metop-a',       dval(33)=10.0, dthin(33)=2, dsfcalc(33)=1,
   dfile(34)='airsbufr',  dtype(34)='amsua',     dplat(34)='aqua',      dsis(34)='amsua_aqua',          dval(34)=5.0,  dthin(34)=2, dsfcalc(34)=1,
   dfile(35)='amsubbufr', dtype(35)='amsub',     dplat(35)='n15',       dsis(35)='amsub_n15',           dval(35)=3.0,  dthin(35)=3, dsfcalc(35)=1,
   dfile(36)='amsubbufr', dtype(36)='amsub',     dplat(36)='n16',       dsis(36)='amsub_n16',           dval(36)=3.0,  dthin(36)=3, dsfcalc(36)=1,
   dfile(37)='amsubbufr', dtype(37)='amsub',     dplat(37)='n17',       dsis(37)='amsub_n17',           dval(37)=3.0,  dthin(37)=3, dsfcalc(37)=1,
   dfile(38)='mhsbufr',   dtype(38)='mhs',       dplat(38)='n18',       dsis(38)='mhs_n18',             dval(38)=3.0,  dthin(38)=3, dsfcalc(38)=1,
   dfile(39)='mhsbufr',   dtype(39)='mhs',       dplat(39)='metop-a',   dsis(39)='mhs_metop-a',         dval(39)=3.0,  dthin(39)=3, dsfcalc(39)=1,
   dfile(40)='ssmitbufr', dtype(40)='ssmi',      dplat(40)='f13',       dsis(40)='ssmi_f13',            dval(40)=0.0,  dthin(40)=4, dsfcalc(40)=0,
   dfile(41)='ssmitbufr', dtype(41)='ssmi',      dplat(41)='f14',       dsis(41)='ssmi_f14',            dval(41)=0.0,  dthin(41)=4, dsfcalc(41)=0,
   dfile(42)='ssmitbufr', dtype(42)='ssmi',      dplat(42)='f15',       dsis(42)='ssmi_f15',            dval(42)=0.0,  dthin(42)=4, dsfcalc(42)=0,
   dfile(43)='amsrebufr', dtype(43)='amsre_low', dplat(43)='aqua',      dsis(43)='amsre_aqua',          dval(43)=0.0,  dthin(43)=4, dsfcalc(43)=1,
   dfile(44)='amsrebufr', dtype(44)='amsre_mid', dplat(44)='aqua',      dsis(44)='amsre_aqua',          dval(44)=0.0,  dthin(44)=4, dsfcalc(44)=1,
   dfile(45)='amsrebufr', dtype(45)='amsre_hig', dplat(45)='aqua',      dsis(45)='amsre_aqua',          dval(45)=0.0,  dthin(45)=4, dsfcalc(45)=1,
   dfile(46)='ssmisbufr', dtype(46)='ssmis',     dplat(46)='f16',       dsis(46)='ssmis_f16',           dval(46)=0.0,  dthin(46)=4, dsfcalc(46)=1,
   dfile(47)='gsnd1bufr', dtype(47)='sndrd1',    dplat(47)='g12',       dsis(47)='sndrD1_g12',          dval(47)=1.5,  dthin(47)=5, dsfcalc(47)=0,
   dfile(48)='gsnd1bufr', dtype(48)='sndrd2',    dplat(48)='g12',       dsis(48)='sndrD2_g12',          dval(48)=1.5,  dthin(48)=5, dsfcalc(48)=0,
   dfile(49)='gsnd1bufr', dtype(49)='sndrd3',    dplat(49)='g12',       dsis(49)='sndrD3_g12',          dval(49)=1.5,  dthin(49)=5, dsfcalc(49)=0,
   dfile(50)='gsnd1bufr', dtype(50)='sndrd4',    dplat(50)='g12',       dsis(50)='sndrD4_g12',          dval(50)=1.5,  dthin(50)=5, dsfcalc(50)=0,
   dfile(51)='gsnd1bufr', dtype(51)='sndrd1',    dplat(51)='g11',       dsis(51)='sndrD1_g11',          dval(51)=1.5,  dthin(51)=5, dsfcalc(51)=0,
   dfile(52)='gsnd1bufr', dtype(52)='sndrd2',    dplat(52)='g11',       dsis(52)='sndrD2_g11',          dval(52)=1.5,  dthin(52)=5, dsfcalc(52)=0,
   dfile(53)='gsnd1bufr', dtype(53)='sndrd3',    dplat(53)='g11',       dsis(53)='sndrD3_g11',          dval(53)=1.5,  dthin(53)=5, dsfcalc(53)=0,
   dfile(54)='gsnd1bufr', dtype(54)='sndrd4',    dplat(54)='g11',       dsis(54)='sndrD4_g11',          dval(54)=1.5,  dthin(54)=5, dsfcalc(54)=0,
   dfile(55)='gsnd1bufr', dtype(55)='sndrd1',    dplat(55)='g13',       dsis(55)='sndrD1_g13',          dval(55)=1.5,  dthin(55)=5, dsfcalc(55)=0,
   dfile(56)='gsnd1bufr', dtype(56)='sndrd2',    dplat(56)='g13',       dsis(56)='sndrD2_g13',          dval(56)=1.5,  dthin(56)=5, dsfcalc(56)=0,
   dfile(57)='gsnd1bufr', dtype(57)='sndrd3',    dplat(57)='g13',       dsis(57)='sndrD3_g13',          dval(57)=1.5,  dthin(57)=5, dsfcalc(57)=0,
   dfile(58)='gsnd1bufr', dtype(58)='sndrd4',    dplat(58)='g13',       dsis(58)='sndrD4_g13',          dval(58)=1.5,  dthin(58)=5, dsfcalc(58)=0,
   dfile(59)='iasibufr',  dtype(59)='iasi',      dplat(59)='metop-a',   dsis(59)='iasi616_metop-a',     dval(59)=20.0, dthin(59)=1, dsfcalc(59)=1,
   dfile(60)='gomebufr',  dtype(60)='gome',      dplat(60)='metop-a',   dsis(60)='gome_metop-a',        dval(60)=1.0,  dthin(60)=6, dsfcalc(60)=0,
   dfile(61)='mlsbufr',   dtype(61)='mls30',     dplat(61)='aura',      dsis(61)='mls30_aura',          dval(61)=1.0,  dthin(61)=0, dsfcalc(61)=0,
   dfile(62)='oscatbufr', dtype(62)='uv',        dplat(62)=' ',         dsis(62)='uv',                  dval(62)=1.0,  dthin(62)=0, dsfcalc(62)=0,
 /
 &SUPEROB_RADAR
   del_azimuth=5.,del_elev=.25,del_range=5000.,del_time=.5,elev_angle_max=5.,minnum=50,range_max=100000.,
   l2superob_only=.false.,
 /
 &LAG_DATA
 /
 &HYBRID_ENSEMBLE
   l_hyb_ens=${HYBENS_REGIONAL},
   n_ens=${ENSEMBLE_SIZE_REGIONAL},
   uv_hyb_ens=${HYBENS_UV_REGIONAL},
   beta1_inv=${BETA1_INV_REGIONAL},
   s_ens_h=${HYBENS_HOR_SCALE_REGIONAL},
   s_ens_v=${HYBENS_VER_SCALE_REGIONAL},
   generate_ens=${GENERATE_ENS_REGIONAL},
   aniso_a_en=${HYBENS_ANISO_REGIONAL},
   nlon_ens=${NLON_ENS_REGIONAL},
   nlat_ens=${NLAT_ENS_REGIONAL},
   jcap_ens=${JCAP_ENS_REGIONAL},
   jcap_ens_test=${JCAP_ENS_TEST_REGIONAL},
 /
 &RAPIDREFRESH_CLDSURF
   dfi_radar_latent_heat_time_period=30.0,
 /
 &CHEM
 /
 &SINGLEOB_TEST
   maginnov=0.1,magoberr=0.1,oneob_type='t',
   oblat=45.,oblon=270.,obpres=850.,obdattim=${adate},
   obhourset=0.,
 /"

# Define namelist for arw netcdf run

export arw_netcdf_namelist="

 &SETUP
   miter=2,niter(1)=50,niter(2)=50,
   write_diag(1)=.true.,write_diag(2)=.false.,write_diag(3)=.true.,
   gencode=78,qoption=2,
   factqmin=0.0,factqmax=0.0,deltim=$DELTIM,
   ndat=62,iguess=-1,
   oneobtest=.false.,retrieval=.false.,
   nhr_assimilation=3,l_foto=.false.,
   use_pbl=.false.,use_compress=.false.,nsig_ext=13,gpstop=30.,
   lrun_subdirs=.true.,
   $SETUP
 /
 &GRIDOPTS
   JCAP=$JCAP,JCAP_B=$JCAP_B,NLAT=$NLAT,NLON=$LONA,nsig=$LEVS,
   wrf_nmm_regional=.false.,wrf_mass_regional=.true.,diagnostic_reg=.false.,
   filled_grid=.false.,half_grid=.true.,netcdf=$NETCDF,
 /
 &BKGERR
   hzscl=0.373,0.746,1.50,
   vs=1.0,bw=0.,fstat=.true.,
 /
 &ANBKGERR
   anisotropic=.false.,an_vs=1.0,ngauss=1,
   an_flen_u=-5.,an_flen_t=3.,an_flen_z=-200.,
   ifilt_ord=2,npass=3,normal=-200,grid_ratio=4.,nord_f2a=4,
 /
 &JCOPTS
 /
 &STRONGOPTS
   nstrong=0,nvmodes_keep=20,period_max=3.,
   baldiag_full=.true.,baldiag_inc=.true.,
 /
 &OBSQC
   dfact=0.75,dfact1=3.0,noiqc=.false.,c_varqc=0.02,vadfile='prepbufr',
 /
 &OBS_INPUT
   dmesh(1)=120.0,dmesh(2)=60.0,dmesh(3)=60.0,dmesh(4)=60.0,dmesh(5)=120,time_window_max=1.5,
   dfile(01)='prepbufr',  dtype(01)='ps',        dplat(01)=' ',         dsis(01)='ps',                  dval(01)=1.0,  dthin(01)=0, dsfcalc(01)=0,
   dfile(02)='prepbufr'   dtype(02)='t',         dplat(02)=' ',         dsis(02)='t',                   dval(02)=1.0,  dthin(02)=0, dsfcalc(02)=0,
   dfile(03)='prepbufr',  dtype(03)='q',         dplat(03)=' ',         dsis(03)='q',                   dval(03)=1.0,  dthin(03)=0, dsfcalc(03)=0,
   dfile(04)='prepbufr',  dtype(04)='uv',        dplat(04)=' ',         dsis(04)='uv',                  dval(04)=1.0,  dthin(04)=0, dsfcalc(04)=0,
   dfile(05)='satwndbufr',    dtype(05)='uv',        dplat(05)=' ',         dsis(05)='uv',                  dval(05)=1.0,  dthin(05)=0, dsfcalc(05)=0,
   dfile(06)='prepbufr',  dtype(06)='spd',       dplat(06)=' ',         dsis(06)='spd',                 dval(06)=1.0,  dthin(06)=0, dsfcalc(06)=0,
   dfile(07)='radarbufr', dtype(07)='rw',        dplat(07)=' ',         dsis(07)='rw',                  dval(07)=1.0,  dthin(07)=0, dsfcalc(07)=0,
   dfile(08)='prepbufr',  dtype(08)='dw',        dplat(08)=' ',         dsis(08)='dw',                  dval(08)=1.0,  dthin(08)=0, dsfcalc(08)=0,
   dfile(09)='prepbufr',  dtype(09)='sst',       dplat(09)=' ',         dsis(09)='sst',                 dval(09)=1.0,  dthin(09)=0, dsfcalc(09)=0,
   dfile(10)='prepbufr',  dtype(10)='pw',        dplat(10)=' ',         dsis(10)='pw',                  dval(10)=1.0,  dthin(10)=0, dsfcalc(10)=0,
   dfile(11)='gpsrobufr', dtype(11)='$gps_dtype',   dplat(11)=' ',         dsis(11)='gps',             dval(11)=1.0,  dthin(11)=0, dsfcalc(11)=0,
   dfile(12)='ssmirrbufr',dtype(12)='pcp_ssmi',  dplat(12)='dmsp',      dsis(12)='pcp_ssmi',            dval(12)=1.0,  dthin(12)=-1,dsfcalc(12)=0,
   dfile(13)='tmirrbufr', dtype(13)='pcp_tmi',   dplat(13)='trmm',      dsis(13)='pcp_tmi',             dval(13)=1.0,  dthin(13)=-1,dsfcalc(13)=0,
   dfile(14)='sbuvbufr',  dtype(14)='sbuv2',     dplat(14)='n16',       dsis(14)='sbuv8_n16',           dval(14)=1.0,  dthin(14)=0, dsfcalc(14)=0,
   dfile(15)='sbuvbufr',  dtype(15)='sbuv2',     dplat(15)='n17',       dsis(15)='sbuv8_n17',           dval(15)=1.0,  dthin(15)=0, dsfcalc(15)=0,
   dfile(16)='sbuvbufr',  dtype(16)='sbuv2',     dplat(16)='n18',       dsis(16)='sbuv8_n18',           dval(16)=1.0,  dthin(16)=0, dsfcalc(16)=0,
   dfile(17)='omi',       dtype(17)='omi',       dplat(17)='aura',      dsis(17)='omi_aura',            dval(17)=1.0,  dthin(17)=6, dsfcalc(17)=0,
   dfile(18)='hirs2bufr', dtype(18)='hirs2',     dplat(18)='n14',       dsis(18)='hirs2_n14',           dval(18)=6.0,  dthin(18)=1, dsfcalc(18)=1,
   dfile(19)='hirs3bufr', dtype(19)='hirs3',     dplat(19)='n16',       dsis(19)='hirs3_n16',           dval(19)=0.0,  dthin(19)=1, dsfcalc(19)=1,
   dfile(20)='hirs3bufr', dtype(20)='hirs3',     dplat(20)='n17',       dsis(20)='hirs3_n17',           dval(20)=6.0,  dthin(20)=1, dsfcalc(20)=1,
   dfile(21)='hirs4bufr', dtype(21)='hirs4',     dplat(21)='n18',       dsis(21)='hirs4_n18',           dval(21)=0.0,  dthin(21)=1, dsfcalc(21)=1,
   dfile(22)='hirs4bufr', dtype(22)='hirs4',     dplat(22)='metop-a',   dsis(22)='hirs4_metop-a',       dval(22)=6.0,  dthin(22)=1, dsfcalc(22)=1,
   dfile(23)='gsndrbufr', dtype(23)='sndr',      dplat(23)='g11',       dsis(23)='sndr_g11',            dval(23)=0.0,  dthin(23)=1, dsfcalc(23)=0,
   dfile(24)='gsndrbufr', dtype(24)='sndr',      dplat(24)='g12',       dsis(24)='sndr_g12',            dval(24)=0.0,  dthin(24)=1, dsfcalc(24)=0,
   dfile(25)='gimgrbufr', dtype(25)='goes_img',  dplat(25)='g11',       dsis(25)='imgr_g11',            dval(25)=0.0,  dthin(25)=1, dsfcalc(25)=0,
   dfile(26)='gimgrbufr', dtype(26)='goes_img',  dplat(26)='g12',       dsis(26)='imgr_g12',            dval(26)=0.0,  dthin(26)=1, dsfcalc(26)=0,
   dfile(27)='airsbufr',  dtype(27)='airs',      dplat(27)='aqua',      dsis(27)='airs281SUBSET_aqua',  dval(27)=20.0, dthin(27)=1, dsfcalc(27)=1,
   dfile(28)='msubufr',   dtype(28)='msu',       dplat(28)='n14',       dsis(28)='msu_n14',             dval(28)=2.0,  dthin(28)=2, dsfcalc(28)=1,
   dfile(29)='amsuabufr', dtype(29)='amsua',     dplat(29)='n15',       dsis(29)='amsua_n15',           dval(29)=10.0, dthin(29)=2, dsfcalc(29)=1,
   dfile(30)='amsuabufr', dtype(30)='amsua',     dplat(30)='n16',       dsis(30)='amsua_n16',           dval(30)=0.0,  dthin(30)=2, dsfcalc(30)=1,
   dfile(31)='amsuabufr', dtype(31)='amsua',     dplat(31)='n17',       dsis(31)='amsua_n17',           dval(31)=0.0,  dthin(31)=2, dsfcalc(31)=1,
   dfile(32)='amsuabufr', dtype(32)='amsua',     dplat(32)='n18',       dsis(32)='amsua_n18',           dval(32)=10.0, dthin(32)=2, dsfcalc(32)=1,
   dfile(33)='amsuabufr', dtype(33)='amsua',     dplat(33)='metop-a',   dsis(33)='amsua_metop-a',       dval(33)=10.0, dthin(33)=2, dsfcalc(33)=1,
   dfile(34)='airsbufr',  dtype(34)='amsua',     dplat(34)='aqua',      dsis(34)='amsua_aqua',          dval(34)=5.0,  dthin(34)=2, dsfcalc(34)=1,
   dfile(35)='amsubbufr', dtype(35)='amsub',     dplat(35)='n15',       dsis(35)='amsub_n15',           dval(35)=3.0,  dthin(35)=3, dsfcalc(35)=1,
   dfile(36)='amsubbufr', dtype(36)='amsub',     dplat(36)='n16',       dsis(36)='amsub_n16',           dval(36)=3.0,  dthin(36)=3, dsfcalc(36)=1,
   dfile(37)='amsubbufr', dtype(37)='amsub',     dplat(37)='n17',       dsis(37)='amsub_n17',           dval(37)=3.0,  dthin(37)=3, dsfcalc(37)=1,
   dfile(38)='mhsbufr',   dtype(38)='mhs',       dplat(38)='n18',       dsis(38)='mhs_n18',             dval(38)=3.0,  dthin(38)=3, dsfcalc(38)=1,
   dfile(39)='mhsbufr',   dtype(39)='mhs',       dplat(39)='metop-a',   dsis(39)='mhs_metop-a',         dval(39)=3.0,  dthin(39)=3, dsfcalc(39)=1,
   dfile(40)='ssmitbufr', dtype(40)='ssmi',      dplat(40)='f13',       dsis(40)='ssmi_f13',            dval(40)=0.0,  dthin(40)=4, dsfcalc(40)=0,
   dfile(41)='ssmitbufr', dtype(41)='ssmi',      dplat(41)='f14',       dsis(41)='ssmi_f14',            dval(41)=0.0,  dthin(41)=4, dsfcalc(41)=0,
   dfile(42)='ssmitbufr', dtype(42)='ssmi',      dplat(42)='f15',       dsis(42)='ssmi_f15',            dval(42)=0.0,  dthin(42)=4, dsfcalc(42)=0,
   dfile(43)='amsrebufr', dtype(43)='amsre_low', dplat(43)='aqua',      dsis(43)='amsre_aqua',          dval(43)=0.0,  dthin(43)=4, dsfcalc(43)=1,
   dfile(44)='amsrebufr', dtype(44)='amsre_mid', dplat(44)='aqua',      dsis(44)='amsre_aqua',          dval(44)=0.0,  dthin(44)=4, dsfcalc(44)=1,
   dfile(45)='amsrebufr', dtype(45)='amsre_hig', dplat(45)='aqua',      dsis(45)='amsre_aqua',          dval(45)=0.0,  dthin(45)=4, dsfcalc(45)=1,
   dfile(46)='ssmisbufr', dtype(46)='ssmis',     dplat(46)='f16',       dsis(46)='ssmis_f16',           dval(46)=0.0,  dthin(46)=4, dsfcalc(46)=1,
   dfile(47)='gsnd1bufr', dtype(47)='sndrd1',    dplat(47)='g12',       dsis(47)='sndrD1_g12',          dval(47)=1.5,  dthin(47)=5, dsfcalc(47)=0,
   dfile(48)='gsnd1bufr', dtype(48)='sndrd2',    dplat(48)='g12',       dsis(48)='sndrD2_g12',          dval(48)=1.5,  dthin(48)=5, dsfcalc(48)=0,
   dfile(49)='gsnd1bufr', dtype(49)='sndrd3',    dplat(49)='g12',       dsis(49)='sndrD3_g12',          dval(49)=1.5,  dthin(49)=5, dsfcalc(49)=0,
   dfile(50)='gsnd1bufr', dtype(50)='sndrd4',    dplat(50)='g12',       dsis(50)='sndrD4_g12',          dval(50)=1.5,  dthin(50)=5, dsfcalc(50)=0,
   dfile(51)='gsnd1bufr', dtype(51)='sndrd1',    dplat(51)='g11',       dsis(51)='sndrD1_g11',          dval(51)=1.5,  dthin(51)=5, dsfcalc(51)=0,
   dfile(52)='gsnd1bufr', dtype(52)='sndrd2',    dplat(52)='g11',       dsis(52)='sndrD2_g11',          dval(52)=1.5,  dthin(52)=5, dsfcalc(52)=0,
   dfile(53)='gsnd1bufr', dtype(53)='sndrd3',    dplat(53)='g11',       dsis(53)='sndrD3_g11',          dval(53)=1.5,  dthin(53)=5, dsfcalc(53)=0,
   dfile(54)='gsnd1bufr', dtype(54)='sndrd4',    dplat(54)='g11',       dsis(54)='sndrD4_g11',          dval(54)=1.5,  dthin(54)=5, dsfcalc(54)=0,
   dfile(55)='gsnd1bufr', dtype(55)='sndrd1',    dplat(55)='g13',       dsis(55)='sndrD1_g13',          dval(55)=1.5,  dthin(55)=5, dsfcalc(55)=0,
   dfile(56)='gsnd1bufr', dtype(56)='sndrd2',    dplat(56)='g13',       dsis(56)='sndrD2_g13',          dval(56)=1.5,  dthin(56)=5, dsfcalc(56)=0,
   dfile(57)='gsnd1bufr', dtype(57)='sndrd3',    dplat(57)='g13',       dsis(57)='sndrD3_g13',          dval(57)=1.5,  dthin(57)=5, dsfcalc(57)=0,
   dfile(58)='gsnd1bufr', dtype(58)='sndrd4',    dplat(58)='g13',       dsis(58)='sndrD4_g13',          dval(58)=1.5,  dthin(58)=5, dsfcalc(58)=0,
   dfile(59)='iasibufr',  dtype(59)='iasi',      dplat(59)='metop-a',   dsis(59)='iasi616_metop-a',     dval(59)=20.0, dthin(59)=1, dsfcalc(59)=1,
   dfile(60)='gomebufr',  dtype(60)='gome',      dplat(60)='metop-a',   dsis(60)='gome_metop-a',        dval(60)=1.0,  dthin(60)=6, dsfcalc(60)=0,
   dfile(61)='mlsbufr',   dtype(61)='mls30',     dplat(61)='aura',      dsis(61)='mls30_aura',          dval(61)=1.0,  dthin(61)=0, dsfcalc(61)=0,
   dfile(62)='oscatbufr', dtype(62)='uv',        dplat(62)=' ',         dsis(62)='uv',                  dval(62)=1.0,  dthin(62)=0, dsfcalc(62)=0,
 /
 &SUPEROB_RADAR
   del_azimuth=5.,del_elev=.25,del_range=5000.,del_time=.5,elev_angle_max=5.,minnum=50,range_max=100000.,
   l2superob_only=.false.,
 /
 &LAG_DATA
 /
 &HYBRID_ENSEMBLE
   l_hyb_ens=${HYBENS_REGIONAL},
   n_ens=${ENSEMBLE_SIZE_REGIONAL},
   uv_hyb_ens=${HYBENS_UV_REGIONAL},
   beta1_inv=${BETA1_INV_REGIONAL},
   s_ens_h=${HYBENS_HOR_SCALE_REGIONAL},
   s_ens_v=${HYBENS_VER_SCALE_REGIONAL},
   generate_ens=${GENERATE_ENS_REGIONAL},
   aniso_a_en=${HYBENS_ANISO_REGIONAL},
   nlon_ens=${NLON_ENS_REGIONAL},
   nlat_ens=${NLAT_ENS_REGIONAL},
   jcap_ens=${JCAP_ENS_REGIONAL},
   jcap_ens_test=${JCAP_ENS_TEST_REGIONAL},
 /
 &RAPIDREFRESH_CLDSURF
   dfi_radar_latent_heat_time_period=30.0,
 /
 &CHEM
 /
 &SINGLEOB_TEST
   maginnov=0.1,magoberr=0.1,oneob_type='t',
   oblat=45.,oblon=270.,obpres=850.,obdattim=${adate},
   obhourset=0.,
 /"

# Define namelist for nmm binary run

export nmm_binary_namelist="

 &SETUP
   miter=2,niter(1)=50,niter(2)=50,
   write_diag(1)=.true.,write_diag(2)=.false.,write_diag(3)=.true.,
   gencode=78,qoption=2,
   factqmin=0.0,factqmax=0.0,deltim=$DELTIM,
   ndat=62,iguess=-1,
   oneobtest=.false.,retrieval=.false.,
   nhr_assimilation=3,l_foto=.false.,
   use_pbl=.false.,use_compress=.false.,nsig_ext=13,gpstop=30.,
   lrun_subdirs=.true.,
   $SETUP
 /
 &GRIDOPTS
   JCAP=$JCAP,JCAP_B=$JCAP_B,NLAT=$NLAT,NLON=$LONA,nsig=$LEVS,
   wrf_nmm_regional=.true.,wrf_mass_regional=.false.,diagnostic_reg=.false.,
   filled_grid=.false.,half_grid=.true.,netcdf=$NETCDF,
 /
 &BKGERR
   hzscl=0.373,0.746,1.50,
   vs=1.0,bw=0.,fstat=.true.,
 /
 &ANBKGERR
   anisotropic=.false.,an_vs=1.0,ngauss=1,
   an_flen_u=-5.,an_flen_t=3.,an_flen_z=-200.,
   ifilt_ord=2,npass=3,normal=-200,grid_ratio=4.,nord_f2a=4,
 /
 &JCOPTS
 /
 &STRONGOPTS
   nstrong=0,nvmodes_keep=20,period_max=3.,
   baldiag_full=.true.,baldiag_inc=.true.,
 /
 &OBSQC
   dfact=0.75,dfact1=3.0,noiqc=.true.,c_varqc=0.02,vadfile='prepbufr',
 /
 &OBS_INPUT
   dmesh(1)=120.0,dmesh(2)=60.0,dmesh(3)=60.0,dmesh(4)=60.0,dmesh(5)=120,time_window_max=1.5,
   dfile(01)='prepbufr',  dtype(01)='ps',        dplat(01)=' ',         dsis(01)='ps',                  dval(01)=1.0,  dthin(01)=0, dsfcalc(01)=0,
   dfile(02)='prepbufr'   dtype(02)='t',         dplat(02)=' ',         dsis(02)='t',                   dval(02)=1.0,  dthin(02)=0, dsfcalc(02)=0,
   dfile(03)='prepbufr',  dtype(03)='q',         dplat(03)=' ',         dsis(03)='q',                   dval(03)=1.0,  dthin(03)=0, dsfcalc(03)=0,
   dfile(04)='prepbufr',  dtype(04)='uv',        dplat(04)=' ',         dsis(04)='uv',                  dval(04)=1.0,  dthin(04)=0, dsfcalc(04)=0,
   dfile(05)='satwndbufr',  dtype(05)='uv',          dplat(05)=' ',         dsis(05)='uv',                  dval(05)=1.0,  dthin(05)=0, dsfcalc(05)=0,
   dfile(06)='prepbufr',  dtype(06)='spd',       dplat(06)=' ',         dsis(06)='spd',                 dval(06)=1.0,  dthin(06)=0, dsfcalc(06)=0,
   dfile(07)='radarbufr', dtype(07)='rw',        dplat(07)=' ',         dsis(07)='rw',                  dval(07)=1.0,  dthin(07)=0, dsfcalc(07)=0,
   dfile(08)='prepbufr',  dtype(08)='dw',        dplat(08)=' ',         dsis(08)='dw',                  dval(08)=1.0,  dthin(08)=0, dsfcalc(08)=0,
   dfile(09)='prepbufr',  dtype(09)='sst',       dplat(09)=' ',         dsis(09)='sst',                 dval(09)=1.0,  dthin(09)=0, dsfcalc(09)=0,
   dfile(10)='prepbufr',  dtype(10)='pw',        dplat(10)=' ',         dsis(10)='pw',                  dval(10)=1.0,  dthin(10)=0, dsfcalc(10)=0,
   dfile(11)='gpsrobufr', dtype(11)='$gps_dtype',   dplat(11)=' ',      dsis(11)='gps',                 dval(11)=1.0,  dthin(11)=0, dsfcalc(11)=0,
   dfile(12)='ssmirrbufr',dtype(12)='pcp_ssmi',  dplat(12)='dmsp',      dsis(12)='pcp_ssmi',            dval(12)=1.0,  dthin(12)=-1,dsfcalc(12)=0,
   dfile(13)='tmirrbufr', dtype(13)='pcp_tmi',   dplat(13)='trmm',      dsis(13)='pcp_tmi',             dval(13)=1.0,  dthin(13)=-1,dsfcalc(13)=0,
   dfile(14)='sbuvbufr',  dtype(14)='sbuv2',     dplat(14)='n16',       dsis(14)='sbuv8_n16',           dval(14)=1.0,  dthin(14)=0, dsfcalc(14)=0,
   dfile(15)='sbuvbufr',  dtype(15)='sbuv2',     dplat(15)='n17',       dsis(15)='sbuv8_n17',           dval(15)=1.0,  dthin(15)=0, dsfcalc(15)=0,
   dfile(16)='sbuvbufr',  dtype(16)='sbuv2',     dplat(16)='n18',       dsis(16)='sbuv8_n18',           dval(16)=1.0,  dthin(16)=0, dsfcalc(16)=0,
   dfile(17)='omi',       dtype(17)='omi',       dplat(17)='aura',      dsis(17)='omi_aura',            dval(17)=1.0,  dthin(17)=6, dsfcalc(17)=0,
   dfile(18)='hirs2bufr', dtype(18)='hirs2',     dplat(18)='n14',       dsis(18)='hirs2_n14',           dval(18)=6.0,  dthin(18)=1, dsfcalc(18)=1,
   dfile(19)='hirs3bufr', dtype(19)='hirs3',     dplat(19)='n16',       dsis(19)='hirs3_n16',           dval(19)=0.0,  dthin(19)=1, dsfcalc(19)=1,
   dfile(20)='hirs3bufr', dtype(20)='hirs3',     dplat(20)='n17',       dsis(20)='hirs3_n17',           dval(20)=0.0,  dthin(20)=1, dsfcalc(20)=1,
   dfile(21)='hirs4bufr', dtype(21)='hirs4',     dplat(21)='n18',       dsis(21)='hirs4_n18',           dval(21)=0.0,  dthin(21)=1, dsfcalc(21)=1,
   dfile(22)='hirs4bufr', dtype(22)='hirs4',     dplat(22)='metop-a',   dsis(22)='hirs4_metop-a',       dval(22)=6.0,  dthin(22)=1, dsfcalc(22)=1,
   dfile(23)='gsndrbufr', dtype(23)='sndr',      dplat(23)='g11',       dsis(23)='sndr_g11',            dval(23)=0.0,  dthin(23)=1, dsfcalc(23)=0,
   dfile(24)='gsndrbufr', dtype(24)='sndr',      dplat(24)='g12',       dsis(24)='sndr_g12',            dval(24)=0.0,  dthin(24)=1, dsfcalc(24)=0,
   dfile(25)='gimgrbufr', dtype(25)='goes_img',  dplat(25)='g11',       dsis(25)='imgr_g11',            dval(25)=0.0,  dthin(25)=1, dsfcalc(25)=0,
   dfile(26)='gimgrbufr', dtype(26)='goes_img',  dplat(26)='g12',       dsis(26)='imgr_g12',            dval(26)=0.0,  dthin(26)=1, dsfcalc(26)=0,
   dfile(27)='airsbufr',  dtype(27)='airs',      dplat(27)='aqua',      dsis(27)='airs281SUBSET_aqua',  dval(27)=20.0, dthin(27)=1, dsfcalc(27)=1,
   dfile(28)='msubufr',   dtype(28)='msu',       dplat(28)='n14',       dsis(28)='msu_n14',             dval(28)=2.0,  dthin(28)=2, dsfcalc(28)=1,
   dfile(29)='amsuabufr', dtype(29)='amsua',     dplat(29)='n15',       dsis(29)='amsua_n15',           dval(29)=10.0, dthin(29)=2, dsfcalc(29)=1,
   dfile(30)='amsuabufr', dtype(30)='amsua',     dplat(30)='n16',       dsis(30)='amsua_n16',           dval(30)=0.0,  dthin(30)=2, dsfcalc(30)=1,
   dfile(31)='amsuabufr', dtype(31)='amsua',     dplat(31)='n17',       dsis(31)='amsua_n17',           dval(31)=0.0,  dthin(31)=2, dsfcalc(31)=1,
   dfile(32)='amsuabufr', dtype(32)='amsua',     dplat(32)='n18',       dsis(32)='amsua_n18',           dval(32)=10.0, dthin(32)=2, dsfcalc(32)=1,
   dfile(33)='amsuabufr', dtype(33)='amsua',     dplat(33)='metop-a',   dsis(33)='amsua_metop-a',       dval(33)=10.0, dthin(33)=2, dsfcalc(33)=1,
   dfile(34)='airsbufr',  dtype(34)='amsua',     dplat(34)='aqua',      dsis(34)='amsua_aqua',          dval(34)=5.0,  dthin(34)=2, dsfcalc(34)=1,
   dfile(35)='amsubbufr', dtype(35)='amsub',     dplat(35)='n15',       dsis(35)='amsub_n15',           dval(35)=3.0,  dthin(35)=3, dsfcalc(35)=1,
   dfile(36)='amsubbufr', dtype(36)='amsub',     dplat(36)='n16',       dsis(36)='amsub_n16',           dval(36)=3.0,  dthin(36)=3, dsfcalc(36)=1,
   dfile(37)='amsubbufr', dtype(37)='amsub',     dplat(37)='n17',       dsis(37)='amsub_n17',           dval(37)=3.0,  dthin(37)=3, dsfcalc(37)=1,
   dfile(38)='mhsbufr',   dtype(38)='mhs',       dplat(38)='n18',       dsis(38)='mhs_n18',             dval(38)=3.0,  dthin(38)=3, dsfcalc(38)=1,
   dfile(39)='mhsbufr',   dtype(39)='mhs',       dplat(39)='metop-a',   dsis(39)='mhs_metop-a',         dval(39)=3.0,  dthin(39)=3, dsfcalc(39)=1,
   dfile(40)='ssmitbufr', dtype(40)='ssmi',      dplat(40)='f13',       dsis(40)='ssmi_f13',            dval(40)=0.0,  dthin(40)=4, dsfcalc(40)=0,
   dfile(41)='ssmitbufr', dtype(41)='ssmi',      dplat(41)='f14',       dsis(41)='ssmi_f14',            dval(41)=0.0,  dthin(41)=4, dsfcalc(41)=0,
   dfile(42)='ssmitbufr', dtype(42)='ssmi',      dplat(42)='f15',       dsis(42)='ssmi_f15',            dval(42)=0.0,  dthin(42)=4, dsfcalc(42)=0,
   dfile(43)='amsrebufr', dtype(43)='amsre_low', dplat(43)='aqua',      dsis(43)='amsre_aqua',          dval(43)=0.0,  dthin(43)=4, dsfcalc(43)=1,
   dfile(44)='amsrebufr', dtype(44)='amsre_mid', dplat(44)='aqua',      dsis(44)='amsre_aqua',          dval(44)=0.0,  dthin(44)=4, dsfcalc(44)=1,
   dfile(45)='amsrebufr', dtype(45)='amsre_hig', dplat(45)='aqua',      dsis(45)='amsre_aqua',          dval(45)=0.0,  dthin(45)=4, dsfcalc(45)=1,
   dfile(46)='ssmisbufr', dtype(46)='ssmis',     dplat(46)='f16',       dsis(46)='ssmis_f16',           dval(46)=0.0,  dthin(46)=4, dsfcalc(46)=1,
   dfile(47)='gsnd1bufr', dtype(47)='sndrd1',    dplat(47)='g12',       dsis(47)='sndrD1_g12',          dval(47)=1.5,  dthin(47)=5, dsfcalc(47)=0,
   dfile(48)='gsnd1bufr', dtype(48)='sndrd2',    dplat(48)='g12',       dsis(48)='sndrD2_g12',          dval(48)=1.5,  dthin(48)=5, dsfcalc(48)=0,
   dfile(49)='gsnd1bufr', dtype(49)='sndrd3',    dplat(49)='g12',       dsis(49)='sndrD3_g12',          dval(49)=1.5,  dthin(49)=5, dsfcalc(49)=0,
   dfile(50)='gsnd1bufr', dtype(50)='sndrd4',    dplat(50)='g12',       dsis(50)='sndrD4_g12',          dval(50)=1.5,  dthin(50)=5, dsfcalc(50)=0,
   dfile(51)='gsnd1bufr', dtype(51)='sndrd1',    dplat(51)='g11',       dsis(51)='sndrD1_g11',          dval(51)=1.5,  dthin(51)=5, dsfcalc(51)=0,
   dfile(52)='gsnd1bufr', dtype(52)='sndrd2',    dplat(52)='g11',       dsis(52)='sndrD2_g11',          dval(52)=1.5,  dthin(52)=5, dsfcalc(52)=0,
   dfile(53)='gsnd1bufr', dtype(53)='sndrd3',    dplat(53)='g11',       dsis(53)='sndrD3_g11',          dval(53)=1.5,  dthin(53)=5, dsfcalc(53)=0,
   dfile(54)='gsnd1bufr', dtype(54)='sndrd4',    dplat(54)='g11',       dsis(54)='sndrD4_g11',          dval(54)=1.5,  dthin(54)=5, dsfcalc(54)=0,
   dfile(55)='gsnd1bufr', dtype(55)='sndrd1',    dplat(55)='g13',       dsis(55)='sndrD1_g13',          dval(55)=1.5,  dthin(55)=5, dsfcalc(55)=0,
   dfile(56)='gsnd1bufr', dtype(56)='sndrd2',    dplat(56)='g13',       dsis(56)='sndrD2_g13',          dval(56)=1.5,  dthin(56)=5, dsfcalc(56)=0,
   dfile(57)='gsnd1bufr', dtype(57)='sndrd3',    dplat(57)='g13',       dsis(57)='sndrD3_g13',          dval(57)=1.5,  dthin(57)=5, dsfcalc(57)=0,
   dfile(58)='gsnd1bufr', dtype(58)='sndrd4',    dplat(58)='g13',       dsis(58)='sndrD4_g13',          dval(58)=1.5,  dthin(58)=5, dsfcalc(58)=0,
   dfile(59)='iasibufr',  dtype(59)='iasi',      dplat(59)='metop-a',   dsis(59)='iasi616_metop-a',     dval(59)=20.0, dthin(59)=1, dsfcalc(59)=1,
   dfile(60)='gomebufr',  dtype(60)='gome',      dplat(60)='metop-a',   dsis(60)='gome_metop-a',        dval(60)=1.0,  dthin(60)=6, dsfcalc(60)=0,
   dfile(61)='mlsbufr',   dtype(61)='mls30',     dplat(61)='aura',      dsis(61)='mls30_aura',          dval(61)=1.0,  dthin(61)=0, dsfcalc(61)=0,
   dfile(62)='oscatbufr', dtype(62)='uv',        dplat(62)=' ',         dsis(62)='uv',                  dval(62)=1.0,  dthin(62)=0, dsfcalc(62)=0,
 /
 &SUPEROB_RADAR
   del_azimuth=5.,del_elev=.25,del_range=5000.,del_time=.5,elev_angle_max=5.,minnum=50,range_max=100000.,
   l2superob_only=.false.,
 /
 &LAG_DATA
 /
 &HYBRID_ENSEMBLE
   l_hyb_ens=${HYBENS_REGIONAL},
   n_ens=${ENSEMBLE_SIZE_REGIONAL},
   uv_hyb_ens=${HYBENS_UV_REGIONAL},
   beta1_inv=${BETA1_INV_REGIONAL},
   s_ens_h=${HYBENS_HOR_SCALE_REGIONAL},
   s_ens_v=${HYBENS_VER_SCALE_REGIONAL},
   generate_ens=${GENERATE_ENS_REGIONAL},
   aniso_a_en=${HYBENS_ANISO_REGIONAL},
   nlon_ens=${NLON_ENS_REGIONAL},
   nlat_ens=${NLAT_ENS_REGIONAL},
   jcap_ens=${JCAP_ENS_REGIONAL},
   jcap_ens_test=${JCAP_ENS_TEST_REGIONAL},
 /
 &RAPIDREFRESH_CLDSURF
   dfi_radar_latent_heat_time_period=30.0,
 /
 &CHEM
 /
 &SINGLEOB_TEST
   maginnov=0.1,magoberr=0.1,oneob_type='t',
   oblat=45.,oblon=270.,obpres=850.,obdattim=${adate},
   obhourset=0.,
 /"

# Define namelist for nmm netcdf run

export nmm_netcdf_namelist="

 &SETUP
   miter=2,niter(1)=50,niter(2)=50,
   write_diag(1)=.true.,write_diag(2)=.false.,write_diag(3)=.true.,
   gencode=78,qoption=2,
   factqmin=0.0,factqmax=0.0,deltim=$DELTIM,
   ndat=62,iguess=-1,
   oneobtest=.false.,retrieval=.false.,
   nhr_assimilation=3,l_foto=.false.,
   use_pbl=.false.,use_compress=.false.,nsig_ext=13,gpstop=30.,
   lrun_subdirs=.true.,
   $SETUP
 /
 &GRIDOPTS
   JCAP=$JCAP,JCAP_B=$JCAP_B,NLAT=$NLAT,NLON=$LONA,nsig=$LEVS,
   wrf_nmm_regional=.true.,wrf_mass_regional=.false.,diagnostic_reg=.false.,
   filled_grid=.false.,half_grid=.true.,netcdf=$NETCDF,
 /
 &BKGERR
   hzscl=0.373,0.746,1.50,
   vs=1.0,bw=0.,fstat=.true.,
 /
 &ANBKGERR
   anisotropic=.false.,an_vs=1.0,ngauss=1,
   an_flen_u=-5.,an_flen_t=3.,an_flen_z=-200.,
   ifilt_ord=2,npass=3,normal=-200,grid_ratio=4.,nord_f2a=4,
 /
 &JCOPTS
 /
 &STRONGOPTS
   nstrong=0,nvmodes_keep=20,period_max=3.,
   baldiag_full=.true.,baldiag_inc=.true.,
 /
 &OBSQC
   dfact=0.75,dfact1=3.0,noiqc=.false.,c_varqc=0.02,vadfile='prepbufr',
 /
 &OBS_INPUT
   dmesh(1)=120.0,dmesh(2)=60.0,dmesh(3)=60.0,dmesh(4)=60.0,dmesh(5)=120,time_window_max=1.5,
   dfile(01)='prepbufr',  dtype(01)='ps',        dplat(01)=' ',         dsis(01)='ps',                  dval(01)=1.0,  dthin(01)=0, dsfcalc(01)=0,
   dfile(02)='prepbufr'   dtype(02)='t',         dplat(02)=' ',         dsis(02)='t',                   dval(02)=1.0,  dthin(02)=0, dsfcalc(02)=0,
   dfile(03)='prepbufr',  dtype(03)='q',         dplat(03)=' ',         dsis(03)='q',                   dval(03)=1.0,  dthin(03)=0, dsfcalc(03)=0,
   dfile(04)='prepbufr',  dtype(04)='uv',        dplat(04)=' ',         dsis(04)='uv',                  dval(04)=1.0,  dthin(04)=0, dsfcalc(04)=0,
   dfile(05)='satwndbufr',    dtype(05)='uv',        dplat(05)=' ',         dsis(05)='uv',                  dval(05)=1.0,  dthin(05)=0, dsfcalc(05)=0,
   dfile(06)='prepbufr',  dtype(06)='spd',       dplat(06)=' ',         dsis(06)='spd',                 dval(06)=1.0,  dthin(06)=0, dsfcalc(06)=0,
   dfile(07)='radarbufr', dtype(07)='rw',        dplat(07)=' ',         dsis(07)='rw',                  dval(07)=1.0,  dthin(07)=0, dsfcalc(07)=0,
   dfile(08)='prepbufr',  dtype(08)='dw',        dplat(08)=' ',         dsis(08)='dw',                  dval(08)=1.0,  dthin(08)=0, dsfcalc(08)=0,
   dfile(09)='prepbufr',  dtype(09)='sst',       dplat(09)=' ',         dsis(09)='sst',                 dval(09)=1.0,  dthin(09)=0, dsfcalc(09)=0,
   dfile(10)='prepbufr',  dtype(10)='pw',        dplat(10)=' ',         dsis(10)='pw',                  dval(10)=1.0,  dthin(10)=0, dsfcalc(10)=0,
   dfile(11)='gpsrobufr', dtype(11)='$gps_dtype',   dplat(11)=' ',         dsis(11)='gps',             dval(11)=1.0,  dthin(11)=0, dsfcalc(11)=0,
   dfile(12)='ssmirrbufr',dtype(12)='pcp_ssmi',  dplat(12)='dmsp',      dsis(12)='pcp_ssmi',            dval(12)=1.0,  dthin(12)=-1,dsfcalc(12)=0,
   dfile(13)='tmirrbufr', dtype(13)='pcp_tmi',   dplat(13)='trmm',      dsis(13)='pcp_tmi',             dval(13)=1.0,  dthin(13)=-1,dsfcalc(13)=0,
   dfile(14)='sbuvbufr',  dtype(14)='sbuv2',     dplat(14)='n16',       dsis(14)='sbuv8_n16',           dval(14)=1.0,  dthin(14)=0, dsfcalc(14)=0,
   dfile(15)='sbuvbufr',  dtype(15)='sbuv2',     dplat(15)='n17',       dsis(15)='sbuv8_n17',           dval(15)=1.0,  dthin(15)=0, dsfcalc(15)=0,
   dfile(16)='sbuvbufr',  dtype(16)='sbuv2',     dplat(16)='n18',       dsis(16)='sbuv8_n18',           dval(16)=1.0,  dthin(16)=0, dsfcalc(16)=0,
   dfile(17)='omi',       dtype(17)='omi',       dplat(17)='aura',      dsis(17)='omi_aura',            dval(17)=1.0,  dthin(17)=6, dsfcalc(17)=0,
   dfile(18)='hirs2bufr', dtype(18)='hirs2',     dplat(18)='n14',       dsis(18)='hirs2_n14',           dval(18)=6.0,  dthin(18)=1, dsfcalc(18)=1,
   dfile(19)='hirs3bufr', dtype(19)='hirs3',     dplat(19)='n16',       dsis(19)='hirs3_n16',           dval(19)=0.0,  dthin(19)=1, dsfcalc(19)=1,
   dfile(20)='hirs3bufr', dtype(20)='hirs3',     dplat(20)='n17',       dsis(20)='hirs3_n17',           dval(20)=6.0,  dthin(20)=1, dsfcalc(20)=1,
   dfile(21)='hirs4bufr', dtype(21)='hirs4',     dplat(21)='n18',       dsis(21)='hirs4_n18',           dval(21)=0.0,  dthin(21)=1, dsfcalc(21)=1,
   dfile(22)='hirs4bufr', dtype(22)='hirs4',     dplat(22)='metop-a',   dsis(22)='hirs4_metop-a',       dval(22)=6.0,  dthin(22)=1, dsfcalc(22)=1,
   dfile(23)='gsndrbufr', dtype(23)='sndr',      dplat(23)='g11',       dsis(23)='sndr_g11',            dval(23)=0.0,  dthin(23)=1, dsfcalc(23)=0,
   dfile(24)='gsndrbufr', dtype(24)='sndr',      dplat(24)='g12',       dsis(24)='sndr_g12',            dval(24)=0.0,  dthin(24)=1, dsfcalc(24)=0,
   dfile(25)='gimgrbufr', dtype(25)='goes_img',  dplat(25)='g11',       dsis(25)='imgr_g11',            dval(25)=0.0,  dthin(25)=1, dsfcalc(25)=0,
   dfile(26)='gimgrbufr', dtype(26)='goes_img',  dplat(26)='g12',       dsis(26)='imgr_g12',            dval(26)=0.0,  dthin(26)=1, dsfcalc(26)=0,
   dfile(27)='airsbufr',  dtype(27)='airs',      dplat(27)='aqua',      dsis(27)='airs281SUBSET_aqua',  dval(27)=20.0, dthin(27)=1, dsfcalc(27)=1,
   dfile(28)='msubufr',   dtype(28)='msu',       dplat(28)='n14',       dsis(28)='msu_n14',             dval(28)=2.0,  dthin(28)=2, dsfcalc(28)=1,
   dfile(29)='amsuabufr', dtype(29)='amsua',     dplat(29)='n15',       dsis(29)='amsua_n15',           dval(29)=10.0, dthin(29)=2, dsfcalc(29)=1,
   dfile(30)='amsuabufr', dtype(30)='amsua',     dplat(30)='n16',       dsis(30)='amsua_n16',           dval(30)=0.0,  dthin(30)=2, dsfcalc(30)=1,
   dfile(31)='amsuabufr', dtype(31)='amsua',     dplat(31)='n17',       dsis(31)='amsua_n17',           dval(31)=0.0,  dthin(31)=2, dsfcalc(31)=1,
   dfile(32)='amsuabufr', dtype(32)='amsua',     dplat(32)='n18',       dsis(32)='amsua_n18',           dval(32)=10.0, dthin(32)=2, dsfcalc(32)=1,
   dfile(33)='amsuabufr', dtype(33)='amsua',     dplat(33)='metop-a',   dsis(33)='amsua_metop-a',       dval(33)=10.0, dthin(33)=2, dsfcalc(33)=1,
   dfile(34)='airsbufr',  dtype(34)='amsua',     dplat(34)='aqua',      dsis(34)='amsua_aqua',          dval(34)=5.0,  dthin(34)=2, dsfcalc(34)=1,
   dfile(35)='amsubbufr', dtype(35)='amsub',     dplat(35)='n15',       dsis(35)='amsub_n15',           dval(35)=3.0,  dthin(35)=3, dsfcalc(35)=1,
   dfile(36)='amsubbufr', dtype(36)='amsub',     dplat(36)='n16',       dsis(36)='amsub_n16',           dval(36)=3.0,  dthin(36)=3, dsfcalc(36)=1,
   dfile(37)='amsubbufr', dtype(37)='amsub',     dplat(37)='n17',       dsis(37)='amsub_n17',           dval(37)=3.0,  dthin(37)=3, dsfcalc(37)=1,
   dfile(38)='mhsbufr',   dtype(38)='mhs',       dplat(38)='n18',       dsis(38)='mhs_n18',             dval(38)=3.0,  dthin(38)=3, dsfcalc(38)=1,
   dfile(39)='mhsbufr',   dtype(39)='mhs',       dplat(39)='metop-a',   dsis(39)='mhs_metop-a',         dval(39)=3.0,  dthin(39)=3, dsfcalc(39)=1,
   dfile(40)='ssmitbufr', dtype(40)='ssmi',      dplat(40)='f13',       dsis(40)='ssmi_f13',            dval(40)=0.0,  dthin(40)=4, dsfcalc(40)=0,
   dfile(41)='ssmitbufr', dtype(41)='ssmi',      dplat(41)='f14',       dsis(41)='ssmi_f14',            dval(41)=0.0,  dthin(41)=4, dsfcalc(41)=0,
   dfile(42)='ssmitbufr', dtype(42)='ssmi',      dplat(42)='f15',       dsis(42)='ssmi_f15',            dval(42)=0.0,  dthin(42)=4, dsfcalc(42)=0,
   dfile(43)='amsrebufr', dtype(43)='amsre_low', dplat(43)='aqua',      dsis(43)='amsre_aqua',          dval(43)=0.0,  dthin(43)=4, dsfcalc(43)=1,
   dfile(44)='amsrebufr', dtype(44)='amsre_mid', dplat(44)='aqua',      dsis(44)='amsre_aqua',          dval(44)=0.0,  dthin(44)=4, dsfcalc(44)=1,
   dfile(45)='amsrebufr', dtype(45)='amsre_hig', dplat(45)='aqua',      dsis(45)='amsre_aqua',          dval(45)=0.0,  dthin(45)=4, dsfcalc(45)=1,
   dfile(46)='ssmisbufr', dtype(46)='ssmis',     dplat(46)='f16',       dsis(46)='ssmis_f16',           dval(46)=0.0,  dthin(46)=4, dsfcalc(46)=1,
   dfile(47)='gsnd1bufr', dtype(47)='sndrd1',    dplat(47)='g12',       dsis(47)='sndrD1_g12',          dval(47)=1.5,  dthin(47)=5, dsfcalc(47)=0,
   dfile(48)='gsnd1bufr', dtype(48)='sndrd2',    dplat(48)='g12',       dsis(48)='sndrD2_g12',          dval(48)=1.5,  dthin(48)=5, dsfcalc(48)=0,
   dfile(49)='gsnd1bufr', dtype(49)='sndrd3',    dplat(49)='g12',       dsis(49)='sndrD3_g12',          dval(49)=1.5,  dthin(49)=5, dsfcalc(49)=0,
   dfile(50)='gsnd1bufr', dtype(50)='sndrd4',    dplat(50)='g12',       dsis(50)='sndrD4_g12',          dval(50)=1.5,  dthin(50)=5, dsfcalc(50)=0,
   dfile(51)='gsnd1bufr', dtype(51)='sndrd1',    dplat(51)='g11',       dsis(51)='sndrD1_g11',          dval(51)=1.5,  dthin(51)=5, dsfcalc(51)=0,
   dfile(52)='gsnd1bufr', dtype(52)='sndrd2',    dplat(52)='g11',       dsis(52)='sndrD2_g11',          dval(52)=1.5,  dthin(52)=5, dsfcalc(52)=0,
   dfile(53)='gsnd1bufr', dtype(53)='sndrd3',    dplat(53)='g11',       dsis(53)='sndrD3_g11',          dval(53)=1.5,  dthin(53)=5, dsfcalc(53)=0,
   dfile(54)='gsnd1bufr', dtype(54)='sndrd4',    dplat(54)='g11',       dsis(54)='sndrD4_g11',          dval(54)=1.5,  dthin(54)=5, dsfcalc(54)=0,
   dfile(55)='gsnd1bufr', dtype(55)='sndrd1',    dplat(55)='g13',       dsis(55)='sndrD1_g13',          dval(55)=1.5,  dthin(55)=5, dsfcalc(55)=0,
   dfile(56)='gsnd1bufr', dtype(56)='sndrd2',    dplat(56)='g13',       dsis(56)='sndrD2_g13',          dval(56)=1.5,  dthin(56)=5, dsfcalc(56)=0,
   dfile(57)='gsnd1bufr', dtype(57)='sndrd3',    dplat(57)='g13',       dsis(57)='sndrD3_g13',          dval(57)=1.5,  dthin(57)=5, dsfcalc(57)=0,
   dfile(58)='gsnd1bufr', dtype(58)='sndrd4',    dplat(58)='g13',       dsis(58)='sndrD4_g13',          dval(58)=1.5,  dthin(58)=5, dsfcalc(58)=0,
   dfile(59)='iasibufr',  dtype(59)='iasi',      dplat(59)='metop-a',   dsis(59)='iasi616_metop-a',     dval(59)=20.0, dthin(59)=1, dsfcalc(59)=1,
   dfile(60)='gomebufr',  dtype(60)='gome',      dplat(60)='metop-a',   dsis(60)='gome_metop-a',        dval(60)=1.0,  dthin(60)=6, dsfcalc(60)=0,
   dfile(61)='mlsbufr',   dtype(61)='mls30',     dplat(61)='aura',      dsis(61)='mls30_aura',          dval(61)=1.0,  dthin(61)=0, dsfcalc(61)=0,
   dfile(62)='oscatbufr', dtype(62)='uv',        dplat(62)=' ',         dsis(62)='uv',                  dval(62)=1.0,  dthin(62)=0, dsfcalc(62)=0,
 /
 &SUPEROB_RADAR
   del_azimuth=5.,del_elev=.25,del_range=5000.,del_time=.5,elev_angle_max=5.,minnum=50,range_max=100000.,
   l2superob_only=.false.,
 /
 &LAG_DATA
 /
 &HYBRID_ENSEMBLE
   l_hyb_ens=${HYBENS_REGIONAL},
   n_ens=${ENSEMBLE_SIZE_REGIONAL},
   uv_hyb_ens=${HYBENS_UV_REGIONAL},
   beta1_inv=${BETA1_INV_REGIONAL},
   s_ens_h=${HYBENS_HOR_SCALE_REGIONAL},
   s_ens_v=${HYBENS_VER_SCALE_REGIONAL},
   generate_ens=${GENERATE_ENS_REGIONAL},
   aniso_a_en=${HYBENS_ANISO_REGIONAL},
   nlon_ens=${NLON_ENS_REGIONAL},
   nlat_ens=${NLAT_ENS_REGIONAL},
   jcap_ens=${JCAP_ENS_REGIONAL},
   jcap_ens_test=${JCAP_ENS_TEST_REGIONAL},
 /
 &RAPIDREFRESH_CLDSURF
   dfi_radar_latent_heat_time_period=30.0,
 /
 &CHEM
 /
 &SINGLEOB_TEST
   maginnov=0.1,magoberr=0.1,oneob_type='t',
   oblat=45.,oblon=270.,obpres=850.,obdattim=${adate},
   obhourset=0.,
 /"

# Define namelist for nems nmmb run

export nems_nmmb_namelist="

 &SETUP
   miter=2,niter(1)=50,niter(2)=50,niter_no_qc(1)=20,
   write_diag(1)=.true.,write_diag(2)=.false.,write_diag(3)=.true.,
   gencode=78,qoption=2,
   factqmin=0.0,factqmax=0.0,deltim=$DELTIM,
   ndat=67,iguess=-1,
   oneobtest=.false.,retrieval=.false.,
   nhr_assimilation=3,l_foto=.false.,
   use_pbl=.false.,use_compress=.false.,nsig_ext=13,gpstop=30.,preserve_restart_date=.true.,
   use_gfs_ozone=.true.,check_gfs_ozone_date=.true.,regional_ozone=.true.,
   lrun_subdirs=.true.,
   $SETUP
 /
 &GRIDOPTS
   JCAP=$JCAP,JCAP_B=$JCAP_B,NLAT=$NLAT,NLON=$LONA,nsig=$LEVS,
   wrf_nmm_regional=.false.,wrf_mass_regional=.false.,nems_nmmb_regional=.true.,diagnostic_reg=.false.,
   nmmb_reference_grid='H',grid_ratio_nmmb=1.412,
   filled_grid=.false.,half_grid=.true.,netcdf=.false.,
 /
 &BKGERR
   hzscl=0.373,0.746,1.50,
   vs=0.6,bw=0.,fstat=.false.,
 /
 &ANBKGERR
   anisotropic=.false.,
 /
 &JCOPTS
 /
 &STRONGOPTS
   nstrong=0,nvmodes_keep=8,period_max=3.,
    baldiag_full=.true.,baldiag_inc=.true.,
 /
 &OBSQC
   dfact=0.75,dfact1=3.0,noiqc=.false.,c_varqc=0.02,
   vadfile='prepbufr',
 /
 &OBS_INPUT
   dmesh(1)=120.0,dmesh(2)=60.0,dmesh(3)=60.0,dmesh(4)=60.0,dmesh(5)=120,time_window_max=1.5,ext_sonde=.true.,
   dfile(01)='prepbufr',  dtype(01)='ps',        dplat(01)=' ',       dsis(01)='ps',                 dval(01)=1.0, dthin(01)=0, dsfcalc(01)=0,
   dfile(02)='prepbufr'   dtype(02)='t',         dplat(02)=' ',       dsis(02)='t',                  dval(02)=1.0, dthin(02)=0, dsfcalc(02)=0,
   dfile(03)='prepbufr',  dtype(03)='q',         dplat(03)=' ',       dsis(03)='q',                  dval(03)=1.0, dthin(03)=0, dsfcalc(03)=0,
   dfile(04)='prepbufr',  dtype(04)='pw',        dplat(04)=' ',       dsis(04)='pw',                 dval(04)=1.0, dthin(04)=0, dsfcalc(04)=0,
   dfile(05)='satwndbufr',    dtype(05)='uv',        dplat(05)=' ',       dsis(05)='uv',                 dval(05)=1.0, dthin(05)=0, dsfcalc(05)=0,
   dfile(06)='prepbufr',  dtype(06)='uv',        dplat(06)=' ',       dsis(06)='uv',                 dval(06)=1.0, dthin(06)=0, dsfcalc(06)=0,
   dfile(07)='prepbufr',  dtype(07)='spd',       dplat(07)=' ',       dsis(07)='spd',                dval(07)=1.0, dthin(07)=0, dsfcalc(07)=0,
   dfile(08)='prepbufr',  dtype(08)='dw',        dplat(08)=' ',       dsis(08)='dw',                 dval(08)=1.0, dthin(08)=0, dsfcalc(08)=0,
   dfile(09)='radarbufr', dtype(09)='rw',        dplat(09)=' ',       dsis(09)='rw',                 dval(09)=1.0, dthin(09)=0, dsfcalc(09)=0,
   dfile(10)='prepbufr',  dtype(10)='sst',       dplat(10)=' ',       dsis(10)='sst',                dval(10)=1.0, dthin(10)=0, dsfcalc(10)=0,
   dfile(11)='gpsrobufr', dtype(11)='$gps_dtype',   dplat(11)=' ',       dsis(11)='gps',            dval(11)=1.0, dthin(11)=0, dsfcalc(11)=0,
   dfile(12)='ssmirrbufr',dtype(12)='pcp_ssmi',  dplat(12)='dmsp',    dsis(12)='pcp_ssmi',           dval(12)=1.0, dthin(12)=-1,dsfcalc(12)=0,
   dfile(13)='tmirrbufr', dtype(13)='pcp_tmi',   dplat(13)='trmm',    dsis(13)='pcp_tmi',            dval(13)=1.0, dthin(13)=-1,dsfcalc(13)=0,
   dfile(14)='sbuvbufr',  dtype(14)='sbuv2',     dplat(14)='n16',     dsis(14)='sbuv8_n16',          dval(14)=1.0, dthin(14)=0, dsfcalc(14)=0,
   dfile(15)='sbuvbufr',  dtype(15)='sbuv2',     dplat(15)='n17',     dsis(15)='sbuv8_n17',          dval(15)=1.0, dthin(15)=0, dsfcalc(15)=0,
   dfile(16)='sbuvbufr',  dtype(16)='sbuv2',     dplat(16)='n18',     dsis(16)='sbuv8_n18',          dval(16)=1.0, dthin(16)=0, dsfcalc(16)=0,
   dfile(17)='hirs2bufr', dtype(17)='hirs2',     dplat(17)='n14',     dsis(17)='hirs2_n14',          dval(17)=6.0, dthin(17)=1, dsfcalc(17)=1,
   dfile(18)='hirs3bufr', dtype(18)='hirs3',     dplat(18)='n16',     dsis(18)='hirs3_n16',          dval(18)=0.0, dthin(18)=1, dsfcalc(18)=1,
   dfile(19)='hirs3bufr', dtype(19)='hirs3',     dplat(19)='n17',     dsis(19)='hirs3_n17',          dval(19)=6.0, dthin(19)=1, dsfcalc(19)=1,
   dfile(20)='hirs4bufr', dtype(20)='hirs4',     dplat(20)='n18',     dsis(20)='hirs4_n18',          dval(20)=0.0, dthin(20)=1, dsfcalc(20)=1,
   dfile(21)='hirs4bufr', dtype(21)='hirs4',     dplat(21)='metop-a', dsis(21)='hirs4_metop-a',      dval(21)=6.0, dthin(21)=1, dsfcalc(21)=1,
   dfile(22)='gsndrbufr', dtype(22)='sndr',      dplat(22)='g11',     dsis(22)='sndr_g11',           dval(22)=0.0, dthin(22)=1, dsfcalc(22)=0,
   dfile(23)='gsndrbufr', dtype(23)='sndr',      dplat(23)='g12',     dsis(23)='sndr_g12',           dval(23)=0.0, dthin(23)=1, dsfcalc(23)=0,
   dfile(24)='gimgrbufr', dtype(24)='goes_img',  dplat(24)='g11',     dsis(24)='imgr_g11',           dval(24)=0.0, dthin(24)=1, dsfcalc(24)=0,
   dfile(25)='gimgrbufr', dtype(25)='goes_img',  dplat(25)='g12',     dsis(25)='imgr_g12',           dval(25)=0.0, dthin(25)=1, dsfcalc(25)=0,
   dfile(26)='airsbufr',  dtype(26)='airs',      dplat(26)='aqua',    dsis(26)='airs281SUBSET_aqua', dval(26)=20.0,dthin(26)=1, dsfcalc(26)=1,
   dfile(27)='msubufr',   dtype(27)='msu',       dplat(27)='n14',     dsis(27)='msu_n14',            dval(27)=2.0, dthin(27)=2, dsfcalc(27)=1,
   dfile(28)='amsuabufr', dtype(28)='amsua',     dplat(28)='n15',     dsis(28)='amsua_n15',          dval(28)=10.0,dthin(28)=2, dsfcalc(28)=1,
   dfile(29)='amsuabufr', dtype(29)='amsua',     dplat(29)='n16',     dsis(29)='amsua_n16',          dval(29)=0.0, dthin(29)=2, dsfcalc(29)=1,
   dfile(30)='amsuabufr', dtype(30)='amsua',     dplat(30)='n17',     dsis(30)='amsua_n17',          dval(30)=0.0, dthin(30)=2, dsfcalc(30)=1,
   dfile(31)='amsuabufr', dtype(31)='amsua',     dplat(31)='n18',     dsis(31)='amsua_n18',          dval(31)=10.0,dthin(31)=2, dsfcalc(31)=1,
   dfile(32)='amsuabufr', dtype(32)='amsua',     dplat(32)='metop-a', dsis(32)='amsua_metop-a',      dval(32)=10.0,dthin(32)=2, dsfcalc(32)=1,
   dfile(33)='airsbufr',  dtype(33)='amsua',     dplat(33)='aqua',    dsis(33)='amsua_aqua',         dval(33)=5.0, dthin(33)=2, dsfcalc(33)=1,
   dfile(34)='amsubbufr', dtype(34)='amsub',     dplat(34)='n15',     dsis(34)='amsub_n15',          dval(34)=3.0, dthin(34)=3, dsfcalc(34)=1,
   dfile(35)='amsubbufr', dtype(35)='amsub',     dplat(35)='n16',     dsis(35)='amsub_n16',          dval(35)=3.0, dthin(35)=3, dsfcalc(35)=1,
   dfile(36)='amsubbufr', dtype(36)='amsub',     dplat(36)='n17',     dsis(36)='amsub_n17',          dval(36)=3.0, dthin(36)=3, dsfcalc(36)=1,
   dfile(37)='mhsbufr',   dtype(37)='mhs',       dplat(37)='n18',     dsis(37)='mhs_n18',            dval(37)=3.0, dthin(37)=3, dsfcalc(37)=1,
   dfile(38)='mhsbufr',   dtype(38)='mhs',       dplat(38)='metop-a', dsis(38)='mhs_metop-a',        dval(38)=3.0, dthin(38)=3, dsfcalc(38)=1,
   dfile(39)='ssmitbufr', dtype(39)='ssmi',      dplat(39)='f13',     dsis(39)='ssmi_f13',           dval(39)=0.0, dthin(39)=4, dsfcalc(39)=0,
   dfile(40)='ssmitbufr', dtype(40)='ssmi',      dplat(40)='f14',     dsis(40)='ssmi_f14',           dval(40)=0.0, dthin(40)=4, dsfcalc(40)=0,
   dfile(41)='ssmitbufr', dtype(41)='ssmi',      dplat(41)='f15',     dsis(41)='ssmi_f15',           dval(41)=0.0, dthin(41)=4, dsfcalc(41)=0,
   dfile(42)='amsrebufr', dtype(42)='amsre_low', dplat(42)='aqua',    dsis(42)='amsre_aqua',         dval(42)=0.0, dthin(42)=4, dsfcalc(42)=1,
   dfile(43)='amsrebufr', dtype(43)='amsre_mid', dplat(43)='aqua',    dsis(43)='amsre_aqua',         dval(43)=0.0, dthin(43)=4, dsfcalc(43)=1,
   dfile(44)='amsrebufr', dtype(44)='amsre_hig', dplat(44)='aqua',    dsis(44)='amsre_aqua',         dval(44)=0.0, dthin(44)=4, dsfcalc(44)=1,
   dfile(45)='ssmisbufr', dtype(45)='ssmis',     dplat(45)='f16',     dsis(45)='ssmis_f16',          dval(45)=0.0, dthin(45)=4, dsfcalc(45)=1,
   dfile(46)='gsnd1bufr', dtype(46)='sndrd1',    dplat(46)='g12',     dsis(46)='sndrD1_g12',         dval(46)=1.5, dthin(46)=5, dsfcalc(46)=0,
   dfile(47)='gsnd1bufr', dtype(47)='sndrd2',    dplat(47)='g12',     dsis(47)='sndrD2_g12',         dval(47)=1.5, dthin(47)=5, dsfcalc(47)=0,
   dfile(48)='gsnd1bufr', dtype(48)='sndrd3',    dplat(48)='g12',     dsis(48)='sndrD3_g12',         dval(48)=1.5, dthin(48)=5, dsfcalc(48)=0,
   dfile(49)='gsnd1bufr', dtype(49)='sndrd4',    dplat(49)='g12',     dsis(49)='sndrD4_g12',         dval(49)=1.5, dthin(49)=5, dsfcalc(49)=0,
   dfile(50)='gsnd1bufr', dtype(50)='sndrd1',    dplat(50)='g11',     dsis(50)='sndrD1_g11',         dval(50)=1.5, dthin(50)=5, dsfcalc(50)=0,
   dfile(51)='gsnd1bufr', dtype(51)='sndrd2',    dplat(51)='g11',     dsis(51)='sndrD2_g11',         dval(51)=1.5, dthin(51)=5, dsfcalc(51)=0,
   dfile(52)='gsnd1bufr', dtype(52)='sndrd3',    dplat(52)='g11',     dsis(52)='sndrD3_g11',         dval(52)=1.5, dthin(52)=5, dsfcalc(52)=0,
   dfile(53)='gsnd1bufr', dtype(53)='sndrd4',    dplat(53)='g11',     dsis(53)='sndrD4_g11',         dval(53)=1.5, dthin(53)=5, dsfcalc(53)=0,
   dfile(54)='gsnd1bufr', dtype(54)='sndrd1',    dplat(54)='g13',     dsis(54)='sndrD1_g13',         dval(54)=1.5, dthin(54)=5, dsfcalc(54)=0,
   dfile(55)='gsnd1bufr', dtype(55)='sndrd2',    dplat(55)='g13',     dsis(55)='sndrD2_g13',         dval(55)=1.5, dthin(55)=5, dsfcalc(55)=0,
   dfile(56)='gsnd1bufr', dtype(56)='sndrd3',    dplat(56)='g13',     dsis(56)='sndrD3_g13',         dval(56)=1.5, dthin(56)=5, dsfcalc(56)=0,
   dfile(57)='gsnd1bufr', dtype(57)='sndrd4',    dplat(57)='g13',     dsis(57)='sndrD4_g13',         dval(57)=1.5, dthin(57)=5, dsfcalc(57)=0,
   dfile(58)='iasibufr',  dtype(58)='iasi',      dplat(58)='metop-a', dsis(58)='iasi616_metop-a',    dval(58)=20.0,dthin(58)=1, dsfcalc(58)=1,
   dfile(59)='gomebufr',  dtype(59)='gome',      dplat(59)='metop-a', dsis(59)='gome_metop-a',       dval(59)=1.0, dthin(59)=6, dsfcalc(59)=0,
   dfile(60)='omibufr',   dtype(60)='omi',       dplat(60)='aura',    dsis(60)='omi_aura',           dval(60)=1.0, dthin(60)=6, dsfcalc(60)=0,
   dfile(61)='sbuvbufr',  dtype(61)='sbuv2',     dplat(61)='n19',     dsis(61)='sbuv8_n19',          dval(61)=1.0, dthin(61)=0, dsfcalc(61)=0,
   dfile(62)='hirs4bufr', dtype(62)='hirs4',     dplat(62)='n19',     dsis(62)='hirs4_n19',          dval(62)=6.0, dthin(62)=1, dsfcalc(62)=1,
   dfile(63)='amsuabufr', dtype(63)='amsua',     dplat(63)='n19',     dsis(63)='amsua_n19',          dval(63)=10.0,dthin(63)=2, dsfcalc(63)=1,
   dfile(64)='mhsbufr',   dtype(64)='mhs',       dplat(64)='n19',     dsis(64)='mhs_n19',            dval(64)=3.0, dthin(64)=3, dsfcalc(64)=1,
   dfile(65)='tcvitl'     dtype(65)='tcp',       dplat(65)=' ',       dsis(65)='tcp',                dval(65)=1.0, dthin(65)=0, dsfcalc(65)=0,
   dfile(66)='mlsbufr',   dtype(66)='mls30',     dplat(66)='aura',    dsis(66)='mls30_aura',         dval(66)=1.0, dthin(66)=0, dsfcalc(66)=0,
   dfile(67)='oscatbufr', dtype(67)='uv',        dplat(67)=' ',       dsis(67)='uv',                 dval(67)=1.0, dthin(67)=0, dsfcalc(67)=0,
/
 &SUPEROB_RADAR
   del_azimuth=5.,del_elev=.25,del_range=5000.,del_time=.5,elev_angle_max=5.,minnum=50,range_max=100000.,
   l2superob_only=.false.,
 /
 &LAG_DATA
 /
 &HYBRID_ENSEMBLE
   l_hyb_ens=${HYBENS_REGIONAL},
   n_ens=${ENSEMBLE_SIZE_REGIONAL},
   uv_hyb_ens=${HYBENS_UV_REGIONAL},
   beta1_inv=${BETA1_INV_REGIONAL},
   s_ens_h=${HYBENS_HOR_SCALE_REGIONAL},
   s_ens_v=${HYBENS_VER_SCALE_REGIONAL},
   generate_ens=${GENERATE_ENS_REGIONAL},
   aniso_a_en=${HYBENS_ANISO_REGIONAL},
   nlon_ens=${NLON_ENS_REGIONAL},
   nlat_ens=${NLAT_ENS_REGIONAL},
   jcap_ens=${JCAP_ENS_REGIONAL},
   jcap_ens_test=${JCAP_ENS_TEST_REGIONAL},
   full_ensemble=.true.,betaflg=.true.,pwgtflg=.true.,
 /
 &RAPIDREFRESH_CLDSURF
   dfi_radar_latent_heat_time_period=30.0,
 /
 &CHEM
 /
 &SINGLEOB_TEST
   maginnov=0.1,magoberr=0.1,oneob_type='t',
   oblat=45.,oblon=270.,obpres=850.,obdattim=${adate},
   obhourset=0.,
 /"

# Define namelist for cmaq binary run

 export cmaq_binary_namelist="

 &SETUP
   miter=2,niter(1)=50,niter(2)=50,
   write_diag(1)=.true.,write_diag(2)=.false.,write_diag(3)=.true.,
   gencode=78,qoption=2,
   factqmin=0.0,factqmax=0.0,deltim=$DELTIM,
   ndat=1,iguess=-1,
   oneobtest=.false.,retrieval=.false.,
   nhr_assimilation=3,l_foto=.false.,
   use_pbl=.false.,use_compress=.false.,
   diag_conv=.true.,lrun_subdirs=.true.,
   $SETUP
 /
 &GRIDOPTS
   JCAP=$JCAP,NLAT=$NLAT,NLON=$LONA,nsig=$LEVS,
   wrf_nmm_regional=.false.,wrf_mass_regional=.false.,
   cmaq_regional=.true.,diagnostic_reg=.true.,
   filled_grid=.false.,half_grid=.true.,netcdf=.false.,
 /
 &BKGERR
   hzscl=0.373,0.746,1.50,
   vs=1.0,bw=0.,fstat=.true.,
 /
 &ANBKGERR
   anisotropic=.false.,an_vs=1.0,ngauss=1,
   an_flen_u=-5.,an_flen_t=3.,an_flen_z=-200.,
   ifilt_ord=2,npass=3,normal=-200,grid_ratio=4.,nord_f2a=4,
 /
 &JCOPTS
 /
 &STRONGOPTS
   nstrong=0,nvmodes_keep=20,
   period_max=3.,baldiag_full=.true.,baldiag_inc=.true.,
 /
 &OBSQC
   dfact=0.75,dfact1=3.0,noiqc=.false.,c_varqc=0.02,vadfile='prepbufr',
 /
 &OBS_INPUT
   dmesh(1)=120.0,dmesh(2)=60.0,dmesh(3)=60.0,dmesh(4)=60.0,
   dmesh(5)=120,time_window_max=1.5,
   dfile(01)='anowbufr',  dtype(01)='pm2_5',        dplat(01)=' ',         dsis(01)='TEOM',             dval(01)=1.0,  dthin(01)=0,
 /
!max name length for dfile=13
!max name length for dtype=10
 &SUPEROB_RADAR
   del_azimuth=5.,del_elev=.25,del_range=5000.,del_time=.5,elev_angle_max=5.,minnum=50,range_max=100000.,
   l2superob_only=.false.,
 /
 &LAG_DATA
 /
 &HYBRID_ENSEMBLE
 /
 &RAPIDREFRESH_CLDSURF
   dfi_radar_latent_heat_time_period=30.0,
 /
 &CHEM
   berror_chem=.true.,
   oneobtest_chem=.false.,
   maginnov_chem=60,magoberr_chem=2.,oneob_type_chem='pm2_5',
   oblat_chem=45.,oblon_chem=270.,obpres_chem=1000.,
   diag_incr=.true.,elev_tolerance=500.,tunable_error=0.5,
   in_fname="\""${cmaq_input}"\"",out_fname="\""${cmaq_output}"\"",
   incr_fname="\""${chem_increment}"\"",
!diag_incr for diagnostic increment output
 /
 &SINGLEOB_TEST
   maginnov=5,magoberr=0.1,oneob_type='t',
   oblat=45.,oblon=270.,obpres=1000.,obdattim=${adate},
   obhourset=0.,
 /"