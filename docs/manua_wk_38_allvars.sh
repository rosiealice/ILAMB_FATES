#!/bin/bash
#PBS -N ilamb_diagnostics
#PBS -q main
#PBS -r n
#PBS -j oe
#PBS -V
#PBS -S /bin/bash
#PBS -l select=1:ncpus=32:mpiprocs=8:ompthreads=4
#PBS -l walltime=12:00:00
#PBS -A P93300041
#PBS -M rfisher@ucar.edu


#export MPI_UNBUFFERED_STDIO=true
#export TMPDIR=$TMPDIR
#mkdir -p $TMPDIR

export OMP_NUM_THREADS=4
##need to play with PBS -l settings
__conda_setup="$('/glade/u/apps/opt/conda/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
eval "$__conda_setup"



conda activate npl
#export MPLBACKEND=Agg

#do not delete this. 
export ILAMB_ROOT=/glade/p/cesm/lmwg_dev/oleson/ILAMB/ILAMB_all
cd ~/fates-global-cal/ilamb_scripts

#mpirun -n 8 ilamb-run --config ~/fates-global-cal/ilamb_scripts/config_files/ilamb_CLMFATES_simple.cfg --model_root  /glade/cheyenne/scratch/rfisher/ --models  RTM_ens36_case_0  RTM_ens36_case_1  --model_setup  ~/fates-global-cal/ilamb_scripts/model_setup_files/model_setup_090623_RTMens36_shift  --filter  .clm2.h0.200

mpirun -n 8 ilamb-run --config ~/fates-global-cal/ilamb_scripts/config_files/clm_fates_RCmodes_nospinup.cfg --model_root  /glade/cheyenne/scratch/rfisher/ --models  RTM_ens38_case_0 RTM_ens38_case_1 RTM_ens38_case_2  RTM_ens38_case_3 RTM_ens38_case_4 --model_setup  ~/fates-global-cal/ilamb_scripts/model_setup_files/model_setup_090623_RTMens38_shift  --filter  .clm2.h0.21 --build_dir ~/fates-global-cal/ilamb_scripts/builddir --clean


# --build_dir ~/fates-global-cal/ilamb_scripts/builddir


