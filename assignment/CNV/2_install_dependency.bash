#!/bin/bash
pip3 install --requirement 2_requirements.txt
Rscript --vanilla -e 'install.packages("BiocManager")' -e 'BiocManager::install("DNAcopy")'
