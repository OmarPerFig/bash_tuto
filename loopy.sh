#!/bin/bash

contador=0 # For the 'while' line

while [ $contador -le 9 ] # Alternatively: until [$contador -gt 10]
do 
	echo "$(($contador + 1)) elefantes"
	(( contador++ )) # Not needed in 'for'
done 


for valor in {1..10..2} # 1 to 10 in steps of 2 
do 
	echo $valor
done 

echo Ya estufas. 
