#!/bin/bash

# If anything failed, please run ****sudo dpkg --configure -a***
# Making sure script is not run by root; Following least privileges 
if [ "$EUID" -eq 0 ]
  then echo "Please don't run as root"
  exit
fi

# Setting everything to Dark Mode 🌚, and setting the dock to the bottom
gsettings set org.gnome.desktop.interface color-scheme prefer-dark
gsettings set org.gnome.shell.ubuntu color-scheme prefer-dark
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM

# Updating repos and install necassary tools
sudo apt update
sudo apt install curl -y
sudo apt install git curl wget make libfuse2 apt-transport-https -y ## LIBFUSE2 is needed to run AppImages in 22.04, this will let Jetbrains Toolbox work

# Download and install latest version of Slack
SLACKVER=$(curl -s https://slack.com/release-notes/linux | sed -n "/^.*<h2>Slack /{;s///;s/[^0-9.].*//p;q;}") ## Getting the latest version of Slack
SLACKURL="https://downloads.slack-edge.com/releases/linux/$SLACKVER/prod/x64/slack-desktop-$SLACKVER-amd64.deb" ## Using the latest version to download the latest .deb of Slack
wget -cO slack.deb $SLACKURL ## Downloading Slack .deb
sudo dpkg -i slack.deb ## Installing Slack
sudo apt --fix-broken install -y ## Isn't necessary but useful if something fails

# Download and install latest version of Visual Studio Code
wget -cO vscode.deb 'https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64' ## Downloading latest VSCode .deb
sudo dpkg -i vscode.deb ## installing VSCode
sudo apt --fix-broken install -y ## Isn't necessary but useful if something fails

# Download and install latest version of Zoom
wget -cO zoom.deb 'https://zoom.us/client/latest/zoom_amd64.deb'
sudo dpkg -i zoom.deb
sudo apt --fix-broken install -y ## Isn't necessary but useful if something fails


# Download and install latest Jetbrains Toolbox AppImage
wget -cO jetbrains-toolbox.tar.gz "https://data.services.jetbrains.com/products/download?platform=linux&code=TBA" ## Downloading latest Jetbrains Toolbox
tar -xzf jetbrains-toolbox.tar.gz ## Extracting Jetbrains Toolbox compressed folder
DIR=$(find . -maxdepth 1 -type d -name jetbrains-toolbox-\* -print | head -n1) ## Getting the directory of where the toolbox was extracted
sudo mv $DIR /opt/jetbrains ## Moving the AppImage into a new directory inside /opt
/opt/jetbrains/jetbrains-toolbox ## Opening the AppImage

# Installing Brave
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install brave-browser -y

# Installing sdkman
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"

# Installing Java & Maven
sdk install java 11.0.16-amzn
sdk install maven 3.6.3

# Set the applications pinned to the dock to make the main applications accessible
dconf write /org/gnome/shell/favorite-apps "['brave-browser.desktop', 'org.gnome.Nautilus.desktop', 'slack.desktop', 'code.desktop', 'org.gnome.Terminal.desktop']"

#final update of repos and upgrading packages
sudo apt update
sudo apt full-upgrade -y 
sudo apt autoremove -y

# Reboot delay
COUNTER=5
while [ 1 ] 
do
    if [ ${COUNTER} -eq 0 ]
    then
        break
    fi
    echo "Linux is restarting after ${COUNTER}s."
    sleep 1
    COUNTER=$( echo "${COUNTER}-1" | bc )
done
sudo reboot now
