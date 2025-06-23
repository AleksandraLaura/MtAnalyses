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

#module load haplogrep/3.2.1

#in case it doesn't work, run this first:
#haplogrep3 install-tree phylotree-rcrs@17.2

haplogrep3 classify --in /home/wmj412/data/birchpitch/haplotype_analyses/mt_consensus/${SAMPLE_TYPE}/${base}.consensusMT.fasta --tree "phylotree-rcrs@17.2" --out haplogrep_output/$SAMPLE_TYPE/$base.haplogrep
