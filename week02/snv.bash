#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

python3 -B snv.py /BiO/Teach/BME42401/Data/12N_R1.fastq.gz /BiO/Teach/BME42401/Data/12N_R2.fastq.gz $(realpath .)
python3 -B snv.py /BiO/Teach/BME42401/Data/12T_R1.fastq.gz /BiO/Teach/BME42401/Data/12T_R2.fastq.gz $(realpath .)