#!/bin/bash
#This script is used for operating the logic of the Word Search game.
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
	echo $timer
	echo "Times out! You did not finished the game."	
	sleep 5
	exit 100
fi
tput cup 0 80 ; tput el
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
tput cup 0 80 ; tput el
tput cup 0 80 ; echo "HP:$hp Time:$timer mins"

}


until [[ "$choice" = "Yes" ]] 
do
	indicate
	echo $yellow ; figlet "Clynthia's"; echo $default 
	echo $yellow ; figlet "Word Search" ; echo $default
	echo "${yellow}Instructions: You must find all the hidden words that are shuffled into the puzzle. By doing so, you decrease the health of Clynthia."
	echo "${red}Decreasing Clynthia's health will defeat her and let you absorb her power."; echo $default
	echo "Kindly type the word to remove it from the screen."
	echo "Entering a wrong word would result to a decrease in score by 2."
	echo "Type the command starting on the first character."
    echo "ROW#,COLUMN# of starting letter, then space, then ROW#,COLUMN# of ending letter."
	echo "Example: 8,1 1,8. This is not interchangeable."
	echo "Ready? Yes or No"
	read choice            
done

echo "What difficulty level do you want?"
echo "Easy   [1]"
echo "Medium [2]"
echo "Hard   [3]"
read input

until [[ "$input" = "1" || "$input" = "2" || "$input" = "3" ]] 
do
	echo "What difficulty level do you want?"
	echo "Easy   [1]"
	echo "Medium [2]"
	echo "Hard   [3]"
	read input
	indicate_temp
done

clear
flag1=0
flag2=0
flag3=0
flag4=0
flag5=0
flag6=0
flag7=0
flag8=0

