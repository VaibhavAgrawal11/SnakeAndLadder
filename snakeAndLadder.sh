#!/bin/bash -x
printf "Counting the die rolled and postion reached \n"
#VARIABLES
numberOfPlayers=2
position=0
position2=0
dieCount=0
dieCount2=0
NOPLAY=0
LADDER=1
SNAKE=2
declare -A diePosition

function playGame()
{
	position=$1
	rollTheDie=$((RANDOM%6+1))
	dieCount=$((dieCount+1))
	optionCheck=$((RANDOM%3))
	#CHECK OPTIONS NOPLAY/LADDER/SNAKE
	case $optionCheck in
		$NOPLAY)
		position=$position
		;;
		$LADDER)
		if(( $((position+rollTheDie))>100))	#EXACT WIN CONDITION
		then
			position=$position
		else
			position=$((position+rollTheDie))
		fi
		;;
		$SNAKE)
		if(($position>$rollTheDie))	#EXACT RESTART AND SNAKE CONDITION
		then
			position=$((position-rollTheDie))
		else
			position=0
		fi
   	;;
	esac
	diePosition[$dieCount]="$position"
	echo $position
}

#PLAY TILL 100
while(($position<100 && $position2<100))
do
	position="$(playGame $position)"
	dieCount=$((dieCount+1))
	printf "Player1 $dieCount : Position $position\n"
	
	position2="$(playGame $position2)"
   dieCount2=$((dieCount2+1))
   printf "Player2 $dieCount2 : Position $position\n"

done
if((position==100))
then
	printf "Congratulations!! Player1 Won!!\nPlayer1 roll the die for $dieCount times\n"
else
	printf "Congratulations!! Player2 Won!!\nPlayer2 roll the die for $dieCount2 times\n"
fi
