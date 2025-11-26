#!/bin/bash
#SBATCH --chdir=.
#SBATCH --cpus-per-task=10
#SBATCH --error='%x-%A.txt'
#SBATCH --output='%x-%A.txt'
#SBATCH --job-name=BME610-07
#SBATCH --mem=20G
#SBATCH --export=ALL
# DO NOT MODIFY the above lines
mkdir -p input && ln -sfv "$(realpath ../SAMPLE.PASS.vcf)" "$(realpath input)"

python3 -c "from SigProfilerMatrixGenerator import install as genInstall; genInstall.install('GRCh38')"
SigProfilerMatrixGenerator matrix_generator --exome 'SAMPLE' 'GRCh38' "$(realpath .)"

python3 -c "from SigProfilerExtractor import sigpro; sigpro.sigProfilerExtractor(input_type='vcf', input_data='$(realpath ./input)', output='$(realpath ./output)', reference_genome='GRCh38', exome=True, cpu=10, assignment_cpu=10)"

rm -rfv Plot
SigProfilerPlotting plotSBS --savefig_format 'png' --dpi 600 "$(realpath ./output/SBS/SAMPLE.SBS96.exome)" "$(realpath Plot)" 'SAMPLE' '96'
SigProfilerPlotting plotSBS --savefig_format 'png' --dpi 600 "$(realpath ./output/SBS/SAMPLE.SBS6.exome)" "$(realpath Plot)" 'SAMPLE' '6'
mv -vf ./*.png Plot
