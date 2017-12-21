#!/bin/sh

#--------------------------------------------------------------------
#  VrfyRad_glbl.sh
#
#  Verification and data extraction script for global (GDAS) radiance
#  diagnostic data.
#
#  This script verifies data is available and submits the 
#  JGDAS_VRFYRAD.sms.prod job, which performs the data extraction 
#  and validation checks. 
#--------------------------------------------------------------------
set -ax
echo start VrfyRad_glbl.sh


#--------------------------------------------------------------------
#  usage
#--------------------------------------------------------------------
function usage {
  echo "Usage:  VrfyRad_glbl.sh suffix [pdate]"
  echo "            Suffix is the indentifier for this data source."
  echo "            Pdate is the full YYYYMMDDHH cycle to run.  This param is optional"
}

#--------------------------------------------------------------------
#  VrfyRad_glbl.sh begins here
#--------------------------------------------------------------------
nargs=$#
if [[ $nargs -lt 1 || $nargs -gt 3 ]]; then
   usage
   exit 1
fi

this_file=`basename $0`
this_dir=`dirname $0`

#--------------------------------------------------------------------
#  Eventually remove RUN_ENVIR argument but allow for it to possibly be
#  present as $2 to ensure backward compatibility.
#  
#  if $COMOUT is defined then assume we're in a parallel.
#--------------------------------------------------------------------
export SUFFIX=$1
export RUN_ENVIR=""

if [[ $nargs -ge 2 ]]; then
   if [[ $2 = "dev" || $2 = "para" ]]; then
      export RUN_ENVIR=$2;
   else 
      export PDATE=$2;
   fi

   if [[ $nargs -eq 3 ]]; then
      export PDATE=$3;
   fi
fi

if [[ $RUN_ENVIR = "" ]]; then
  export RUN_ENVIR="para"
  if [[ $COMOUT = "" ]]; then
     export RUN_ENVIR="dev"
  fi
fi

echo SUFFIX = $SUFFIX
echo RUN_ENVIR = $RUN_ENVIR


#--------------------------------------------------------------------
# Set environment variables
#--------------------------------------------------------------------
export RAD_AREA=glb
export MAKE_CTL=${MAKE_CTL:-1}
export MAKE_DATA=${MAKE_DATA:-1}

if [[ $RUN_ENVIR = para || $RUN_ENVIR = prod ]]; then
   this_dir=${VRFYRAD_DIR}
fi


top_parm=${this_dir}/../../parm

if [[ -s ${top_parm}/RadMon_config ]]; then
   . ${top_parm}/RadMon_config
   . ${top_parm}/RadMon_user_settings
else
   echo "Unable to source RadMon_config file in ${top_parm}"
   exit 2
fi

. ${RADMON_DATA_EXTRACT}/parm/data_extract_config
. ${PARMverf_rad}/glbl_conf


#--------------------------------------------------------------------
#  Check setting of RUN_ONLY_ON_DEV and possible abort if on prod and
#  not permitted to run there.
#--------------------------------------------------------------------

if [[ RUN_ONLY_ON_DEV -eq 1 ]]; then
   is_prod=`${USHverf_rad}/AmIOnProd.sh`
   if [[ $is_prod = 1 ]]; then
      exit 10
   fi
fi


mkdir -p $TANKDIR
mkdir -p $LOGDIR

jobname=${DATA_EXTRACT_JOBNAME}

#--------------------------------------------------------------------
# Check status of monitoring job.  Are any earlier verf jobs still 
# running?  If so, exit this script and wait for job to finish.  
#
# If we're good to go clean out the $LOADLQ directory and proceed.
#--------------------------------------------------------------------

if [[ $RUN_ENVIR = dev ]]; then
   if [[ $MY_MACHINE = "wcoss" ]]; then
      total=`bjobs -l | grep ${jobname} | wc -l`
   elif [[ $MY_MACHINE = "zeus" ]]; then
      total=`qstat -u ${LOGNAME} | grep ${jobname} | wc -l`
   elif [[ $MY_MACHINE = "badger" ]]; then
      total=`qstat -u ${LOGNAME} | grep ${jobname} | wc -l`
   elif [[ $MY_MACHINE = "cardinal" ]]; then
      total=`qstat -u ${LOGNAME} | grep ${jobname} | wc -l`
   fi

   if [[ $total -gt 0 ]]; then
      exit 3
   fi

fi


