#!/bin/bash
[[ -e Plot ]] && rm -rf Plot
SigProfilerPlotting plotSBS --savefig_format pdf "$(realpath ./output/SBS/PS-826.SBS96.exome)" "$(realpath Plot)" 'PS-826' '96'
SigProfilerPlotting plotSBS --savefig_format pdf "$(realpath ./output/SBS/PS-826.SBS6.exome)" "$(realpath Plot)" 'PS-826' '6'
SigProfilerPlotting plotDBS --savefig_format pdf "$(realpath ./output/DBS/PS-826.DBS78.exome)" "$(realpath Plot)" 'PS-826' '78'
