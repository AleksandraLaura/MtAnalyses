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

#module load perl
#module load gsl/2.5
#module load bcftools


bcftools mpileup -Ob -o mt_vcfs/${SAMPLE_TYPE}/${base}_MT.bcf -f /projects/mjolnir1/data/genomes/human/hs.build37.1.fasta mt_bams/${SAMPLE_TYPE}/${base}_MT.bam
bcftools call -vmO z -o mt_vcfs/${SAMPLE_TYPE}/${base}_MT.vcf.gz mt_vcfs/${SAMPLE_TYPE}/${base}_MT.bcf --ploidy 1
