#! /bin/bash
set terminal pdfcairo
set output "plot5x.pdf"
set title "GPMatrix - time over matrix size"
set xlabel "Matrix size"
set ylabel "Avg. Time [s] on 5 executions"

set label "Nvidia Tesla C2075" at screen 0.5,0.5 center

plot 'GPMatrix-100-3000-100-x5.csv' with lines lt 4
