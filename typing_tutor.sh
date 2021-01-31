#!/bin/bash
#This script is used to operate the logic of the Key-Word Game
#timer=100 #temp
#hp=100 #temp

red=$(tput setaf 1)
yellow=$(tput setaf 3)
blue_bg=$(tput setab 4)
default=$(tput sgr0)
indicate() 
{
sleep 1
clear
if (($SECONDS>=60))
then
	((mins=$SECONDS/60))
	((timer=timer-mins))
	((SECONDS=SECONDS%60))
fi

if ((timer==0))
then
	echo "You ran out of time! You did not finished the game."
	sleep 5	
	exit 100
fi
tput cup 0 80 ; echo "HP:$hp Time:$timer mins"

}

rm tutor1.txt 2> /dev/null; cp tutor1_copy.txt tutor1.txt 2> /dev/null
rm tutor2.txt 2> /dev/null; cp tutor2_copy.txt tutor2.txt 2> /dev/null
rm tutor3.txt 2> /dev/null; cp tutor3_copy.txt tutor3.txt 2> /dev/null

until [[ "$choice" = "Yes" ]]
do 
	indicate
	echo $yellow ; figlet "Ranaeril's";  
	figlet "Typing tutor" ;
	echo "Now, you face the last minion, Ranaeril. This one is fast, so try to keep up."	
	echo "Instructions: You must follow the instruction in order to finish the game."
	echo "              You must always save the application."
	echo "If you are finished with the game, just exit to check if you are complete." ; echo $default
	echo "Every unsuccessful attempt, Ranaeril will drain a life point."
	echo "Be careful in editing the document since even whitespaces can vary the results."
	echo "Ready? Yes or No"
	read choice
done

for ((ctr=1;ctr<4;ctr++))
do
winflag=0
tries=5
	until (($winflag==1||tries==0))
	do
		indicate
		echo "Get ready for round $ctr."
		temp_time=$SECONDS
		vi tutor$ctr.txt
		echo "Checking..."
		echo "Time elapsed: $(($temp_time/60)) minutes and $(($temp_time%60)) seconds"
		((minutes=temp_time/60))
		if ((1==$(cmp -s tutor${ctr}.txt tutor${ctr}ans.txt ; echo $?)))
		then
			echo "You still haven't finished this activity."
			((tries=tries-1))
			echo "You only have $tries tries left."
		elif ((0==$(cmp tutor${ctr}.txt tutor${ctr}ans.txt ; echo $?)))
		then
		 
			if [[ "$tutor${ctr}.txt" = "tutor2.txt" ]] && [[ "$minutes" -gt "3" ]]
			then
				echo "Too slow! Try again, but faster!"
			else
				echo "You finished this round!" 
				winflag=1
			fi
		else
			echo "Error"
		fi
		
		if ((tries==0))
		then
			echo "Oh no, you ran out of tries."
			echo "Your health will be deducted by 5"
			((hp=$hp-5))
		fi
		sleep 3
	done
done

echo "You've successfully beaten Ranaeril."
echo $yellow ; echo "You now have the dark ability of speed." ; echo $default
echo "Now, with all of these abilities, you can now face Ravnash, the Orc god."
echo "You decided to go to the castle wherein Ravnash resides in."
echo $yellow ; figlet "LOADING"; echo $default
export hp timer SECONDS
sleep 5
./waterfalls.sh

if (($?==100))
then
	exit 100
fi