getinput()
{
indicate_temp
# updatedisplay
tput cup 31 0 ; echo -n "Please enter your input:"
read answer

if (($input==1))
then

	case $answer in
		
		#1,8 8,1
		"1,8 8,1") 
			word_ans="EXTERNAL"
			ctr1=5
			ctr2=17
			echo $blue_bg
			for (( i=0; i<${#word_ans}; i++ ))
			do
				tput cup $ctr1 $ctr2 ; echo "*"
				((ctr1+=1))
				((ctr2-=2))
			done
			
			echo $default
			flag1=1
			tput cup 18 0 ; tput el
			;;
		#8,2 8,5
		"8,2 8,5") 
			word_ans="SUDO"
			ctr1=12
			ctr2=5
			echo $blue_bg
			for (( i=0; i<${#word_ans}; i++ ))
			do
				tput cup $ctr1 $ctr2 ; echo "*"
				((ctr2+=2))
			done
			
			echo $default
			flag2=1
			tput cup 19 0 ; tput el
			;;
			#1,6 6,1
		"1,6 6,1") 
			word_ans="KERNEL"
			ctr1=5
			ctr2=13
			echo $blue_bg
			for (( i=0; i<${#word_ans}; i++ ))
			do
				tput cup $ctr1 $ctr2 ; echo "*"
				((ctr1+=1))
				((ctr2-=2))
			done
			
			echo $default
			flag3=1
			tput cup 20 0 ; tput el
			tput cup 21 0; tput el 
			;;
		#6,8 6,4
		"6,8 6,4") 
			word_ans="SHELL"
			ctr1=10
			ctr2=17
			echo $blue_bg
			for (( i=0; i<${#word_ans}; i++ ))
			do
				tput cup $ctr1 $ctr2 ; echo "*"
				((ctr2-=2))
			done
			
			echo $default
			flag4=1
			tput cup 22 0 ; tput el
			tput cup 23 0; tput el 
			;;
		#5,5 5,A
		"5,5 5,A") 
			word_ans="LOCATE"
			ctr1=9
			ctr2=11
			echo $blue_bg
			for (( i=0; i<${#word_ans}; i++ ))
			do
				tput cup $ctr1 $ctr2 ; echo "*"
				((ctr2+=2))
			done
			echo $default
			flag5=1
			tput cup 24 0 ; tput el
			tput cup 25 0; tput el 
			;;
		#7,6 A,9
		"7,6 A,9") 
			word_ans="UNIX"
			ctr1=11
			ctr2=13
			echo $blue_bg
			for (( i=0; i<${#word_ans}; i++ ))
			do
				tput cup $ctr1 $ctr2 ; echo "*"
				((ctr1+=1))
				((ctr2+=2))
			done
			echo $default
			flag6=1
			tput cup 26 0; tput el 

			;;
		*)
			echo "Wrong answer, Clynthia has damaged you by 2 HP."
			((hp=hp-2))
			;;
	esac
	
elif (($input==2))
then
	case $answer in
		
		#3,7 3,C
		"3,7 3,C") 
			word_ans="EXPORT"
			ctr1=7
			ctr2=15
			echo $blue_bg
			for (( i=0; i<${#word_ans}; i++ ))
			do
				tput cup $ctr1 $ctr2 ; echo "*"
				((ctr2+=2))
			done
			
			echo $default
			flag1=1
			tput cup 30 0 ; tput el
			tput cup 21 0 ; tput el
			;;
		#9,1 9,A
		"9,1 9,A") 
			word_ans="BACKGROUND"
			ctr1=13
			ctr2=3
			echo $blue_bg
			for (( i=0; i<${#word_ans}; i++ ))
			do
				tput cup $ctr1 $ctr2 ; echo "*"
				((ctr2+=2))
			done
			
			echo $default
			flag2=1
			tput cup 22 0 ; tput el

			;;
		#6,1 1,6
		"6,1 1,6") 
			word_ans="DAEMON"
			ctr1=10
			ctr2=3
			echo $blue_bg
			for (( i=0; i<${#word_ans}; i++ ))
			do
				tput cup $ctr1 $ctr2 ; echo "*"
				((ctr1-=1))
				((ctr2+=2))
			done
			
			echo $default
			flag3=1
			tput cup 23 0 ; tput el

			;;
		#8,C B,9
		"8,C B,9") 
			word_ans="BASH"
			ctr1=11
			ctr2=25
			echo $blue_bg
			for (( i=0; i<${#word_ans}; i++ ))
			do
				tput cup $ctr1 $ctr2 ; echo "*"
				((ctr1+=1))
				((ctr2-=2))
			done
			
			echo $default
			flag4=1
			tput cup 24 0 ; tput el

			;;
		#C,A C,6
		"C,A C,6") 
			word_ans="CHMOD"
			ctr1=15
			ctr2=21
			echo $blue_bg
			for (( i=0; i<${#word_ans}; i++ ))
			do
				tput cup $ctr1 $ctr2 ; echo "*"
				((ctr2-=2))
			done
			echo $default
			flag5=1
			tput cup 25 0 ; tput el

			;;
		#8,1 1,8
		"8,1 1,8") 
			word_ans="SYMBOLIC"
			ctr1=12
			ctr2=3
			echo $blue_bg
			for (( i=0; i<${#word_ans}; i++ ))
			do
				tput cup $ctr1 $ctr2 ; echo "*"
				((ctr1-=1))
				((ctr2+=2))
			done
			echo $default
			flag6=1
			tput cup 26 0 ; tput el

			;;
		#1,1 6,6
		"1,1 6,6") 
			word_ans="RENICE"
			ctr1=5
			ctr2=3
			echo $blue_bg
			for (( i=0; i<${#word_ans}; i++ ))
			do
				tput cup $ctr1 $ctr2 ; echo "*"
				((ctr1+=1))
				((ctr2+=2))
			done
			echo $default
			flag7=1
			tput cup 31 0 ; tput el
			;;
		*)
			echo "Wrong answer, Clynthia has damaged you by 2 HP."
			((hp=hp-2))
			;;
	
	esac
elif (($input==3))
then
	case $answer in
		
		#1,8 8,1
		"1,8 8,1") 
			word_ans="NICENESS"
			ctr1=5
			ctr2=17
			echo $blue_bg
			for (( i=0; i<${#word_ans}; i++ ))
			do
				tput cup $ctr1 $ctr2 ; echo "*"
				((ctr1+=1))
				((ctr2-=2))
			done
			
			echo $default
			flag1=1
			;;
		#7,A 7,3
		"7,A 7,3") 
			word_ans="UNEXPAND"
			ctr1=11
			ctr2=21
			echo $blue_bg
			for (( i=0; i<${#word_ans}; i++ ))
			do
				tput cup $ctr1 $ctr2 ; echo "*"
				((ctr2-=2))
			done
			
			echo $default
			flag2=1
			;;
		#1,9 3,9
		"1,9 3,9") 
			word_ans="TOP"
			ctr1=5
			ctr2=19
			echo $blue_bg
			for (( i=0; i<${#word_ans}; i++ ))
			do
				tput cup $ctr1 $ctr2 ; echo "*"
				((ctr1+=1))
				
			done
			
			echo $default
			flag3=1
			;;
		#1,1 4,4
		"1,1 4,4") 
			word_ans="TIME"
			ctr1=5
			ctr2=3
			echo $blue_bg
			for (( i=0; i<${#word_ans}; i++ ))
			do
				tput cup $ctr1 $ctr2 ; echo "*"
				((ctr1+=1))
				((ctr2+=2))
			done
			
			echo $default
			flag4=1
			;;
		#6,D 9,D
		"6,D 9,D") 
			word_ans="TPUT"
			ctr1=10
			ctr2=27
			echo $blue_bg
			for (( i=0; i<${#word_ans}; i++ ))
			do
				tput cup $ctr1 $ctr2 ; echo "*"
				((ctr1+=1))
			done
			echo $default
			flag5=1
			;;
		#4,C A,C
		"4,C A,C") 
			word_ans="WHEREIS"
			ctr1=8
			ctr2=25
			echo $blue_bg
			for (( i=0; i<${#word_ans}; i++ ))
			do
				tput cup $ctr1 $ctr2 ; echo "*"
				((ctr1+=1))
			done
			echo $default
			flag6=1
			;;
		#8,B 5,B
		"8,B 5,B") 
			word_ans="FIND"
			ctr1=12
			ctr2=23
			echo $blue_bg
			for (( i=0; i<${#word_ans}; i++ ))
			do
				tput cup $ctr1 $ctr2 ; echo "*"
				((ctr1-=1))
			done
			echo $default
			flag7=1
			;;
		#6,9 6,4
		"6,9 6,4") 
			word_ans="ZOMBIE"
			ctr1=10
			ctr2=19
			echo $blue_bg
			for (( i=0; i<${#word_ans}; i++ ))
			do
				tput cup $ctr1 $ctr2 ; echo "*"
				((ctr2-=2))
			done
			echo $default
			flag8=1
			;;
		*)
			tput cup 31 0 
			echo "Wrong answer, Clynthia has damaged you by 2 HP."
			((hp=hp-2))
			;;
	
	esac
fi

sleep 1
tput cup 31 0 ; tput ed

}	


if [[ "$input" -eq "1" ]]
then
	echo "You have selected the Easy level. Good luck!"

	echo $yellow ;echo $blue_bg ; cat word_search${input}_pattern.txt ; echo $default
	grep -v "#" word_search$input.txt	
	until (($flag1==1 && $flag2==1 && $flag3==1 && $flag4==1 && $flag5==1 && $flag6==1))
	do
		if (($flag1==1 && $flag2==1 && $flag3==1 && $flag4==1 && $flag5==1 && $flag6==1))
		then
			break
		else
			getinput
		fi
	done
	echo -n "You completed the Easy level!"
	sleep 5
	
elif [[ "$input" -eq "2" ]]
then
	echo "You have selected the Medium level. Good luck!"
	
	echo $yellow ;echo $blue_bg ; cat word_search${input}_pattern.txt ; echo $default
	grep -v "#" word_search$input.txt
	until (($flag1==1 && $flag2==1 && $flag3==1 && $flag4==1 && $flag5==1 && $flag6==1 && $flag7==1))
	do
		if (($flag1==1 && $flag2==1 && $flag3==1 && $flag4==1 && $flag5==1 && $flag6==1 && $flag7==1))
		then
			break
		else
			getinput
		fi
	done
	
	echo "You completed the Medium level!"
	sleep 5

elif [[ "$input" -eq "3" ]]
then
	echo "So you have the guts to try the Hard level. Good luck!"
	echo $yellow ;echo $blue_bg ; cat word_search${input}_pattern.txt ; echo $default
	grep -v "#" word_search$input.txt
	getinput
	until(($flag1==1 && $flag2==1 && $flag3==1 && $flag4==1 && $flag5==1 && $flag6==1 && $flag7==1 && $flag8==1))
	do
		if (($flag1==1 && $flag2==1 && $flag3==1 && $flag4==1 && $flag5==1 && $flag6==1 && $flag7==1 && $flag8==1))
		then
			break
		else
			getinput
		fi
	done
	echo "You completed the Hard level!"
	sleep 5
fi

echo "You managed to break free from Clynthia's spell."
echo "However, she has another trump card."
echo $yellow ; figlet "LOADING"; echo $default 

sleep 5
export hp timer SECONDS

./crossword_puzzle.sh

if (($?==100))
then
	 exit 100
fi
