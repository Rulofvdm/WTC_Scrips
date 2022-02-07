#/bin/bash

# echo $1


bin=$(echo $PATH)

installs_local=$(whereis wtc-lms)

if [ ! -z $1 ]
then
echo $1
fi  
# Makes sure the script is not run as root
if [ $(id -u) -eq 0 ]
then 
  echo "$(tput setaf 1)Please don't run this as root $(tput sgr 0)"
  exit
fi

# Check if this script is being run on a WSL Distro or just full Linux
IS_WSL=$(uname -r | grep -c Microsoft)§
WSL_CHECK=$(set | grep WSL)

if [ -z "$WSL_CHECK" ]
then
      echo "You are running this on Linux"
      WSL_Bool=false
else
      echo "You are running this in WSL"
      WSL_Bool=true
fi

echo 
cat /etc/*-release | egrep "PRETTY_NAME" | cut -d = -f 2 | tr -d '"' | tac | tr '\n' ' '
echo
# List of User's excluding the default users

# Mounted_Users=$(ls /mnt/c/Users --ignore='All Users' --ignore=Default --ignore='Default User' --ignore=Public --ignore=desktop.ini)
# Mounted_Users=$(ls /mnt/c/Users --ignore='All Users' --ignore='Default User' --ignore=Public --ignore=desktop.ini)
Mounted_Users=$(ls /mnt/c/Users --ignore='Default User' --ignore=Public --ignore=desktop.ini)

IFS=$'\n' read -rd '' -a array <<< "$Mounted_Users"             # Add's all the user's to an array

for element in "${array[@]}"
do
    COUNTER=$[$COUNTER +1]
done

if [ $COUNTER -gt 1 ]
then
    echo "Which user?"
    for element in "${array[@]}"
    do
        COUNT=$[$COUNT +1]
        echo [$COUNT] $element  
    done

    user_num="asd"
    while [[ ! $user_num =~ ^[0-9]+$ ]] # Makes sure user's input only includes numbers
    do
        read -n1 -p "Which is user are you currently logged in as? (Enter the number ONLY): " user_num
        username=${array[$user_num - 1]}
    done

else
    username=${array[0]}
fi
echo 
echo "Current User: $username"

username=$(echo "$username" | sed 's/ /\\ /g' )


if [ $WSL_Bool -eq true ]
download_dir='/mnt/c/Users/'$username'/Downloads/'  # The directory for Windows' Download Folder
listed=$(ls $download_dir | grep "*wtc-lms*")   # List of all files called "wtc-lms" in the Download's Folder
then
    if [ "$listed" = "wtc-lms" ] || [ -f "$download_dir/wtc-lms" ]
        then 
            echo
        else
            echo "$(tput setaf 1)wtc-lms is not in your download's directory"
            echo "Please make sure you have downloaded the latest wtc-lms from slack and it is located in $download_dir with the file name 'wtc-lms'"
            echo "'wtc-lms(1) will not work' $(tput sgr 0)"
            down_dir=$(wslpath -w $download_dir)
            echo "If"
            whiptail --msgbox "The directory 'wtc-lms' should be stored in the currently opened file location in File Explorer" 10 20

            explorer.exe $down_dir
            exit 1
        fi
fi

if [ $WSL_Bool -eq false ]
then
    download_dir='~/Downloads/'  # The directory for Linux' Download Folder
    listed=$(ls $download_dir | grep "*wtc-lms*")
    if [ "$listed" = "wtc-lms" ] || [ -f "$download_dir/wtc-lms" ]
    then
        echo
    else
        echo "$(tput setaf 1)wtc-lms is not in your download's directory"
        echo "Please make sure you have downloaded the latest wtc-lms from slack and it is located in $download_dir with the file name 'wtc-lms'"
        echo "'wtc-lms(1) will not work' $(tput sgr 0)"
        whiptail --msgbox "The directory 'wtc-lms' should be stored in the currently opened file location in nautilus" 10 20

        nautilus --browser ~/Downloads
        exit 1
    fi
fi


# echo "Installing wtc-lms now"

# Checks user's email address
while true
do
    read -p "What is your WeThinkCode Email address? " student_email

    if [[ $student_email == *"@student.wethinkcode.co.za"* ]]
    then
        echo
        read -n1 -p "Confirm that : '$student_email' is your email Yes[y]/No[n] " confirm_email

        case $confirm_email in
            y|Y) break;;

            n|N) echo ;;
        esac
    fi

done

echo

sudo cp $download_dir/wtc-lms /usr/bin/

if [ ! -d $HOME/.config/wtc ]
then
    mkdir $HOME/.config/wtc/
fi

if [ ! -f $HOME/.config/wtc/config.yml ]
then
    touch $HOME/.config/wtc/config.yml
    echo "---" >> $HOME/.config/wtc/config.yml
    echo 'repo_path: "/mnt/c/$username/Desktop/projects"' >> $HOME/.config/wtc/config.yml
    echo 'navigator_url: "https://navigator.wethinkcode.co.za"' >> $HOME/.config/wtc/config.yml
    echo 'username: '"$student_email" >> $HOME/.config/wtc/config.yml 
    echo 'review_manager_url: "https://review-manager.wethinkcode.co.za"' >> $HOME/.config/wtc/config.yml 
    echo 'keycloak_url: "https://keycloak.wethinkcode.co.za"' >> $HOME/.config/wtc/config.yml 
fi


read -n1 -p "Do you have want to setup ssh for gitlab? Yes[y]/No[n] " ssh_start

case $ssh_start in

    y|Y) echo "Follow the instructions";
         ssh-keygen;
         cat ~/.ssh/id_rsa.pub | clip.exe;
         echo "Your SSH Public key has been copied to your clipboard";
         if -z $IS_WSL
         then
            cmd.exe /c start https://gitlab.wethinkcode.co.za/-/profile/keys
         fi

    n|N) echo ;;
    
esac

