#!/bin/bash -x
echo "WELCOME TO SNAKE AND LADDER SIMULATOR"
#constants
START_POSITION=0
NO_PLAY=0
LADDER=1
SNAKE=2
WINNING_POSITION=100
#variable
playerOnePosition=$START_POSITION

function rollingDice () {
	numberOnDice=$(($((RANDOM%6))+1))
	echo "Number after rolling the dice : $numberOnDice"
	checkForOptionsNoplayLadderOrSnake
}
function checkForOptionsNoplayLadderOrSnake () {
	option=$((RANDOM%3))
	if [ $option -eq $NO_PLAY ]
	then
		playerOnePosition=$playerOnePosition
	elif [ $option -eq $LADDER ]
	then
		playerOnePosition=$(($playerOnePosition + $numberOnDice))
	elif [ $option -eq $SNAKE ]
	then
		playerOnePosition=$(($playerOnePosition - $numberOnDice))
		if [ $playerOnePosition -lt $START_POSITION ]
		then
			playerOnePosition=$START_POSITION
		fi
	fi
	echo "Player is at position : $playerOnePosition"
}
function repeatingTillWinningPosition () {
	while [[ $playerOnePosition -lt $WINNING_POSITION ]]
	do
		rollingDice
	done
}
repeatingTillWinningPosition
