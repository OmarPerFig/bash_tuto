#!/bin/bash 

# Read input variables from a file 
k=0
while read linea	# Each line in the file  
do
	for cadena in $linea # Each string separated by space or tab
	do
		if [[ "$cadena" == "#"* ]] # Comments with "#"
		then
			continue 2 # Escape to next line
		else 
			datarray[$k]=$cadena
			(( k++ )) 
			
		fi
	done
done < $1	# Read the input file in variable $1



# Paramenter space variables
#Kmin=$( echo "9*10^(-5)" | bc -l ) # Note that bash does not deal with floating point operations 
Kmin=8.5
MYmin=550
Mchimin=750
# This defines the format of the input file 
Kmax=${datarray[1]}	# Kappa max value
MYmax=${datarray[3]}	# Masses max value
Mchimax=${datarray[5]}
NK=${datarray[7]}		# Number of Kappa values to explore
NMY=${datarray[9]}		# Number of mass values to explore
NMchi=${datarray[11]}

rm omegas.dat

echo "Kappa	MY	Mchi	Omegah^2" > T0.002.dat # Output file 

for (( l=0 ; l < $NK ; l++ ))
do 
	Kappa=$( echo "$Kmin + ($l/$NK)*($Kmax-$Kmin)" | bc -l ) # bc to do floating point operations
	
	for (( m=0 ; m < $NMY ; m++ ))
	do 
		MY=$( echo "$MYmin + ($m/$NMY)*($MYmax-$MYmin)" | bc -l )
	
		for (( n=0 ; n < $NMchi ; n++ ))
		do 
			Mchi=$( echo "$Mchimin + ($n/$NMchi)*($Mchimax-$Mchimin)" | bc -l ) # -l option loads standard math library
			
			echo "Kappa	$Kappa" > data.par # Rewrites the file data.par as the input for micromegas
			echo "MY	$MY" >> data.par # Append the rest 
			echo "Mchi	$Mchi" >> data.par
			printf "Lambda	10000 \nST	0.00199	# T=0.002\n" >> data.par
			
			./main data.par # Run micromegas with the file data.par as input
			
			omegah2=$(cat omega.dat) # Read the result 
			# [arXiv:1807.06209]
			if (( $(echo "$omegah2 >= 0.119" | bc -l) )) && (( $(echo "$omegah2 <= 0.121" | bc -l) ))
			then 
				printf "%.3f\t%.2f\t%.2f\t%.4f\n" $Kappa $MY $Mchi $omegah2 >> T0.002.dat # Save to file 
			fi
			
			printf "%.3f\t%.2f\t%.2f\t%.4f\n" $Kappa $MY $Mchi $omegah2 >> omegas.dat
			
		done
	
	done

done

rm omega.dat # Erase micromegas output file

rm data.par # Delete input file for micromegas



