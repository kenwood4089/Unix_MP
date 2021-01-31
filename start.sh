#!/bin/bash
#This is the startup page of the game. It gets the students information and stores it in a text file.

getinput()
{
clear
echo "Welcome Unix student."
echo "If you want to use an existing account, enter 1. If you would like to create a new one, enter 2."
read input
if (($input==1))
then
	echo "Hello there, returnee. Kindly enter your student number to proceed to the game."
	read studentnum
	if ((0==$(cut -f4 -d: database.txt| grep -x $studentnum >> /dev/null 2> /dev/null; echo $?)))
	then
		echo "Hello $(grep $studentnum database.txt | cut -f2 -d:), with a student number of $studentnum."
		sleep 3
		next_script
	else
		echo "Your input is not in our database."
		sleep 1
		getinput
	fi
elif (($input==2))
then
	clear
	echo "Hello new adventurer! Kindly enter the following to create your account:"
	echo "Full Name (in Last_Name First_Name Middle_Initial format)"
	read lastname firstname middle_initial
	echo "Student Number (in 20xxxxxxxx format)"
	read studentnum
	while ((1==$(echo $studentnum | egrep -x ^20[0-9]{8} >> /dev/null 2> /dev/null ; echo $?)||0==$(grep $studentnum database.txt >> /dev/null 2> /dev/null ; echo $?)))
	do	
		if ((1==$(echo $studentnum | egrep -x ^20[0-9]{8} >> /dev/null 2> /dev/null ; echo $?)))
		then
			echo "The student number format is incorrect"
		elif ((0==$(grep $studentnum database.txt >> /dev/null 2> /dev/null ; echo $?)))
		then
			echo "Error, the student number already exists."
		fi
		echo "Please enter Student Number (in 20xxxxxxxx format) again."
		read studentnum		
	done
	echo "Contact Number (in 09xxxxxxxxx format)"
	read contactnum
	while ((1==$(echo $contactnum | egrep -x ^09[0-9]{9} >> /dev/null 2> /dev/null ; echo $?)))
	do
		echo "Contact Number is incorrect. Please try again"
		read contactnum
	done
	echo "Email Address (in _@_.com format)"
	read emailadd
	echo "Your account has been successfully created."
	echo "Hello $firstname $middleinitial $lastname, with a student num of $studentnum. Your contact number is $contactnum and your address is $emailadd."
	echo "$lastname:$firstname:$middle_initial:$studentnum:$contactnum:$emailadd" >> database.txt
	sleep 3
	next_script
else
	echo "Input is incorrect, please try again."
	getinput
fi
}

next_script()
{
export $lastname $firstname $middle_initial $studentnum $contactnum $emailadd
./mainpage.sh
}
getinput

exit
