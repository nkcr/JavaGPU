#! /bin/bash
set terminal pdfcairo
set output "speedup_jcuda_leven-5x.pdf"
set title "GPLevenshtein - speedup with jcuda"
set xlabel "String size"
set xtics rotate by 45 offset -0.8,-1.8

set ylabel "speedup"

set label "Intel(R) Xeon(R) CPU E5-2609 v2 @ 2.50GHz - versus" at screen 0.5,0.5 center
set label "Nvidia Tesla C2075" at screen 0.5,0.4 center

plot 'speedup_jcuda_leven_10k-50k-100k-200k-300k-400k-500k-x5.csv' with lines lt 7
