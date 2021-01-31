#!/bin/bash
#This script is used for operating the logic of the Crossword game.
#hp=100
#timer=90
red=$(tput setaf 1)
yellow=$(tput setaf 3)
blue_bg=$(tput setab 4)
default=$(tput sgr0)

indicate() 
{
clear
if (($SECONDS>=60))
then
	((mins=$SECONDS/60))
	((timer=timer-mins))
	((SECONDS=SECONDS%60))
fi

if ((timer==0))
then
	echo "Times out! You did not finished the game."	
	sleep 5
	exit 100
fi
tput cup 0 80 ; echo "HP:$hp Time:$timer mins"

}

indicate_temp() 
{
if (($SECONDS>=60))
then
	((mins=$SECONDS/60))
	((timer=timer-mins))
	((SECONDS=SECONDS%60))
fi

if ((timer==0))
then
	echo "Times out! You did not finished the game."	
	sleep 5
	exit 100
fi
tput cup 0 80 ; echo "HP:$hp Time:$timer mins"

}

indicate
until [[ "$choice" = "Yes" ]] 
do
	indicate
	echo $yellow ; figlet "Clynthia's"; echo $default 
	echo $yellow ; figlet "Crossword Puzzle" ; echo $default
	echo "This is Clynthia's continuation game."
	echo "${yellow}Instructions: You must fill all the boxes across and down to win the game and absorb Clynthia's power."
	echo "Kindly type the number followed by A/D, a space, then the answer to complete it."
	echo "$For example:1A unixuser, 2D Linux" ; echo $default
	echo "Entering a wrong word would result to a decrease in score by 2."
	echo "Ready? Yes or No"
	read choice
done
clear
#indicate
flag_1=0
flag_2=0
flag_3=0
flag_4=0
flag_5=0
flag_6=0
flag_7=0
flag_8=0

puzzle()
{
indicate_temp
tput cup 29 0 ; echo -n "Please enter input: "
read input
puzzle_ans=$(echo $input | cut -f2 -d " " | tr [a-z] [A-Z])
pattern_ans=$(echo $input | cut -f1 -d " ")

case "$input" in
	[12457]D" "*)
		if [[ "$pattern_ans" == "1D" ]] && [[ "$puzzle_ans" = "TYPE" ]]
		then
			ctr=1
			for (( i=0; i<${#puzzle_ans}; i++ ))
			do
			tput cup $ctr 14 ; echo "${puzzle_ans:$i:1}"
			((ctr++))
			done
			flag_1=1
			tput cup 30 0 ; echo -n "Correct! Clynthia takes 1 damage."
		elif [[ "$pattern_ans" == "2D" ]] && [[ $puzzle_ans = "BOURNE" ]]
		then
			ctr=4
			for (( i=0; i<${#puzzle_ans}; i++ ))
			do
			tput cup $ctr 6 ; echo "${puzzle_ans:$i:1}"
			((ctr++))
			done
			flag_2=1
			tput cup 30 0 ; echo -n "Correct! Clynthia takes 1 damage"
		elif [[ "$pattern_ans" == "4D" ]] && [[ $puzzle_ans = "PIPELINING" ]]
		then
			ctr=4
			for (( i=0; i<${#puzzle_ans}; i++ ))
			do
			tput cup $ctr 16 ; echo "${puzzle_ans:$i:1}"
			((ctr++))
			done
			flag_3=1
			tput cup 30 0 ; echo -n "Correct! Clynthia takes 1 damage"
		elif [[ "$pattern_ans" == "5D" ]] && [[ $puzzle_ans = "PATH" ]]
		then
			ctr=6
			for (( i=0; i<${#puzzle_ans}; i++ ))
			do
			tput cup $ctr 10 ; echo "${puzzle_ans:$i:1}"
			((ctr++))
			done
			flag_4=1
			tput cup 30 0 ; echo -n "Correct! Clynthia takes 1 damage"
		elif [[ "$pattern_ans" == "7D" ]] && [[ $puzzle_ans = "HISTORY" ]]
		then
			ctr=7
			for (( i=0; i<${#puzzle_ans}; i++ ))
			do
			tput cup $ctr 24 ; echo "${puzzle_ans:$i:1}"
			((ctr++))
			done
			flag_5=1
			tput cup 30 0 ; echo -n "Correct! Clynthia takes 1 damage"
		else
			tput cup 30 0 ; echo -n "Wrong answer. Clynthia has damaged you by 2 hp."
			((hp=$hp-2))
			
		fi
		;;
		
	[368]A" "*)
		if [[ "$pattern_ans" == "3A" ]] && [[ "$puzzle_ans" = "GREP" ]]
		then
			ctr=10
			for (( i=0; i<${#puzzle_ans}; i++ ))
			do
			tput cup 4 $ctr ; echo "${puzzle_ans:$i:1}"
			((ctr=$ctr+2))
			done
			flag_6=1
			tput cup 30 0 ; echo -n "Correct! Clynthia takes 1 damage"
		elif [[ "$pattern_ans" == "6A" ]] && [[ "$puzzle_ans" = "VARIABLES" ]]
		then
			ctr=2
			for (( i=0; i<${#puzzle_ans}; i++ ))
			do
			tput cup 7 $ctr ; echo "${puzzle_ans:$i:1}"
			((ctr=$ctr+2))
			done
			flag_7=1
			tput cup 30 0 ; echo -n "Correct! Clynthia takes 1 damage"
		elif [[ "$pattern_ans" == "8A" ]] && [[ "$puzzle_ans" = "SEMICOLON" ]]
		then
			ctr=10
			for (( i=0; i<${#puzzle_ans}; i++ ))
			do
			tput cup 11 $ctr ; echo "${puzzle_ans:$i:1}"
			((ctr=$ctr+2))
			done
			flag_8=1
			tput cup 30 0 ; echo -n "Correct! Clynthia takes 1 damage"
		else
			tput cup 30 0; echo -n "Wrong answer, Clynthia has damaged you by 2 HP."
			((hp=$hp-2))
		fi
		;;

	*) 
		tput cup 30 0 ; echo -n "Error in syntax or pattern is non-existent. Clynthia has damaged you by 2 hp"
		((hp=$hp-2))
		;;
 
esac
sleep 3
tput cup 28 0 ; tput ed
}

cat crossword_pattern.txt
echo $yellow ; grep -v "#" crossword_answers.txt ; echo $default
sleep 1
until (($flag_1==1 && $flag_2==1 && $flag_3==1 && $flag_4==1 && $flag_5==1 &&$flag_6==1 && $flag_7==1 && $flag_8==1))
do
	if (($flag_1==1 && $flag_2==1 && $flag_3==1 && $flag_4==1 && $flag_5==1 && $flag_6==1 && $flag_7==1 && $flag_8==1))
	then
		break
	else
		puzzle
	fi
done

indicate
echo "With your wits, you defeated Clynthia and finished the game!"
echo $yellow ; echo "You know acquired the dark ability of intelligence" ; set $default 
export hp timer SECONDS

until [[ "$sure" = "Yes" ]]
do 
	echo "For an instance, you have a sudden explosion in knowledge."
	echo "Who is the father of Linux"
	read special_answer
	echo "Are you sure? Yes or No."
	read sure
done

if [[ "$special_answer" = "Linus Torvalds" ]]
then
	echo "Correct, you recover 20 bonus health for that."
	((hp=hp+20))
else
	echo "Incorrect!"
fi
echo $yellow ; figlet "LOADING"; echo $default 
sleep 5
./forest_hunt.sh

if (($?==100))
then
	exit 100
fi
