#!/bin/bash

#SBATCH -c 4
#SBATCH --mem-per-cpu 36G
#SBATCH --time=01:00:00
#SBATCH --array=1-367%4
#SBATCH --mail-type=END
#SBATCH --mail-user=aleksandra.pach@sund.ku.dk


########################### CHANGE THIS ###########################
SAMPLE_TYPE=library
###################################################################


SAMPLE_LIST=samples_${SAMPLE_TYPE}.txt
SAMPLE=$(sed -n "$SLURM_ARRAY_TASK_ID"p $SAMPLE_LIST)
base=$(basename "$SAMPLE" .bam)

#module load samtools
#module load perl
#module load gsl/2.5
#module load bcftools



#FIRST RUN THE FIRST COMMAND THEN THE SECOND (ADD AND REMOVE #):

#samtools index mt_bams/${SAMPLE_TYPE}/${base}_MT.bam
bcftools index mt_vcfs/${SAMPLE_TYPE}/${base}_MT.vcf.gz
