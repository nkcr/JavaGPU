#! /bin/bash

for (( i=0; i<=3000; i+=100 ))
do
  echo -n "$i, "
  java -classpath ../ GPMatrix $i
done
