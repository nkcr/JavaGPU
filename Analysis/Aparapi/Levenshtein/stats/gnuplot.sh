#! /bin/bash
set terminal pdfcairo
set output "plot.pdf"
set title "GPLevenshtein - time over string size"
set xlabel "String size"
set ylabel "Time [s]"

set label "Nvidia Tesla C2075" at screen 0.5,0.5 center

plot '10k-50k-100k-200k-300k-400k-500k.csv' with lines
