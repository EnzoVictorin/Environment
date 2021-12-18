#!/bin/bash

RED='\033[0;31m'
WHITE='\033[0;37m'
GREEN="\033[0;32m"
BLUE='\033[0;36m'
NC='\033[0m' # No Color
ARROW="$BLUE==>$WHITE"
RED_ARROW="$RED==>"

cd "$( dirname "$0" )"


checkSudo() {
    if [ $(whoami) = 'root' ]; then
        echo -e "$RED_ARROW \033[1mDon't run this script as root!\033[0m"
        exit 1
    fi
}
installCommandLineTools() {
    echo -e "$ARROW \033[1mInstalling Command Line Tools...\033[0m"
    xcode-select --install
}
installBrew() {
    if command -v brew &> /dev/null
    then
       echo -e "$ARROW \033[1mHomebrew is already installed!\033[0m"
    else
        echo -e "$ARROW \033[1mInstalling HomeBrew\033[0m"
        chmod +x helpers/homebrew_install.sh
        /bin/bash -c helpers/homebrew_install.sh
    fi
}
installOhMyZSH() {
    echo -e "$ARROW \033[1mInstalling \`Oh My Zsh\`...\033[0m"
    chmod +x helpers/ohMyZSH_install.sh
    sh helpers/ohMyZSH_install.sh --unattended
    echo -e "$ARROW \033[1mInstalling \`Oh My Zsh\` zshrc...\033[0m"
    cp dotFiles/zshrc ~/.zshrc
    chmod +x ~/.zshrc
    chmod +x ~/.oh-my-zsh
}
installZSH_Theme() {
    echo -e "$ARROW \033[1mInstalling ZSH theme \`Powerlevel10K\`...\033[0m"
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
    echo -e "$ARROW \033[1mInstalling ZSH theme \`Powerlevel10K\`'s configuration...\033[0m"
    cp dotFiles/p10K.zsh ~/.p10k.zsh
}

installZSH_Plugins() {
    echo -e "$ARROW \033[1mInstalling ZSH plugin \`zsh-autocomplete\`...\033[0m"
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    echo -e "$ARROW \033[1mInstalling ZSH plugin \`zsh-syntax-highlighting\`...\033[0m"
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
}

install() {
    installCommandLineTools
    installBrew
    installOhMyZSH
    installZSH_Theme
    installZSH_Plugins
    echo -e ""
    echo -e "$GREEN\033[1mDone!\033[0m\n"
    exit 0
}

checkSudo
echo -e "\n$BLUE\033[1mWelcome to Enzo VICTORIN's environment installer!\033[0m"
echo -e "
Copyright (C) 2021 Enzo VICTORIN
This program comes with$RED ABSOLUTELY NO WARRANTY$NC; for details see ./LICENSE.
This is free software, and you are welcome to redistribute it
under certain conditions; see ./LICENSE.
"
echo -e "This script will install:"
echo -e "$ARROW \033[1mApple's Command Line Tools\033[0m"
echo -e "$ARROW \033[1mHomebrew\033[0m"
echo -e "$ARROW \033[1mOh My ZSH\033[0m"
echo -e "$ARROW \033[1mOh My ZSH theme \`Powerlevel10K\`\033[0m"
echo -e "$ARROW \033[1mOh My ZSH plugin \`zsh-autocomplete\`\033[0m"
echo -e "$ARROW \033[1mOh My ZSH plugin \`zsh-syntax-highlighting\`\033[0m"

echo -e ""

echo -e "This script will overwrite these configuration files:"
echo -e "$ARROW \033[1m~/.zshrc\033[0m"
echo -e "$ARROW \033[1m~/.p10k.zsh\033[0m"

echo -e ""

read -p $'Do you wish to continue? [y/n] \x0a' yn
case $yn in
    [Yy]* ) install;;
    [Nn]* ) exit 2;;
    * ) exit 2;;
esac
