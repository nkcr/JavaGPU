#! /bin/bash

for (( i=100; i<=3000; i+=100 ))
do
  echo -n "$i, "
  i1=`java -classpath ../ GPMatrix $i`
  i2=`java -classpath ../ GPMatrix $i`
  i3=`java -classpath ../ GPMatrix $i`
  i4=`java -classpath ../ GPMatrix $i`
  i5=`java -classpath ../ GPMatrix $i`
  echo $(( ($i1+$i2+$i3+$i4+$i5)/5 ))
done
