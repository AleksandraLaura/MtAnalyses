#!/bin/bash

#SBATCH -c 4
#SBATCH --mem-per-cpu 36G
#SBATCH --time=01:00:00
#SBATCH --mail-type=END
#SBATCH --mail-user=aleksandra.pach@sund.ku.dk

########################### CHANGE THIS ###########################
SAMPLE_TYPE=merged
###################################################################


SAMPLE_LIST=samples_${SAMPLE_TYPE}.txt
SAMPLE=$(sed -n "$SLURM_ARRAY_TASK_ID"p $SAMPLE_LIST)
base=$(basename "$SAMPLE" .bam)

#module load vgan/3.0.0

# Create the output file name with _MT.bam suffix
output="${base}_MT.bam"


samtools bam2fq mt_bams/${SAMPLE_TYPE}/"$output" > mt_fastqs/${SAMPLE_TYPE}/$SAMPLE.fq

vgan haplocart -fq1 mt_fastqs/${SAMPLE_TYPE}/$SAMPLE.fq



#for more information see: https://github.com/grenaud/vgan/wiki/HaploCart
