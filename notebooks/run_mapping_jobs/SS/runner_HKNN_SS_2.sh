#!/bin/bash
#SBATCH --job-name=HKNN_SS_2_job    # Job name
#SBATCH --mail-type=BEGIN,END,FAIL          # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=clare.morris@alleninstitute.org     # Where to send mail  
#SBATCH --ntasks=1                    # Run on a single CPU
#SBATCH --mem=500gb                     # Job memory request (per node)
#SBATCH --time=240:00:00               # Time limit hrs:min:sec
#SBATCH --output=logfiles/HKNN_SS_2_job_%j.log   # Standard output and error log
#SBATCH --partition celltypes         # Partition used for processing
#SBATCH --tmp=350G                     # Request the amount of space your jobs needs on /scratch/fast
mkdir $TMPDIR/tmp
singularity exec --bind=/scratch/fast/$SLURM_JOBID/tmp:/tmp docker://alleninst/mapping_on_hpc Rscript R_scripts/SS_HKNN_2.R > logfiles/HKNN_SS_2_logfile
