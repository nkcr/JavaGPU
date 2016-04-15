#! /bin/bash

#for (( i=5000; i<=90000; i+=5000 ))
#do
#  STRINGA=`cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w $i | head -n 1`
#  STRINGB=`cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w $i | head -n 1`
#  echo -n "$i, "
#  java -cp ../:../aparapi.jar:. GPLevenshtein $STRINGA $STRINGB
#done

i=10000
j=10k.txt
echo -n "$i, "
java -cp ../:../aparapi.jar:. GPLevenshtein ../../../../Common/txt/$j ../../../../Common/txt/$j

i=50000
j=50k.txt
echo -n "$i, "
java -cp ../:../aparapi.jar:. GPLevenshtein ../../../../Common/txt/$j ../../../../Common/txt/$j

i=100000
j=100k.txt
echo -n "$i, "
java -cp ../:../aparapi.jar:. GPLevenshtein ../../../../Common/txt/$j ../../../../Common/txt/$j

i=200000
j=200k.txt
echo -n "$i, "
java -cp ../:../aparapi.jar:. GPLevenshtein ../../../../Common/txt/$j ../../../../Common/txt/$j

i=300000
j=300k.txt
echo -n "$i, "
java -cp ../:../aparapi.jar:. GPLevenshtein ../../../../Common/txt/$j ../../../../Common/txt/$j

i=400000
j=400k.txt
echo -n "$i, "
java -cp ../:../aparapi.jar:. GPLevenshtein ../../../../Common/txt/$j ../../../../Common/txt/$j

i=500000
j=500k.txt
echo -n "$i, "
java -cp ../:../aparapi.jar:. GPLevenshtein ../../../../Common/txt/$j ../../../../Common/txt/$j
