#!/bin/bash

# Hello world! with variables and asks your name 

mensaje="¡Hola hdtspm!" 
echo $mensaje # This is a comment
echo ¿Con quién tengo el gusto?
read -p 'Nombre: ' varname # Specify a prompt 
read -sp 'Contraseña: ' varcontra # -s makes the input silent 
echo 
echo Saludos $varname, tus datos han sido guardados.  

# Script that copies and presents info. 
#cp $1 $2 # First and second inputs when runnig script
#echo Detalles de $2
#ls -lh $2 

# How many entries in /etc?
#numero=$( ls /etc | wc -l )
#echo Hay $numero entradas en el directorio /etc

#export variable # Makes variable available for other scripts within
