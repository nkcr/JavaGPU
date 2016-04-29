#! /bin/bash
set terminal pdfcairo
set output "time_aparapi_leven-5x.pdf"
set title "GPLevenshtein - time comparison with aparapi and vanilla"
set xlabel "String size"
set ylabel "Time [s]"

set label "Intel(R) Xeon(R) CPU E5-2609 v2 @ 2.50GHz - versus" at screen 0.5,0.5 center
set label "Nvidia Tesla C2075 - double precision" at screen 0.5,0.4 center

plot '../Analysis/Aparapi/Levenshtein/stats/10k-50k-100k-200k-300k-400k-500k-x5.csv' with lines lt 7,\
     '../Vanilla/Levenshtein/stats/10k-50k-100k-200k-300k-400k-500k.csv' with lines lt 1
