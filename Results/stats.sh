echo -n -e "Mean:\t\t"
echo $( cat $1 | awk -F' ' '{sum+=$2} END {print sum/NR}' )

echo -n -e "Median:\t\t"
echo $( sort -k2 -n $1 | awk ' { a[i++]=$2; } END { print a[int(i/2)]; }' )

echo -n -e "Std deviation:\t"
echo $( cat $1 | awk '{x+=$2;y+=$2^2}END{print sqrt(y/NR-(x/NR)^2)}')