#------------------------------------------------------------------
#  define data file sources depending on $RUN_ENVIR
#
#  need to idenfity correct output location(s) for binary files
#------------------------------------------------------------------
if [[ $RUN_ENVIR = dev ]]; then

   #---------------------------------------------------------------
   # Get date of cycle to process.
   #---------------------------------------------------------------
   if [[ $PDATE = "" ]]; then
      pdate=`${USHverf_rad}/find_cycle.pl 1 ${TANKDIR}`
      if [[ ${#pdate} -ne 10 ]]; then
         echo "ERROR:  Unable to locate any previous cycle's data files"
         echo "        Please re-run this script with a specified starting cycle as the last argument"
         exit 4
      fi
      qdate=`${NDATE} +06 $pdate`
      export PDATE=${qdate}
   fi

   export PDY=`echo $PDATE|cut -c1-8`
   export CYC=`echo $PDATE|cut -c9-10`

   export DATDIR=${RADSTAT_LOCATION}

   #---------------------------------------------------------------
   # Locate required files.             
   #---------------------------------------------------------------
   if [[ -d ${DATDIR}/gdas.$PDY ]]; then
      export DATDIR=${DATDIR}/gdas.${PDY}

      export biascr=$DATDIR/gdas1.t${CYC}z.abias  
#      export satang=$DATDIR/gdas1.t${CYC}z.satang
      export radstat=$DATDIR/gdas1.t${CYC}z.radstat
   else
      export biascr=$DATDIR/biascr.gdas.${PDATE}  
#      export satang=$DATDIR/satang.gdas.${PDATE}
      export radstat=$DATDIR/radstat.gdas.${PDATE}
   fi

elif [[ $RUN_ENVIR = para ]]; then

   #---------------------------------------------------------------
   # Locate required files.             
   #---------------------------------------------------------------
   export DATDIR=$COMOUT 
   export PDATE=$CDATE
   export PDY=`echo $PDATE|cut -c1-8`
   export CYC=`echo $PDATE|cut -c9-10`

   export biascr=$DATDIR/biascr.gdas.${CDATE}  
#   export satang=$DATDIR/satang.gdas.${CDATE}
   export radstat=$DATDIR/radstat.gdas.${CDATE}

   echo biascr  = $biascr
#   echo satang  = $satang
   echo radstat = $radstat

else
   echo "error RUN_ENVIR = $RUN_ENVIR, not dev or para"
   exit 2
fi


#--------------------------------------------------------------------
# If data is available, export variables, and submit driver for
# radiance monitoring jobs.
#--------------------------------------------------------------------
data_available=0

if [[ -e ${radstat} ]]; then
   data_available=1                                         

   export MP_SHARED_MEMORY=yes
   export MEMORY_AFFINITY=MCM
   export envir=prod
   
   export cyc=$CYC
   export job=gdas_vrfyrad_${PDY}${cyc}
   export SENDSMS=${SENDSMS:-NO}
   export DATA_IN=${WORKverf_rad}
   export DATA=${DATA:-$STMP/$LOGNAME/radmon}
   export jlogfile=${WORKverf_rad}/jlogfile_${SUFFIX}
   export TANKverf=${MY_TANKDIR}/stats/${SUFFIX}

   export VERBOSE=${VERBOSE:-YES}
  

   if [[ $CYC = "00" ]]; then
      mkdir -p ${TANKverf}/radmon.${PDY}
      prev_day=`${NDATE} -06 $PDATE | cut -c1-8`
      cp ${TANKverf}/radmon.${prev_day}/gdas_radmon_satype.txt ${TANKverf}/radmon.${PDY}/.
   fi

   
   #------------------------------------------------------------------
   #   Override the default base_file declaration if there is an  
   #   available base file for this source.
   #------------------------------------------------------------------
   if [[ -s ${TANKverf}/info/radmon_base.tar.Z || -s ${TANKverf}/info/radmon_base.tar ]]; then
      export base_file=${TANKverf}/info/radmon_base.tar 
   fi

   export JOBNAME=${jobname}


   #------------------------------------------------------------------
   #   Submit data processing jobs.
   #------------------------------------------------------------------
   if [[ $MY_MACHINE = "wcoss" ]]; then
      $SUB -q $JOB_QUEUE -P $PROJECT -o $LOGDIR/data_extract.${PDY}.${cyc}.log -M 100 -R affinity[core] -W 0:30 -J ${jobname} $HOMEgfs/jobs/JGDAS_VRFYRAD.sms.prod

   elif [[ $MY_MACHINE = "zeus" ]]; then
      $SUB -A $ACCOUNT -l procs=1,walltime=0:10:00 -N ${jobname} -V -o $LOGDIR/data_extract.${PDY}.${CYC}.log -e $LOGDIR/error_file.${PDY}.${CYC}.log $HOMEgfs/jobs/JGDAS_VRFYRAD.sms.prod
   elif [[ $MY_MACHINE = "badger" ]]; then
      $SUB -pe smp 48 -N ${jobname} -V $HOMEgfs/jobs/JGDAS_VRFYRAD.sms.prod
   elif [[ $MY_MACHINE = "cardinal" ]]; then
      $SUB -J ${jobname} -s -o $LOGDIR/data_extract.${PDY}.${CYC}.log -e $LOGDIR/error_file.${PDY}.${CYC}.log $HOMEgfs/jobs/JGDAS_VRFYRAD.sms.prod
   fi
  
fi

#--------------------------------------------------------------------
# Clean up and exit
#--------------------------------------------------------------------
#cd $tmpdir
#cd ../
#rm -rf $tmpdir

exit_value=0
if [[ ${data_available} -ne 1 ]]; then
   exit_value=5
   echo No data available for ${SUFFIX}
fi

echo end VrfyRad_glbl.sh


exit ${exit_value}
