#!/bin/bash
#This script is used to operate the logic of the Key-Word Game
#hp=100
#timer=90

red=$(tput setaf 1)
yellow=$(tput setaf 3)
blue_bg=$(tput setab 4)
default=$(tput sgr0)
indicate() 
{
clear
tput rmcup
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
	echo $yellow ; figlet "Felik's";  
	figlet "Key Word" ;
	echo "Hello warrior, to get hold of Felik's power, you must successfully arrive at the top of the Tower where the moon shines the brighest. "
	echo "Instructions: To get to the top,You must execute commands that solve the required problem."
	echo "Key: elf | Question:An Elf is travelling with a bag."
	echo "For example: cut -f 2 -d \" \" file.txt"
	echo "Answer the question to obtain the key!" ; echo $default
	echo "Entering a wrong command will result to a decrease in HP."
	echo "You are stuck in a tower at Level 1 and must unlock the chests to progress."
	echo "Ready? Yes or No"
	read choice

done

win_flag=0
level=1
getinput()
{
indicate

case $level in
	1)
		echo "Welcome to level 1"
		echo "There is a single chest in this level. 
You must retrieve the key from the chest to unlock the door leading to the next level."
		echo "In the beginning, there are four prominent clans."
		echo "Suppose that the string is located at a file called key_word1.txt"
		#cut -f6 -d" " key_word1.txt
		echo "${yellow}Key:four" ; echo $default
		echo "Please enter input:"
		read user_input
		command_input=$(eval ${user_input} 2> /dev/null)
		correct_answer=four
		echo "You inputted $user_input"
		echo "Expected output: $command_input"
		if [[ "$command_input" = "$correct_answer" ]]
		then
			if ((0==$(echo $user_input | grep "$correct_answer" >> /dev/null 2> /dev/null ; echo $?)))
			then
				echo "I think you are cheating. Please avoid typing the answer."
				echo "For that, you will lose 5 hp."
				((hp=$hp-5))
				echo "You inputted $user_input"
				echo "Expected output: $command_input"
			else
				echo "Input is correct!"
				echo "You unlocked the chest!"
				echo "You used the key to unlock the door."
				((level++))
			fi
		else
			echo "Wrong answer!"
			echo "Your health will be decreased by 1"
			((hp--))
		fi
		sleep 5
		;;
	2)
		echo "Welcome to level 2"
		echo "There are two doors but no chest. You need to obtain the key to unlock the door."
		echo "Which door do you want to go to left or right?"
		read input_2
		
		until [[ "$input_2" = "left" ]] || [[ "$input_2" = "right" ]]
		do
			echo "Wrong input, please try again."
			echo "Please enter input:"
			read input_2
		#	indicate
		done
		
		case $input_2 in
			"left")
				echo "So you decided to take the left door."
				echo "The door is locked. You must answer a question in order to open it."
				echo "All the prominent clans live together in harmony. Until the Orc god decided to trample among the clans."
				echo "Suppose the string is located in a file named key_word2.txt"
				#cut -f11 -d" " key_word1.txt | rev
				echo "${yellow}Key: dog" ; echo $default
				echo "Please enter input:"
				read user_input 
				command_input=$(eval ${user_input} 2> /dev/null)
				correct_answer="dog"
				echo "You inputted $user_input"
				echo "Expected output: $command_input"
				if [[ "$command_input" = "$correct_answer" ]]
				then
					if ((0==$(echo $user_input | grep "$correct_answer" >> /dev/null 2> /dev/null ; echo $?)))
					then
						echo "I think you are cheating. Please avoid typing the answer."
						echo "For that, you will lose 5 hp."
						((hp=$hp-5))
						echo "You inputted $user_input"
						echo "Expected output: $command_input"s
					else
						echo "Input is correct!"
						echo "You unlocked the door!"
						echo "You decided to proceed to the next level."
						((level++))
					fi
				else
					echo "Wrong answer!"
					echo "Your health will be decreased by 1"
					((hp--))
				fi
				;;
			"right")
				echo "So you decided to take the right door."
				echo "The door is locked. You must answer a question in order to open it."
				echo "All the prominent clans live together in harmony. Until the Orc god decided to trample among the clans."
				echo "Suppose the string is located in a file named key_word2.txt".
				#cut -f14 -d" " key_word1.txt | rev
				echo "${yellow}Key: elpmart" ; echo $default
				echo "Please enter input:"
				read user_input 
				command_input=$(eval ${user_input} 2> /dev/null)
				correct_answer="elpmart"
				echo "You inputted $user_input"
				echo "Expected output: $command_input"
				if [[ "$command_input" = "$correct_answer" ]]
				then
					if ((0==$(echo $user_input | grep "$correct_answer" >> /dev/null 2> /dev/null ; echo $?)))
					then
						echo "I think you are cheating. Please avoid typing the answer."
						echo "For that, you will lose 5 hp."
						((hp=$hp-5))
						
					else
						echo "Input is correct!"
						echo "You unlocked the door!"
						echo "You decided to proceed to the next level."
						((level++))
					fi
				else
					echo "Wrong answer!"
					echo "Your health will be decreased by 1"
					((hp--))
				fi
				;;
			*)
				echo "Wrong input."
				;;
		esac
		sleep 5 
		;;
	3)
		echo "Welcome to level 3"
		echo "As you enter the room. You see a single door."
		echo "This resulted to a great war between the Orc god and with the four clans. Which is still happening currently."
		echo "${yellow}Key:GREAT WAR" ; echo $default
		echo "Suppose that the string is located at a file called key_word3.txt"
		#cut -f5-6 -d" " key_word1.txt | tr "[:alpha:]
		echo "Please enter input:"
		read user_input
		command_input=$(eval ${user_input} 2> /dev/null)
		correct_answer="GREAT WAR"
		echo "You inputted $user_input"
		echo "Expected output: $command_input"
		if [[ "$command_input" = "$correct_answer" ]]
		then
			if ((0==$(echo $user_input | grep "$correct_answer" >> /dev/null 2> /dev/null ; echo $?)))
			then
				echo "I think you are cheating. Please avoid typing the answer."
				echo "For that, you will lose 5 hp."
				((hp=$hp-5))
			else
				echo "Input is correct!"
				echo "You unlocked the door!"
				((level++))
			fi
		else
			echo "Wrong answer!"
			echo "Your health will be decreased by 1"
			((hp--))
		fi
		sleep 5
		;;
	4)
		echo "Welcome to level 4"
		echo "There are two doors. You must unlock either of one to progress."
		echo "Which door do you want to go to left or right?"
		read input_4
		
		until [[ "$input_4" = "left" ]] || [[ "$input_4" = "right" ]]
		do
			echo "Wrong input, please try again."
			echo "Please enter input:"
			read input_4
			#indicate
		done
		
		case $input_4 in
			"left")
			
				echo "So you decided to approach the left door."
				echo "The door is locked. You must obtain the key to open it."
				echo "Legend has it that only a brave man with an unbreakable will can only defeat the Orc god and bring back the harmonous relationship of the four clans."
				echo "Suppose the string is located in a file named key_word4.txt"
				#cut -f11 -d" " key_word1.txt | rev
				echo "${yellow}Key:The number of words in the file." ; echo $default
				echo "When using \"\n\", add two individual \ in front of it."		
				echo "Please enter input:"				
				read user_input 
				command_input=$(eval ${user_input} 2> /dev/null)
				correct_answer="25"
				echo "You inputted $user_input"
				echo "Expected output: $command_input"
				if [[ "$command_input" = "$correct_answer" ]]
				then
					if ((0==$(echo $user_input | grep "$correct_answer" >> /dev/null 2> /dev/null ; echo $?)))
					then
						echo "I think you are cheating. Please avoid typing the answer."
						echo "For that, you will lose 5 hp."
						((hp=$hp-5))
						echo "You inputted $user_input"
						echo "Expected output: $command_input"s
					else
						echo "Input is correct!"
						echo "You unlocked the door!"
						echo "You got out of the tower!"
						win_flag=1
					fi
				else
					echo "Wrong answer!"
					echo "Your health will be decreased by 1"
					((hp--))
				fi
				;;
			"right")
				echo "So you decided to approach the left door."
				echo "The door is locked. You must obtain the key to open it."
				echo "Legend has it that only a brave man with an unbreakable will can only defeat the Orc god and unite the four clans all back together."
				echo "Suppose the string is located in a file named key_word4.txt".
				#cut -f8 -d" " key_word1.txt | rev
				echo "${yellow}Key: The number of words in the file" ; echo $default
				echo "When using \"\n\", add two individual \ in front of it."
				echo "Please enter input:"
				read user_input 
				command_input=$(eval ${user_input} 2> /dev/null)
				correct_answer="25"
				echo "You inputted $user_input"
				echo "Expected output: $command_input"
				if [[ "$command_input" = "$correct_answer" ]]
				then
					if ((0==$(echo $user_input | grep "$correct_answer" >> /dev/null 2> /dev/null ; echo $?)))
					then
						echo "I think you are cheating. Please avoid typing the answer."
						echo "For that, you will lose 5 hp."
						((hp=$hp-5))
						echo "Your health will be decreased by 1"

					else
						echo "Input is correct!"
						echo "You unlocked the door!"
						echo "You got out of the tower!"
						win_flag=1
					fi
				else
					echo "Wrong answer!"
					echo "Your health will be decreased by 1"
					((hp--))
				fi
				;;
			*)
				echo "Wrong input."
				;;
		esac
		sleep 3 
		;;		
esac		
}	

until (($win_flag==1))
do
	if (($win_flag==1))
	then
		break
	fi
		getinput
done
echo "${yellow}You exposed Feliks into the top of the tower, wherein the moon shines directly."
echo "He cannot further move, even a tiny bit of muscle." 
echo $yellow ; echo "You now have the dark ability of strength" ; echo $default
echo $yellow ; figlet "LOADING"; echo $default
export hp timer SECONDS
./typing_tutor.sh

if (($?==100))
then
	exit 100
fi
