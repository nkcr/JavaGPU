#! /bin/bash
set terminal png
set output "speedup_aparapi_matrix.png"
set title "GPMatrix - speedup with aparapi"
set xlabel "Matrix size"
set ylabel "speedup"

set label "Intel(R) Xeon(R) CPU E5-2609 v2 @ 2.50GHz - versus" at screen 0.5,0.5 center
set label "Nvidia Tesla C2075 - double precision" at screen 0.5,0.4 center

set samples 100000

plot 'speedup_aparapi_matrix_100-3000-100.csv' with lines
