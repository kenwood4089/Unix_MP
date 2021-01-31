#!/bin/bash
#This script is the main page page of the game.
clear
red=$(tput setaf 1)
yellow=$(tput setaf 3)
blue_bg=$(tput setab 4)
default=$(tput sgr0)

echo $yellow ; figlet "A Warrior's Heart"; echo $default 

figlet "S - Start Game"
figlet "V - View Scores"
figlet "E - Exit Game"

read input
while [[ "$input" != "S" ]] && [[ "$input" != "V" ]] && [[ "$input" != "E" ]]
do
	echo "Wrong input, please try again."
	read input
	clear
	echo $yellow ; figlet "A Warrior's Heart"; echo $default 
	figlet "S - Start Game"
	figlet "V - View Scores"
	figlet "E - Exit Game"
done

if [[ "$input" = "S" ]]
then
	echo "Start Game"
	export hp timer SECONDS
	export lastname firstname middle_initial studentnum contactnum emailadd
	./epilogue.sh
elif [[ "$input" = "V" ]]
then
	echo "View Scores"
	./viewscores.sh
elif [[ "$input" = "E" ]]
then 
	echo "Exiting"
	echo "Good bye for now, have a nice day!"
	sleep 3
	exit 
	#100 as a return value
fi

./mainpage.sh
if (($?==100))
then
	echo "You ran out of time..."
	echo "Better luck next time!"
	exit
fi

