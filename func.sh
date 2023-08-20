#!/bin/bash 

imprime() {

	local var1='viejo' # Local variable that only the function sees. 

	echo Una función simple $var1. 
	echo Hola $1. 
}

imprime Omar # Pass an argument to the function. 
