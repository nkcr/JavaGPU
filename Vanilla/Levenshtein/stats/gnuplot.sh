#! /bin/bash
set terminal pdfcairo
set output "plot.pdf"
set title "GPLevenshtein - time over strings size"
set xlabel "Strings size"
set ylabel "Time [s]"

set label "2.53 GHz Intel Core 2 Duo" at screen 0.5,0.5 center

set samples 100000

plot [0:90000] [0:63] 0.00000001*(x-10000)**2, 'GPLevenshtein-1-30000-100.csv' with lines
