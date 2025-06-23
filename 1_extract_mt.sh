#!/bin/bash

#SBATCH -c 4
#SBATCH --mem-per-cpu 36G
#SBATCH --time=01:00:00
#SBATCH --array=1-82%4
#SBATCH --mail-type=END
#SBATCH --mail-user=aleksandra.pach@sund.ku.dk


SAMPLE_TYPE=merged
SAMPLE_LIST=samples_${SAMPLE_TYPE}.txt
SAMPLE=$(sed -n "$SLURM_ARRAY_TASK_ID"p $SAMPLE_LIST)
base=$(basename "$SAMPLE" .bam)

#module load samtools


# Create the output file name with _MT.bam suffix
output="${base}_MT.bam"


# Extract the MT sequences using samtools
samtools view -b original_bams/${SAMPLE_TYPE}/"$base".bam MT > mt_bams/${SAMPLE_TYPE}/"$output"
