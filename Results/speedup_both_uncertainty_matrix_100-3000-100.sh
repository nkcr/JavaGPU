#! /bin/bash
set terminal pdfcairo
set output "speedup_both_uncertainty_matrix-5x.pdf"
set title "GPMatrix - speedup with both - with uncertainty"
set xlabel "Matrix size"
set ylabel "speedup"

set samples 100000

plot 'speedup_aparapi_uncertainty_matrix_100-3000-100.csv' with lines lt 4,\
     'speedup_aparapi_uncertainty_matrix_100-3000-100.csv' with errorbars,\
     'speedup_jcuda_uncertainty_matrix_100-3000-100.csv' with lines lt 7,\
     'speedup_jcuda_uncertainty_matrix_100-3000-100.csv' with errorbars
