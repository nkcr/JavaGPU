#! /bin/bash
set terminal pdfcairo
set output "plot.pdf"
set title "GPLevenshtein - time over strings size"
set xlabel "Strings size"
set ylabel "Time [s]"

set label "Intel(R) Xeon(R) CPU E5-2609 v2 @ 2.50GHz" at screen 0.5,0.5 center

plot '10k-50k-100k-200k-300k-400k-500k.csv' with lines
