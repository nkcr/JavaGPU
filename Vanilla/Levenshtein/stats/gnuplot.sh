#! /bin/bash
set terminal png
set output "plot.png"
set title "GPLevenshtein - time over strings size"
set xlabel "Strings size"
set ylabel "Time [s]"

set samples 100000

plot [0:90000] [0:63] 0.00000001*(x-10000)**2, 'GPLevenshtein-1-30000-100.csv' with lines
