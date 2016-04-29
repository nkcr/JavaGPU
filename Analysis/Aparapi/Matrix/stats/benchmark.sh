#! /bin/bash

for (( i=100; i<=3000; i+=100 ))
do
  echo -n "$i, "
  i1=`java -cp ../:../aparapi.jar:. GPMatrix $i`
  i2=`java -cp ../:../aparapi.jar:. GPMatrix $i`
  i3=`java -cp ../:../aparapi.jar:. GPMatrix $i`
  i4=`java -cp ../:../aparapi.jar:. GPMatrix $i`
  i5=`java -cp ../:../aparapi.jar:. GPMatrix $i`
  echo $(( ($i1+$i2+$i3+$i4+$i5)/5 ))
done
