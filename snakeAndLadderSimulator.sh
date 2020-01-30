echo "WELCOME TO SNAKE AND LADDER SIMULATOR"
#constants
START_POSITION=0
#variable
playerOnePosition=$START_POSITION

function rollingDice () {
	numberOnDice=$(($((RANDOM%6))+1))
	echo "Number after rolling the dice : $numberOnDice"
}
rollingDice
