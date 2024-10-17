#!/bin/bash
sum=0
#for i in {1000..2000}; do
for i in {1000..2000}; do
    pattern="[01][01][01][01]" # match four (0 or 1)s (and maybe other stuff)
    if [[ $i =~ $pattern ]];then
	echo $i
        sum=$(($sum + $i))
    fi
done
echo $sum

#Another intertesting way to do this
#This idea is actually from Eva Song
sum2=0
for i in 1{0..1}{0..1}{0..1};do
    sum2=$(($sum2 + $i))
done
echo $sum2

