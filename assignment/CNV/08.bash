#!/bin/bash
#SBATCH --chdir=.
#SBATCH --cpus-per-task=10
#SBATCH --error='%x-%A.txt'
#SBATCH --output='%x-%A.txt'
#SBATCH --job-name=BME610-08
#SBATCH --mem=20G
#SBATCH --export=ALL
# DO NOT MODIFY the above lines
cnvkit.py batch --processes 10 --normal "$(realpath ../12N.Sort.MarkDuplicates.BQSR.bam)" --fasta "/BiO/Share/Tools/gatk-bundle/hg38/Homo_sapiens_assembly38.fasta" --targets "/BiO/Share/Database/UCSC/hg38/UCSC_hg38.bed" --annotate "/BiO/Share/Database/UCSC/hg38/refFlat.txt"  --scatter --diagram --output-dir "$(realpath .)" "$(realpath ../12T.Sort.MarkDuplicates.BQSR.bam)"
grep --invert-match '_' "$(realpath ./12T.Sort.MarkDuplicates.BQSR.cnr)" > "$(realpath 12T.cnr)"
cnvkit.py segment --output 12T.cns --processes 10 12T.cnr
cnvkit.py diagram --segment 12T.cns --output Diagram.pdf 12T.cnr && pdftoppm Diagram.pdf Diagram.png -png
cnvkit.py scatter --segment 12T.cns --vcf "$(realpath ../12.PASS.vcf)" --output Scatter.pdf 12T.cnr && pdftoppm Scatter.pdf Scatter -png
cnvkit.py heatmap --output Heatmap.pdf 12T.cns && pdftoppm Heatmap.pdf Heatmap -png
