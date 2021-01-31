#!/bin/bash
#This displays the epilogue of the story.
red=$(tput setaf 1)
yellow=$(tput setaf 3)
blue_bg=$(tput setab 4)
default=$(tput sgr0)

ep1()
{
clear
figlet "Epilogue"
echo "${yellow}Once upon a time, the four clans: Elves, Dwarves, Humans, and Fairies were living together in harmony in the land called Havenguard. Until the dark Orc god, Ravnash, arrived and decided to bring chaos into the land. He is the only one of his kind as the Orc’s clan existence predates the formation of the four other clans. For many years, the dark Orc god continued to torment the four clans with the minions that decided to join him in exchange for dark power." 
echo $default
echo "Continue? Yes or No?"
read input
if [[ "$input" = "Yes" ]]
then
	clear
	figlet "Epilogue"
	echo "${yellow}He has four loyal minions that serve him with their lives. First is Clynthia, a fairy who is granted dark intelligence. She is said to be very intelligent and knowledgeable in the art of magic. Second is Grungledor, a dwarf who is granted dark endurance. He can outperform almost anyone with his skill. Third is Feliks, a human granted with dark strength. He is very strong, and it said that he can take on a whole army of humans or dwarves. Fourth is Ranaeril, an elf who is granted dark speed. He likes to toy with mortals as his presence is usually unnoticed with his skill."
	echo $default	
	echo "Continue? Yes or No?"
	read input_2
	if [[ "$input_2" = "Yes" ]]
	then
		clear
		figlet "Epilogue"
		echo "${yellow}A warrior from the human clan decided to fight back and end the tyranny caused by the Orc god. To be able to stop the Orc god, the four clans decided to come up with a plan to defeat him. It is said that when the Moon shines the brightest, every 1000 years, the Orc god and his minions gets their power weakened for 90 minutes. To defeat the Orc god, the warrior must first obtain all the dark powers gained from defeating his weakened minions and face him within 90 minutes."
		echo $default
		echo "Continue? Yes or No?"
		read input_3
		if [[ "$input_3" = "Yes" ]]
		then
			echo "You decided to start your journey and ventured further into the woods. The first minion to fight is Clynthia!"
			hp=100
			timer=90
			SECONDS=0
			export hp timer SECONDS
			./word_search.sh
			export lastname firstname middle_initial studentnum contactnum emailadd
			sleep 4
		else
			ep1
		fi
	else
		ep1
	fi		
else
	ep1
fi
}

ep1