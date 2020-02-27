#!/bin/bash -x
printf "Added exact wining condition \n"
#VARIABLES
numberOfPlayers=1
position=0

#PLAY TILL 100
while(($position<100))
do
	rollTheDie=$((RANDOM%6+1))
	optionCheck=$((RANDOM%3))
	#CHECK OPTIONS NOPLAY/LADDER/SNAKE
	case $optionCheck in
		0)
		printf "No play\n"
		position=$position
		printf "$position"
		;;
		1)
		printf "Yeahh Ladder!!\n"
		if(( $((position+rollTheDie))>100))	#EXACT WIN CONDITION
		then
			position=$position
			printf "$position"
		else
			position=$((position+rollTheDie))
         printf "$position"
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
		printf "$position"
   	;;
	esac
done
