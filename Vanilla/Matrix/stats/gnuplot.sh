#! /bin/bash
set terminal pdfcairo
set output "plot.pdf"
set title "GPMatrix - time over matrix size"
set xlabel "Matrix size"
set ylabel "Time [s]"

set label "Intel(R) Xeon(R) CPU E5-2609 v2 @ 2.50GHz - double precision" at screen 0.5,0.5 center

plot 'GPMatrix-100-3000-100.csv' with lines

# set samples 100000
# plot [100:3000] [0:200] 0.00000001*(x-400)**3, 'GPMatrix-100-3000-100.csv' with lines
