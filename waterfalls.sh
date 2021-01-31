#!/bin/bash
#This script is used to operate the logic of the Waterfall game

#timer=100 #temp
#hp=100 #temp

red=$(tput setaf 1)
yellow=$(tput setaf 3)
blue=$(tput setaf 4)
red_bg=$(tput setab 1)
yellow_bg=$(tput setab 3)
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

until [[ "$choice" = "Yes" ]]
do 
	indicate
	echo $blue ; figlet "Ravnash's";  
	figlet "Water falls "
	figlet "FINAL BOSS " ; echo $default
	echo "Instructions: You must type the pattern to remove the text from the screen."
	echo "There are three different categories: globbing, chmod octal values, and file permissions. "
	echo "This game will require all the dark abilities that you've acquired."
	echo "Which is speed, strength, endurance, and intelligence."     		echo "Do not let the words fall off into the screen!."
	echo "Ready? Yes or No"
	read choice
done

clear

win_flag=0
Aword_1="Sword"
Aword_2="123"
Aword_3="Ogre"

Bword_1="777"
Bword_2="111"
Bword_3="222"

Cword_1="-rw-------"
Cword_2="drwxr-x---"
Cword_3="drwxr-xr-x"

win_flag=0
i=0
int=1
getinput()
{
((i++))
clear
tput cup $i 50 ; echo ${Cword_1}
sleep 1

read input
if (($input==5)) 2> /dev/null
then
	break
else
	getinput
fi
}

until (($win_flag==1))
do
	getinput
done

win_flag=0
i=0
int=1
getinput()
{
((i++))
clear
tput cup $i 50 ; echo ${Cword_2}
sleep 1

read input
if (($input==5)) 2> /dev/null
then
	break
else
	getinput
fi
}

until (($win_flag==1))
do
	getinput
done

win_flag=0
i=0
int=1
getinput()
{
((i++))
clear
tput cup $i 50 ; echo ${Cword_3}
sleep 1

read input
if (($input==5)) 2> /dev/null
then
	break
else
	getinput
fi
}

until (($win_flag==1))
do
	getinput
done

win_flag=0
i=0
int=1
getinput()
{
((i++))
clear
tput cup $i 50 ; echo ${Bword_1}
sleep 1

read input
if [[ "$input" = "rwxrwxrwx" ]] 2> /dev/null
then
	break
else
	getinput
fi
}

until (($win_flag==1))
do
	getinput
done

win_flag=0
i=0
int=1
getinput()
{
((i++))
clear
tput cup $i 50 ; echo ${Bword_2}
sleep 1

read input
if (($input==5)) 2> /dev/null
then
	break
else
	getinput
fi
}

until (($win_flag==1))
do
	getinput
done

win_flag=0
i=0
int=1
getinput()
{
((i++))
clear
tput cup $i 50 ; echo ${Bword_3}
sleep 1

read input
if (($input==5)) 2> /dev/null
then
	break
else
	getinput
fi
}

until (($win_flag==1))
do
	getinput
done
clear

echo $yellow ; figlet "You won the game"; echo $default

echo "$firstname:$hp:$timer" >> scoreboard.txt

