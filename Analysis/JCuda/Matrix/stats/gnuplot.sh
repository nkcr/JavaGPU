#! /bin/bash
set terminal png
set output "plot.png"
set title "GPMatrix - time over matrix size"
set xlabel "Matrix size"
set ylabel "Time [s]"

set label "2.53 GHz Intel Core 2 Duo - double precision" at screen 0.5,0.5 center

set samples 100000

plot [0:3000] [0:500] 0.00000003*(x-400)**3, 'GPMatrix-0-3000-100.csv' with lines
