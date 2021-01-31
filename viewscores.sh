#~/bin/bash
#This script lets the user view the score board of the game.

clear
figlet "Score board"
echo "         Name HP Time Left"

grep -v "#" scoreboard.txt | tail -n 10 | tac | nl | tr ":" " "

sleep 10
#echo "What do you want to do next?"

exit
