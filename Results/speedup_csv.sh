#! /bin/bash

# Usage : <vanilla.csv> <gpu.csv>

IFS=','
paste -d',' $1 $2 | while read f1 f2 f3 f4; do
  if [ $f4 -ne 0 ]; then
    speedup=`bc -l <<< "$f2/$f4"`
  else
    speedup=0
  fi
  echo "$f1 $speedup"
done
