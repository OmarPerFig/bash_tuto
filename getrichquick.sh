#!/bin/bash 

# Create variables: name and age from user input 
# echo it back like this: "Hello $name, you are $age years old. 

echo "¿Con quién tengo el gusto?"
read name

echo "¿Qué edad tienes?"
read age 

echo "Hello $name, you are $age years old."
sleep 1

echo "Calculating..."
echo ".............."
sleep 2
echo "***..........."
sleep 1
echo "*****........."
sleep 2
echo "*********....."
sleep 1
echo "***********..."
sleep 1
echo "*************."
sleep 2
echo "**************"
# Spaces are important for bash variable definition: getrich = $somevar won't work 
getrich=$(( $age + ($RANDOM % 15) )) 

echo "Congratulations $name! You will become rich when you turn $getrich years old."



