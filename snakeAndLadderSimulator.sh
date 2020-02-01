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
playerTwoPosition=$START_POSITION
currentPlayerPosition=$START_POSITION
diceCountOfPlayerOne=0
diceCountOfPlayerTwo=0
flag=0
function rollingDice () {
	numberOnDice=$(($((RANDOM%6))+1))
	checkForOptionsNoplayLadderOrSnake
}
function checkForOptionsNoplayLadderOrSnake () {
	option=$((RANDOM%3))
	if [ $option -eq $NO_PLAY ]
	then
		currentPlayerPosition=$currentPlayerPosition
	elif [ $option -eq $LADDER ]
	then
		currentPlayerPosition=$(($currentPlayerPosition + $numberOnDice))
		if [ $currentPlayerPosition -gt $WINNING_POSITION ]
		then
			currentPlayerPosition=$(($currentPlayerPosition - $numberOnDice))
		fi
	elif [ $option -eq $SNAKE ]
	then
		currentPlayerPosition=$(($currentPlayerPosition - $numberOnDice))
		if [ $currentPlayerPosition -lt $START_POSITION ]
		then
			currentPlayerPosition=$START_POSITION
		fi
	fi
}
function switchTurnsOfPlayers () {
	if [[ flag -eq 0 ]]
	then
		currentPlayerPosition=$playerOnePosition
		rollingDice
		playerOnePosition=$currentPlayerPosition
		((diceCountOfPlayerOne++))
		flag=1
	else
		currentPlayerPosition=$playerTwoPosition
		rollingDice
		playerTwoPosition=$currentPlayerPosition
		((diceCountOfPlayerTwo++))
		flag=0
	fi
}
function repeatingTillWinningPosition () {
	while [[ $currentPlayerPosition -lt $WINNING_POSITION ]]
	do
		switchTurnsOfPlayers
	done
}
function checkWinner () {
	if [ $playerOnePosition -eq $WINNING_POSITION ]
	then
		echo "Player one won"
	else
		echo "Player two won"
	fi
}
repeatingTillWinningPosition
checkWinner
echo "Number of times dice tossed by player one: $diceCountOfPlayerOne"
echo "Number of times dice tossed by player two: $diceCountOfPlayerTwo"
