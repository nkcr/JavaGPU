## Workflow

### 1 Compute speedup

```
./speedup_matrix.sh ../Vanilla/Levenshtein/stats/10k-50k-100k-200k-300k-400k-500k.csv ../Analysis/Aparapi/Levenshtein/stats/10k-50k-100k-200k-300k-400k-500k.csv > speedup_aparapi_leven-10k-50k-100k-200k-300k-400k-500k.csv
```

### 2 Create gnuplot script

Edit title, label and data source :

```
#! /bin/bash
set terminal png
set output "speedup_aparapi_leven.png"
set title "GPLevenshtein - speedup with aparapi"
set xlabel "String size"
set xtics rotate by 45 offset -0.8,-1.8

set ylabel "speedup"

set label "Intel(R) Xeon(R) CPU E5-2609 v2 @ 2.50GHz - versus" at screen 0.5,0.5 center
set label "Nvidia Tesla C2075" at screen 0.5,0.4 center

plot 'speedup_aparapi_leven-10k-50k-100k-200k-300k-400k-500k.csv' with lines
```

### 3 Plot the results

```
gnuplot> load 'speedup_aparapi_leven_gnuplot.sh'
```