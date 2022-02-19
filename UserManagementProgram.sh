#!/bin/bash
#Student Name: Abundance Esim
#Student Number: 041025890
#Semester: Fall 2021(Level 2)
#Course Code: CST8102
#Course Section: 311
#Instructor's Name: Prof. Saif Terai
#Description: This script performs user management based on user's input. Program displays an initial menu for user to choose from.

#Code begins here:
clear
echo "Program to Manage User Accounts."
echo "Author: Abundance Esim"
echo "Student Number: 041025890"
echo "Semester: Fall 2021"
echo "Course - Section: CST 8102, Section 311"
sleep 2

display_menu() {
   clear
   echo 'User Management'
   echo 'A. Create User Account'
   echo 'B. Delete User Account'
   echo 'C. Change Supplementary Group'
   echo 'D. Change Initial Group for a User Account'
   echo 'E. Change default login shell for a User Account'
   echo 'F. Change account expiration date for a User Account'
   echo 'Q. Quit'
}

create_user() {
   echo -n "enter a username:"
   read usrname
   echo "username: " $usrname
   
   echo -n "enter home directory: "
   read homedir
   echo "home directory: " $homedir

   echo -n "enter default login shell: "
   read loginshl
   echo "default login shell: " $loginshl
   
   sudo useradd $usrname -m -d $homedir -s $loginshl
   echo "You have created the user: $usrname, home directory: $homedir, login shell: $loginshl"
   sleep 2
}

del_user() {
   echo -n "Enter user to be deleted: "
   read delusr
   echo "User $delusr will be deleted."
   sleep 2
   sudo userdel -r $delusr
}

supp_group() {
   echo -n "Enter username: "
   read $usrname
   
   echo "Enter supplementary group: "
   read $suppgrp
   
   echo "User: $usrname, Supplementary group: $suppgrp"
   
   sleep 2
   sudo usermod -G $suppgrp $usrname
}

init_group() {
   echo -n "Enter username: "
   read $usrname
   
   echo "Enter supplementary group: "
   read $initgrp
   
   echo "User: $usrname, initial group: $initgrp"
   
   sleep 2
   sudo usermod -g $initgrp $usrname
}

login_shell() {
#to prompt the user for their shell, just use chsh with no option.
   echo -n "Enter username: "
   read $usrname
   
   echo "Enter default shell for user: "
   read $usershl
   
   echo "User: $usrname, Default shell: $usrshl"
   
   sleep 2
   sudo usermod -s $usershl $usrname
}

expiry_date() {
   echo -n "Enter username: "
   read $usrname
   
   echo -n "Enter expiry date( Format: YYYY-MM-DD ): "
   read $expdate
   
   sudo usermod -e $expdate
   
   echo "Your new expiry date is: $expdate"
   sleep 2
}

choice=n

while [ $choice != "Q" ] && [ $choice != "q" ]
do
display_menu
read choice

if [ $choice = 'A' ] || [ $choice = 'a' ]
   then
   create_user

elif [ $choice = 'B' ] || [ $choice = 'b' ]
   then 
   del_user

elif [ $choice = 'C' ] || [ $choice = 'c' ]
   then
   supp_group

elif [ $choice = 'D' ] || [ $choice = 'd' ]
   then
   init_group

elif [ $choice = 'E' ] || [ $choice = 'e' ]
   then 
   login_shell

elif [ $choice = 'F' ] || [ $choice = 'f' ]
   then
   expiry_date

elif [ $choice = 'Q' ] || [ $choice = 'q' ]
   then
   exit

elif [ $choice != 'Q' ] && [ $choice != 'q' ]
   then 
   echo 'Valid options are A, B, C, D, E, F or [Q]uit'
   sleep 3

fi

done
#eof : myscript.sh
