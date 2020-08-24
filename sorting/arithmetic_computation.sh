#!/bin/bash 

#take 3 inputs
read -p "Enter 3 numbers" a b c

#do arithmetic computations
operation1=$(( $a+$b*$c ))
echo $operation1
operation2=$(( $a*$b+$c ))
echo $operation2
operation3=$(( $c+$a/$b ))
echo $operation3
operation4=$(( $a%$b+$c ))
echo $operation4

#declare dictionary
declare -A result
result[operation1]=$operation1
result[operation2]=$operation2
result[operation3]=$operation3
result[operation4]=$operation4

echo "Dictionary keys="${!result[@]}
echo "Dictionary values="${result[@]}

#transfer the values to array
for (( count=1;count<$((${#result[@]}+1));count++ ))
do
	echo ${result[operation$count]}
	array[$count]=${result[operation$count]}
done
echo "array=" ${array[@]}
echo "array leng="${#array[@]}

#sort array in descending order
for (( i=0;i<${#array[@]};i++ ))
do
	for (( j=i+1;j<${#array[@]};j++ ))
	do
		if [[ array[$i] -lt array[$j] ]]
		then
			value=${array[i]}
			array[$i]=${array[$j]}
			array[$j]=$value
		fi
	done
done
echo "array arranged in descending order="${array[@]}

#sort array in ascending order
for (( i=0;i<${#array[@]};i++ ))
do
        for (( j=i+1;j<${#array[@]};j++ ))
        do
                if [[ array[$i] -gt array[$j] ]]
                then
                        value=${array[i]}
                        array[$i]=${array[$j]}
                        array[$j]=$value
                fi
        done
done
echo "array arraged in ascending order="${array[@]}
