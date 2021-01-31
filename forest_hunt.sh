#!/bin/bash
#This script is used to operate the logic of the Forest Hunt Game
#hp=100
#timer=90
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

until [[ "$choice" = "Yes" ]]
do
	indicate
	echo $yellow ; figlet "Grungledor's"; echo $default 
	echo $yellow ; figlet "Forest Hunt" ; echo $default
	echo "${yellow}Instructions:To defeat Grungledor you must unlock the final room."
	echo "Instructions: You must use change directory and list command to escape him." echo 
	echo "Type cd then the path name to traverse, then ls to list all paths."
	echo "For example: cd .. or cd right_hole or ls" ; echo $default
	echo "Puzzles will guide you throughout the maze, choose wisely!"
	echo "Picking a wrong path will result to a randomized consequence, which may be a decrease in HP which is caused by Grungledor's attacks, or decrease in time."
	echo "Ready? Yes or No"
	read choice
done 

current_direct=/
level=1
win_flag=0
got_key=0

getinput()
{

indicate
process_input
echo "Please enter input: "
echo -n "$current_direct "
read input
case "$input" in
	cd" "[A-Za-z]*)
			go_up
			sleep 1
			;;
	"cd ..")
			echo "You choose to go back."
			go_down;;
	"cd .")
			echo "Nothing happened."
			sleep 1
			;;
	"cd -")
			echo "You do not have the power to go back in time!"			
			;; 
	ls)		echo "Available paths:"
			list
						
			;;
	*) 
			echo "Wrong input."
			;;	
esac
}

list()
{
((next_level=$level+1))
grep ^$next_level forest_hunt.txt | grep $current_direct | cut -f $next_level -d/
sleep 5 
}

go_up()
{
((next_level=level+1))
if(($level==1))
then
	next_direct=$current_direct$(echo $input | cut -f2 -d" ")
else
	next_direct=$current_direct/$(echo $input | cut -f2 -d" ")
fi

echo $next_direct
if ((0==$(grep ^"$next_level" forest_hunt.txt | cut -f2 -d" " | grep -x $next_direct >> /dev/null 2> /dev/null ; echo $?))) 
then
	((level=$level+1))
	current_direct=$next_direct
else
	echo "Wrong input, the path does not exist."
fi
}

go_down()
{
if (($level<=1))
then
	echo "You cannot go back further!"
else
	if(($level==2))
	then
		current_direct=/
		level=1
	else
		((next_level=$level-1))
		echo $next_level
		current_direct=$(echo $current_direct | cut -f1-$next_level -d/)
		level=$next_level
		echo $current_direct
	fi
fi
}

process_input()
{
if [[ "$current_direct" = "/" ]]
then
	echo "${yellow}Which path do you want to go? To the right where nothing is left, or to the left where nothing is right."
	echo "${yellow}Or do you want to go to the middle path?" ; echo $default

elif [[ "$current_direct" = "/right_path"  ]]
then
	echo "${yellow}So you've chosen the path towards your right. As soon as the path ends, you see two doors."
	echo "You see a note written in the side of the cave: One of these doors will lead you outside the cave." ; echo $default

elif [[ "$current_direct" = "/left_path"  ]]
then
	echo "${yellow}So you've chosen the path towards your left. As soon as the path ends, you see two doors."
	echo "You see a note written in the side: One of these doors truly holds the treasure."
	echo "However, being too will greedy impact you negatively."; echo $default
	
elif [[ "$current_direct" = "/middle_path"  ]]
then
	echo "${yellow}So you've chosen the middle path. As soon as the path ends, you see a door."
	echo "Beware! Unknown instance lies ahead!" ; echo $default

elif [[ "$current_direct" = "/left_path/left_door" ]]
then
	echo "${yellow}As you enter the door, You see two rooms. Both are shining and shimmering."
	echo "You can go to one of these doors. Will you be consumed by your greed?" ; echo $default

elif [[ "$current_direct" = "/left_path/right_door" ]]
then
	echo "${yellow}You see two rooms afar. Suddenly an elf showed up."
	echo "You hear a voice in the room. \"One room will aid you, while the other will cause you harm \"." ; echo $default
		
elif [[ "$current_direct" = "/left_path/right_door/haunted_room" ]]
then
	echo ${red} ; figlet "Spooky" ; echo $default
	sleep 3	
	echo "${yellow}You found a shining key in the dead orc's lungs."
	echo "You can now access the final room!" ; echo $default
        got_key=1

elif [[ "$current_direct" = "/right_path/left_door" ]]
then
	echo "${yellow}You see two stairs. It seems that the left stair is more stable." ; echo $default
	
elif [[ "$current_direct" = "/right_path/right_door" ]]
then
	echo "${yellow}You see three rooms ahead of you."
	echo "You also see a warning in the side, \" Be careful on what lies ahead \" " ; echo $default

elif [[ "$current_direct" = "/right_path/left_door/left_stair" ]]
then
	echo "${yellow}You see a single room ahead." ; echo $default
	
elif [[ "$current_direct" = "/right_path/left_door/left_stair/final_room" ]]
then
	if [[ "$got_key" = "0" ]]
	then
		echo "${red}You cannot proceed yet, a key is needed."
		echo "Find it in other rooms!."; echo $default
		go_down
	elif [[ "$got_key" = "1" ]]
		then
		echo "${yellow}You entered the room. A magical portal is seen inside."        
		echo $default
		win_flag=1	
	fi
elif ((0==$(grep ^"$level?" forest_hunt.txt | grep $current_direct >> /dev/null 2> /dev/null ; echo $?)))
then
	((random=RANDOM%3))

	echo "${red}You have chosen a wrong path!"	
	case $random in
	0)
		echo "You have been attacked by Grungledor! Your HP has been decreased by 3."
		((hp=$hp-3))
		;;
	1)
		echo "Suddenly, an elf mage casted a sleep spell on you. You fell asleep for 1 minute"
		((timer=timer-1))
		echo "As you wake up, 1 minute has passed by."
		;;
	2)
		echo "You are mysteriously teleported 2 paths backward."
		go_down
		;;
	esac
	echo $default
	go_down
	sleep 5

fi
}

until (($win_flag==1))
do
	if (($win_flag==1))
	then
		break
	else
		getinput
	fi
done
echo "${yellow}You finished the game!"
echo "A very exhausted Grungledor is behind at your back."
echo "You decided to attack him with your sword."; echo $default
sleep 5

until [[ "$sure" = "Yes" ]]
do
	echo "What is the command that is used to remove section from each line of files?"
	read special_answer
	echo "Are you sure? Yes or No "
	read sure
done

if [[ "$special_answer" = "cut" ]]
then
	echo "Correct!."
	echo "You recovered 2 health for that"
	((hp=hp+2))
else
	echo "Incorrect!"
fi

echo $yellow ; echo "You now acquired the dark ability of endurance" ; set $default
echo $yellow ; figlet "LOADING"; echo $default
echo "The magic portal led to an abandoned tower. In there, you encountered Feliks, the human traitor."

export hp timer SECONDS
sleep 5

./key_word.sh

if (($?==100))
then
	exit 100
fi
