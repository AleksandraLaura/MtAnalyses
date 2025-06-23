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


/projects/mjolnir1/people/wmj412/birchpitch/haplotype_analyses/cloudgene run haplocheck@1.3.3 --format bam --files /home/wmj412/data/birchpitch/haplotype_analyses/mt_bams/${SAMPLE_TYPE} --output /home/wmj412/data/birchpitch/haplotype_analyses/haplocheck_output/${SAMPLE_TYPE}
