#! /bin/bash
set terminal pdfcairo
set output "speedup_both_uncertainty_leven-5x.pdf"
set title "GPLevenshtein - speedup with both - with uncertainty"
set xlabel "String size"
set ylabel "speedup"

set samples 100000

plot 'speedup_aparapi_uncertainty_leven_10k-50k-100k-200k-300k-400k-500k-x5.csv' with lines lt 4,\
     'speedup_aparapi_uncertainty_leven_10k-50k-100k-200k-300k-400k-500k-x5.csv' with errorbars,\
     'speedup_jcuda_uncertainty_leven_10k-50k-100k-200k-300k-400k-500k-x5.csv' with lines lt 7,\
     'speedup_jcuda_uncertainty_leven_10k-50k-100k-200k-300k-400k-500k-x5.csv' with errorbars
