#! /bin/bash

#for (( i=1; i<=30000; i+=100 ))
#do
#  STRINGA=`head -c $i /dev/random | base64`
#  STRINGB=`head -c $i /dev/random | base64`
#  echo -n "$i, "
#  java -classpath ../ GPLevenshtein $STRINGA $STRINGB
#done

i=10000
j=10k.txt
echo -n "$i, "
i1=`java -cp ../ GPLevenshtein ../../../Common/txt/$j ../../../Common/txt/$j`
i2=`java -cp ../ GPLevenshtein ../../../Common/txt/$j ../../../Common/txt/$j`
i3=`java -cp ../ GPLevenshtein ../../../Common/txt/$j ../../../Common/txt/$j`
i4=`java -cp ../ GPLevenshtein ../../../Common/txt/$j ../../../Common/txt/$j`
i5=`java -cp ../ GPLevenshtein ../../../Common/txt/$j ../../../Common/txt/$j`
echo $(( ($i1+$i2+$i3+$i4+$i5)/5 ))

i=50000
j=50k.txt
echo -n "$i, "
i1=`java -cp ../ GPLevenshtein ../../../Common/txt/$j ../../../Common/txt/$j`
i2=`java -cp ../ GPLevenshtein ../../../Common/txt/$j ../../../Common/txt/$j`
i3=`java -cp ../ GPLevenshtein ../../../Common/txt/$j ../../../Common/txt/$j`
i4=`java -cp ../ GPLevenshtein ../../../Common/txt/$j ../../../Common/txt/$j`
i5=`java -cp ../ GPLevenshtein ../../../Common/txt/$j ../../../Common/txt/$j`
echo $(( ($i1+$i2+$i3+$i4+$i5)/5 ))

i=100000
j=100k.txt
echo -n "$i, "
i1=`java -cp ../ GPLevenshtein ../../../Common/txt/$j ../../../Common/txt/$j`
i2=`java -cp ../ GPLevenshtein ../../../Common/txt/$j ../../../Common/txt/$j`
i3=`java -cp ../ GPLevenshtein ../../../Common/txt/$j ../../../Common/txt/$j`
i4=`java -cp ../ GPLevenshtein ../../../Common/txt/$j ../../../Common/txt/$j`
i5=`java -cp ../ GPLevenshtein ../../../Common/txt/$j ../../../Common/txt/$j`
echo $(( ($i1+$i2+$i3+$i4+$i5)/5 ))

i=200000
j=200k.txt
echo -n "$i, "
i1=`java -cp ../ GPLevenshtein ../../../Common/txt/$j ../../../Common/txt/$j`
i2=`java -cp ../ GPLevenshtein ../../../Common/txt/$j ../../../Common/txt/$j`
i3=`java -cp ../ GPLevenshtein ../../../Common/txt/$j ../../../Common/txt/$j`
i4=`java -cp ../ GPLevenshtein ../../../Common/txt/$j ../../../Common/txt/$j`
i5=`java -cp ../ GPLevenshtein ../../../Common/txt/$j ../../../Common/txt/$j`
echo $(( ($i1+$i2+$i3+$i4+$i5)/5 ))

i=300000
j=300k.txt
echo -n "$i, "
i1=`java -cp ../ GPLevenshtein ../../../Common/txt/$j ../../../Common/txt/$j`
i2=`java -cp ../ GPLevenshtein ../../../Common/txt/$j ../../../Common/txt/$j`
i3=`java -cp ../ GPLevenshtein ../../../Common/txt/$j ../../../Common/txt/$j`
i4=`java -cp ../ GPLevenshtein ../../../Common/txt/$j ../../../Common/txt/$j`
i5=`java -cp ../ GPLevenshtein ../../../Common/txt/$j ../../../Common/txt/$j`
echo $(( ($i1+$i2+$i3+$i4+$i5)/5 ))

i=400000
j=400k.txt
echo -n "$i, "
i1=`java -cp ../ GPLevenshtein ../../../Common/txt/$j ../../../Common/txt/$j`
i2=`java -cp ../ GPLevenshtein ../../../Common/txt/$j ../../../Common/txt/$j`
i3=`java -cp ../ GPLevenshtein ../../../Common/txt/$j ../../../Common/txt/$j`
i4=`java -cp ../ GPLevenshtein ../../../Common/txt/$j ../../../Common/txt/$j`
i5=`java -cp ../ GPLevenshtein ../../../Common/txt/$j ../../../Common/txt/$j`
echo $(( ($i1+$i2+$i3+$i4+$i5)/5 ))

i=500000
j=500k.txt
echo -n "$i, "
i1=`java -cp ../ GPLevenshtein ../../../Common/txt/$j ../../../Common/txt/$j`
i2=`java -cp ../ GPLevenshtein ../../../Common/txt/$j ../../../Common/txt/$j`
i3=`java -cp ../ GPLevenshtein ../../../Common/txt/$j ../../../Common/txt/$j`
i4=`java -cp ../ GPLevenshtein ../../../Common/txt/$j ../../../Common/txt/$j`
i5=`java -cp ../ GPLevenshtein ../../../Common/txt/$j ../../../Common/txt/$j`
echo $(( ($i1+$i2+$i3+$i4+$i5)/5 ))
