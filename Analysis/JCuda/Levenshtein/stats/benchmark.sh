#! /bin/bash

#for (( i=5000; i<=90000; i+=5000 ))
#do
#  STRINGA=`cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w $i | head -n 1`
#  STRINGB=`cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w $i | head -n 1`
#  echo -n "$i, "
#  java -cp ../:../jcuda-0.7.5.jar:. GPLevenshtein $STRINGA $STRINGB
#done

i=10000
j=10k.txt
echo -n "$i, "
i1=`java -cp ../:../jcuda-0.7.5.jar:. GPLevenshtein ../../../../Common/txt/$j ../../../../Common/txt/$j`
i2=`java -cp ../:../jcuda-0.7.5.jar:. GPLevenshtein ../../../../Common/txt/$j ../../../../Common/txt/$j`
i3=`java -cp ../:../jcuda-0.7.5.jar:. GPLevenshtein ../../../../Common/txt/$j ../../../../Common/txt/$j`
i4=`java -cp ../:../jcuda-0.7.5.jar:. GPLevenshtein ../../../../Common/txt/$j ../../../../Common/txt/$j`
i5=`java -cp ../:../jcuda-0.7.5.jar:. GPLevenshtein ../../../../Common/txt/$j ../../../../Common/txt/$j`
echo $(( ($i1+$i2+$i3+$i4+$i5)/5 ))

i=50000
j=50k.txt
echo -n "$i, "
i1=`java -cp ../:../jcuda-0.7.5.jar:. GPLevenshtein ../../../../Common/txt/$j ../../../../Common/txt/$j`
i2=`java -cp ../:../jcuda-0.7.5.jar:. GPLevenshtein ../../../../Common/txt/$j ../../../../Common/txt/$j`
i3=`java -cp ../:../jcuda-0.7.5.jar:. GPLevenshtein ../../../../Common/txt/$j ../../../../Common/txt/$j`
i4=`java -cp ../:../jcuda-0.7.5.jar:. GPLevenshtein ../../../../Common/txt/$j ../../../../Common/txt/$j`
i5=`java -cp ../:../jcuda-0.7.5.jar:. GPLevenshtein ../../../../Common/txt/$j ../../../../Common/txt/$j`
echo $(( ($i1+$i2+$i3+$i4+$i5)/5 ))

i=100000
j=100k.txt
echo -n "$i, "
i1=`java -cp ../:../jcuda-0.7.5.jar:. GPLevenshtein ../../../../Common/txt/$j ../../../../Common/txt/$j`
i2=`java -cp ../:../jcuda-0.7.5.jar:. GPLevenshtein ../../../../Common/txt/$j ../../../../Common/txt/$j`
i3=`java -cp ../:../jcuda-0.7.5.jar:. GPLevenshtein ../../../../Common/txt/$j ../../../../Common/txt/$j`
i4=`java -cp ../:../jcuda-0.7.5.jar:. GPLevenshtein ../../../../Common/txt/$j ../../../../Common/txt/$j`
i5=`java -cp ../:../jcuda-0.7.5.jar:. GPLevenshtein ../../../../Common/txt/$j ../../../../Common/txt/$j`
echo $(( ($i1+$i2+$i3+$i4+$i5)/5 ))

i=200000
j=200k.txt
echo -n "$i, "
i1=`java -cp ../:../jcuda-0.7.5.jar:. GPLevenshtein ../../../../Common/txt/$j ../../../../Common/txt/$j`
i2=`java -cp ../:../jcuda-0.7.5.jar:. GPLevenshtein ../../../../Common/txt/$j ../../../../Common/txt/$j`
i3=`java -cp ../:../jcuda-0.7.5.jar:. GPLevenshtein ../../../../Common/txt/$j ../../../../Common/txt/$j`
i4=`java -cp ../:../jcuda-0.7.5.jar:. GPLevenshtein ../../../../Common/txt/$j ../../../../Common/txt/$j`
i5=`java -cp ../:../jcuda-0.7.5.jar:. GPLevenshtein ../../../../Common/txt/$j ../../../../Common/txt/$j`
echo $(( ($i1+$i2+$i3+$i4+$i5)/5 ))

i=300000
j=300k.txt
echo -n "$i, "
i1=`java -cp ../:../jcuda-0.7.5.jar:. GPLevenshtein ../../../../Common/txt/$j ../../../../Common/txt/$j`
i2=`java -cp ../:../jcuda-0.7.5.jar:. GPLevenshtein ../../../../Common/txt/$j ../../../../Common/txt/$j`
i3=`java -cp ../:../jcuda-0.7.5.jar:. GPLevenshtein ../../../../Common/txt/$j ../../../../Common/txt/$j`
i4=`java -cp ../:../jcuda-0.7.5.jar:. GPLevenshtein ../../../../Common/txt/$j ../../../../Common/txt/$j`
i5=`java -cp ../:../jcuda-0.7.5.jar:. GPLevenshtein ../../../../Common/txt/$j ../../../../Common/txt/$j`
echo $(( ($i1+$i2+$i3+$i4+$i5)/5 ))

i=400000
j=400k.txt
echo -n "$i, "
i1=`java -cp ../:../jcuda-0.7.5.jar:. GPLevenshtein ../../../../Common/txt/$j ../../../../Common/txt/$j`
i2=`java -cp ../:../jcuda-0.7.5.jar:. GPLevenshtein ../../../../Common/txt/$j ../../../../Common/txt/$j`
i3=`java -cp ../:../jcuda-0.7.5.jar:. GPLevenshtein ../../../../Common/txt/$j ../../../../Common/txt/$j`
i4=`java -cp ../:../jcuda-0.7.5.jar:. GPLevenshtein ../../../../Common/txt/$j ../../../../Common/txt/$j`
i5=`java -cp ../:../jcuda-0.7.5.jar:. GPLevenshtein ../../../../Common/txt/$j ../../../../Common/txt/$j`
echo $(( ($i1+$i2+$i3+$i4+$i5)/5 ))

i=500000
j=500k.txt
echo -n "$i, "
i1=`java -cp ../:../jcuda-0.7.5.jar:. GPLevenshtein ../../../../Common/txt/$j ../../../../Common/txt/$j`
i2=`java -cp ../:../jcuda-0.7.5.jar:. GPLevenshtein ../../../../Common/txt/$j ../../../../Common/txt/$j`
i3=`java -cp ../:../jcuda-0.7.5.jar:. GPLevenshtein ../../../../Common/txt/$j ../../../../Common/txt/$j`
i4=`java -cp ../:../jcuda-0.7.5.jar:. GPLevenshtein ../../../../Common/txt/$j ../../../../Common/txt/$j`
i5=`java -cp ../:../jcuda-0.7.5.jar:. GPLevenshtein ../../../../Common/txt/$j ../../../../Common/txt/$j`
echo $(( ($i1+$i2+$i3+$i4+$i5)/5 ))
