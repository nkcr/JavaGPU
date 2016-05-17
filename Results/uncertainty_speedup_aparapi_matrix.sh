#! /bin/bash
set terminal pdfcairo
set output "uncertainty_speedup_aparapi_matrix.pdf"
set title "Uncertainty of the speedup"
set xlabel "Vanilla time [s]"
set ylabel "GPU time [s]"

set xrange [0:180]
set yrange [0:40]
set isosample 100,100
set view 0,0
set cont base
set cntrparam levels incre 0,1,20
unset surface
set view map

splot (x+y+1)/y**2+y
