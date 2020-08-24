#!/bin/bash

head=0
tail=0

function coinflip()
{
	flip=$(( RANDOM%2 ))
	case $flip in
			0) (( head+=1 )) ;;
			1) (( tail+=1 )) ;;
	esac
}

function wins()
{
	if [[ $head -gt $tail ]]
	then
		echo "HEAD wins"
		echo "Total wins="$head
		echo "wins by="$(( $head-$tail ))
	else
		echo "TAIL wins"
		echo "Total wins="$tail
		echo "wins by="$(( $tail-$head ))
	fi
}

count=1
while [[ $count -gt 0 ]]
do
	coinflip
	if [[ $head -eq 21 || $tail -eq 21 ]]
	then
		wins
		break
	fi
	if [[ $head -eq 21 && $tail -eq 21 ]]
	then
		coinflip
		diff=0
		while [[ $diff -lt 2 ]]
		do
			if [[ $head -gt $tail ]]
			then
				diff=$(( $head-$tail ))
			else
				diff=$(( $tail-$head ))
			fi
		done
	fi
	(( count++ ))

done

