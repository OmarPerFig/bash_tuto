#!/bin/bash

if [ $1 -gt 100 ] # Expects an input from command line
then 
	echo -e "That's a big number bro!\nYou win the current dir:"
	pwd
else 
 echo "My number is bigger, try again."
fi

echo 

HORAYFECHA=$(date)
echo "Today it is: $HORAYFECHA" 

echo 

if (( 01 == 1 ))
then 
	echo OK
else 
	echo NO
fi
