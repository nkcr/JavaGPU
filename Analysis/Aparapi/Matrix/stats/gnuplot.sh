#! /bin/bash
set terminal pdfcairo
set output "plot.pdf"
set title "GPMatrix - time over matrix size"
set xlabel "Matrix size"
set ylabel "Time [s]"

set label "Nvidia Tesla C2075" at screen 0.5,0.5 center

plot 'GPMatrix-100-3000-100.csv' with lines
