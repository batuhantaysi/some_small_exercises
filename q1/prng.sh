#!/bin/bash

#Help output
help_func(){
	echo ""
	echo "Usage: -l param -u param"
	echo "-l : lower bound"
	echo "-u : upper bound"
	echo "Bounds are optional, script is going to generate values between 1 and 10 as default"
	echo "If a bound value is given as a parameter, the other bound must be given too."
	exit 1
}

#Get lower and upper bound parameters
while getopts ":l:u:" opt
do
	case "$opt" in
		l ) lowerBound="$OPTARG" ;;
		u ) upperBound="$OPTARG" ;;
		? ) help_func ;;
	esac
done

#If no parameter is given, set boundaries as 1 and 10
if [ -z "$lowerBound" ] && [ -z "$upperBound" ]
then
	lowerBound=$((1))
	upperBound=$((10))
#If only one parameter is given
elif [ -z "$lowerBound" -a -n "$upperBound" ] || [ -z "$upperBound" -a -n "$lowerBound" ]
then
	echo "Both bound values must be given, if a bound is needed"
	help_func
#If lower bound is negative or less than upper bound
elif [ $lowerBound -ge $upperBound ] || [ $lowerBound -le -1 ] 
then
	echo "Check your boundaries!"
	help_func
fi

#array for all values, going to be checked for each value if it's already appeared
for i in $(seq $lowerBound $upperBound)
do
	check_arr[$i]=false
done

#variable for last calculated value
new_var=0

#counter for while loop
counter=$((1))

total_num=$(($upperBound - $lowerBound + 1 ))

while [ $counter -le $total_num ] 
do
	#$RANDOM is a built-in variable in Bash that generates a random integer value
	new_var=$(($RANDOM % $total_num + $lowerBound))
	
	#checking if the value appeared
	if [ ${check_arr[$new_var]} = false ]
	then
		#set the value as appeared
		check_arr[$new_var]=true
		echo $(($new_var))
		
		counter=$(($counter+1))
	fi
done	 
