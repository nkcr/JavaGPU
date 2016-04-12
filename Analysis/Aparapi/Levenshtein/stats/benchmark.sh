#! /bin/bash

for (( i=1; i<=30000; i+=100 ))
do
  STRINGA=`head -c $i /dev/random | base64`
  STRINGB=`head -c $i /dev/random | base64`
  echo -n "$i, "
  java -classpath ../ GPLevenshtein $STRINGA $STRINGB
done
