#!/bin/bash -x
printf "Check for the option to play next \n"
#VARIABLES
numberOfPlayers=1
position=0
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
	position=$((position+rollTheDie))
	printf "$position"
	;;
	2)
	printf "Opps snake..\n"
	if(($position>$rollTheDie)) 
	then
		position=$((position-rollTheDie))
	else
		position=$position
	fi
	printf "$position"
   ;;
esac
