#! /bin/bash

for (( i=100; i<=3000; i+=100 ))
do
  echo -n "$i, "
  java -cp ../:../aparapi.jar:. GPMatrix $i
done
