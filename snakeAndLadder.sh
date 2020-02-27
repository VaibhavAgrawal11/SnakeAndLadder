#!/bin/bash -x
printf "Counting the die rolled and postion reached \n"
#VARIABLES
numberOfPlayers=1
position=0
dieCount=0

declare -A diePosition
#PLAY TILL 100
while(($position<100))
do
	rollTheDie=$((RANDOM%6+1))
	dieCount=$((dieCount+1))
	optionCheck=$((RANDOM%3))
	#CHECK OPTIONS NOPLAY/LADDER/SNAKE
	case $optionCheck in
		0)
		printf "No play\n"
		position=$position
		;;
		1)
		printf "Yeahh Ladder!!\n"
		if(( $((position+rollTheDie))>100))	#EXACT WIN CONDITION
		then
			position=$position
		else
			position=$((position+rollTheDie))
		fi
		;;
		2)
		printf "Opps snake..\n"
		if(($position>$rollTheDie))	#EXACT RESTART AND SNAKE CONDITION
		then
			position=$((position-rollTheDie))
		else
			position=0
		fi
   	;;
	esac
	diePosition[$dieCount]="$position"
	printf "Die count $dieCount : Position $position\n"
done
printf "Congratulations!! You Won!!\nYou roll the die for $dieCount times\n"
