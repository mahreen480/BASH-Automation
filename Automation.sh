#!/bin/bash

while true
do
	clear
	echo -e "  --: Automations :-- \n"
	echo "1) User Automation"
	echo "2) File Automation"
	echo "3) System Automation"
	echo -e "4) Exit\n"
	read -p "Select Option: " option
	if [ $option -eq 1 ]
		then
		clear
		echo -e "  --: User Automation :--\n"
		echo "1) Create User"
		echo "2) Delete User"
		echo "3) Change Current User Password"
		echo "4) Change User"
		echo "5) Show Current User"
		echo -e "6) Exit\n"
		read -p "Select Option: " option
		clear
		if [ $option -eq 1 ] 
		then
			read -p "Enter Username: " username
			read -sp "Enter Password: " password
			sudo useradd -m -s /bin/bash $username
			echo "$username:$password" | sudo chpasswd
			read -p "Do you want to change user(Y/N): " option
			if [ $option = 'Y' ]
			then
			su $username
		fi
	elif [ $option -eq 2 ]
	then
		read -p "Enter Username: " username
		read -sp "Enter Password: " systemPassword
		echo $systemPassword | sudo -S deluser $username
	elif [ $option -eq 3 ]
	then
		read -p "Enter Username: " username
		sudo passwd $username
	elif [ $option -eq 4 ]
	then 
		read -p "Enter Username: " username
		su $username
	elif [ $option -eq 5 ]
	then 
		whoami
	fi
	read -p "Press any key to continue: "
	elif [ $option -eq 2 ]
	then
		clear
		echo -e "  --: File Automations :-- \n"
		echo "1) Create Folder"
		echo "2) Create File"
		echo "3) Remove Folder"
		echo "4) Remove File"
		echo "5) Change Folder"
		echo "6) Show Current Folder"
		echo "7) Copy File"
		echo "8) Move File"
		echo "9) Zip"
		echo "10) Unzip" 
		echo -e "11) Exit\n"
		read -p "Select Option: " option
	clear
	if [ $option -eq 1 ]
	then
		read -p "Enter Folder Name: " folderName
		mkdir $folderName
	elif [ $option -eq 2 ]
	then
		read -p "Enter File Name: " fileName
		read -p "Enter File Extension: " extension
		touch "$fileName$extension"
	elif [ $option -eq 3 ]
	then
		read -p "Enter Folder Name: " folderName
		rm -r "$folderName"
	elif [ $option -eq 4 ]
	then
		read -p "Enter File Name: " fileName
		read -p "Enter File Extension: " extension
		rm "$fileName$extension"
	elif [ $option -eq 5 ]
	then 
		read -p "Enter Folder Name: " folderName
		cd $folderName
	elif [ $option -eq 6 ]
	then 	
		pwd
	elif [ $option -eq 7 ]
	then 
		read -p "Enter File Name (With Extension): " fileName1
		read -p "Enter New File Name (With Extension): " fileName2
		cp $fileName1 $fileName2
	elif [ $option -eq 8 ]
	then 
		read -p "Enter File Name (With Extension): " fileName
		read -p "Enter Path: " path
		mv $fileName $path
	elif [ $option -eq 9 ]
	then
		read -p "Enter File Name to Zip: " fileName
		read -p "enter File Extension: " extension
		zip "$fileName.zip" "$fileName$extension"
	elif [ $option -eq 10 ]
	then 
		read -p "Enter Zip File Name to Unzip: " fileName
		unzip "$fileName.zip"
	fi
	read -p "Press any key to continue: "
	elif [ $option -eq 3 ]
	then
		clear
		echo -e "  --: System Automations :-- \n"
		echo "1) System Reboot"
		echo "2) System Shutdown"
		echo "3) System Name"
		echo "4) System Details"
		echo -e "5) Exit\n"
		read -p "Select Option: " option
		clear
		if [ $option -eq 1 ]
		then
			sudo reboot
		elif [ $option -eq 2 ]
		then 
			sudo shutdown -h now
		elif [ $option -eq 3 ]
		then 
			uname
		elif [ $option -eq 4 ]
		then
			neofetch
		fi
		read -p "Press any key to continue: "
	elif [ $option -eq 4 ]
	then
		clear
		echo -e "\nThank You ;)\n"
		read -p "Press any key to continue: "
		clear
		break
	else
		clear
		echo "Invalid Option"
		read -p "Press any key to continue: "
	fi
done