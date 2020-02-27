#!/bin/bash -x
printf "Roll the die to generate 1 to 6 \n"
#VARIABLES
numberOfPlayers=1
position=0
rollTheDie=$((RANDOM%6+1))
