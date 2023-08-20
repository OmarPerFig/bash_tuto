#!/bin/bash 

i=0

while (( $i<10 ))
do 
	(( array1[$i]=$i+1 ))
	echo ${array1[$i]}
	(( i++ ))
done 
