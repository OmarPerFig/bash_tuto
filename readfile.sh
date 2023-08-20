#!/bin/bash 


k=0
i=1
while read linea # Read line by line of file $1 
do 
	j=1
	for cadena in $linea # Read line as an array or list
	do
		if [[ "$cadena" == "#"* ]]
		then 
			continue 2 # If "#" is written escape to the next line
		else 
			#echo "Línea no. $i, entrada $j : $elemento"
			array1[$k]=$cadena
		       	(( k++ ))

			(( j++ ))
		fi
	done 
	(( i++ ))
done < $1


for elemento in ${array1[@]}
do
	echo "$elemento"
done

var1=${array1[0]}

echo "$var1"
