#!/bin/bash
# Enzo's environment installer
# License: GNU GPLv3
# See ./LICENSE for more information.


# COLORS
RED='\033[0;31m'
WHITE='\033[0;37m'
GREEN="\033[0;32m"
BLUE='\033[0;36m'
NC='\033[0m' # No Color
ARROW="$BLUE==>$WHITE"
RED_ARROW="$RED==>"

cd "$( dirname "$0" )"

# MARK: Functions

# Check if this script is executed as root.
# Don't run it as root!
checkSudo() {
    if [ $(whoami) = 'root' ]; then
        echo -e "$RED_ARROW \033[1mDon't run this script as root!\033[0m"
        exit 1
    fi
}

# Install Apple's Command line tools
installCommandLineTools() {
    echo -e "$ARROW \033[1mInstalling Command Line Tools...\033[0m"
    xcode-select --install
}

# Install Homebrew: The missing package manager for macOS from the install script in ./installers
# They were downloaded from the official website.
# It is required for installing everything else.
installBrew() {
    if command -v brew &> /dev/null
    then
       echo -e "$ARROW \033[1mHomebrew is already installed!\033[0m"
    else
        echo -e "$ARROW \033[1mInstalling HomeBrew\033[0m"
        chmod +x installers/homebrew_install.sh
        /bin/bash -c installers/homebrew_install.sh
    fi
}

# Install Oh my ZSH to manage your terminal configuration from the install script in ./installers.
# They were downloaded from the offical website.
installOhMyZSH() {
    echo -e "$ARROW \033[1mInstalling \`Oh My Zsh\`...\033[0m"
    chmod +x installers/ohMyZSH_install.sh
    sh installers/ohMyZSH_install.sh --unattended
    echo -e "$ARROW \033[1mInstalling \`Oh My Zsh\` configuration...\033[0m"
    cp dotFiles/zshrc ~/.zshrc
    chmod +x ~/.zshrc
    chmod +x ~/.oh-my-zsh
}

# Install the ZSH theme `PowerLevel10K`
installZSH_Theme() {
    echo -e "$ARROW \033[1mInstalling ZSH theme \`Powerlevel10K\`...\033[0m"
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
    echo -e "$ARROW \033[1mInstalling ZSH theme \`Powerlevel10K\`'s configuration...\033[0m"
    cp dotFiles/p10K.zsh ~/.p10k.zsh
}

# Install two ZSH plugins
# zsh-autocomplete and zsh-syntax-highlightning.
installZSH_Plugins() {
    echo -e "$ARROW \033[1mInstalling ZSH plugin \`zsh-autosuggestions\`...\033[0m"
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    echo -e "$ARROW \033[1mInstalling ZSH plugin \`zsh-syntax-highlighting\`...\033[0m"
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
}

# Install iTerm2 from Homebrew.
installiTerm2() {
    echo -e "$ARROW \033[1mInstalling iTerm2...\033[0m"
    brew install --cask iterm2
}

# Install custom .vimrc
installVimConfiguration() {
    echo -e "$ARROW \033[1mInstalling VIM configuration...\033[0m"
    cp dotFiles/vimrc ~/.vimrc
}

# Install Cocoapods
installCocoapods() {
    echo -e "$ARROW \033[1mInstalling cocoapods...\033[0m"
    echo -e "Your password is required for installing Cocoapods."
    echo -e "Hit ^C to skip."
    sudo gem install cocoapods
}

# Install Fastlane
installFastlane() {
    echo -e "$ARROW \033[1mInstalling Fastlane...\033[0m"
    brew install fastlane
}

# Install Xcodes
installXcodes() {
    echo -e "$ARROW \033[1mInstalling Xcodes...\033[0m"
    brew install --cask xcodes
}

# Install VSCodium: a fork of VSCode without telemetry.
installVSCodium() {
    echo -e "$ARROW \033[1mInstalling VSCodium...\033[0m"
    brew install --cask vscodium
}

# Install LibreWolf: a fork of Firefox without telemetry.
installLibreWolf() {
    echo -e "$ARROW \033[1mInstalling LibreWolf...\033[0m"
    brew install --cask librewolf
}

# Install a few usefull firefox extensiosn
# See ./LibreWolfExtensions/README.md for details.
installLibreWolfExtensions() {
    echo -e "$ARROW \033[1mInstalling LibreWolf extensions...\033[0m"
    echo -e "see ./LibreWolfExtensions/README.md for details."
    cp LibreWolfExtensions/** $HOME/Library/Application\ Support/LibreWolf/Profiles/*.default-release/extensions
}

# Install everything!
install() {
    # Install Apple's Command line tools.
    installCommandLineTools
    # Install Homebrew, the missing package manager for macOS
    installBrew
    # Install Oh My ZSH
    installOhMyZSH
    # Install the ZSH theme `Powerlevel10K`
    installZSH_Theme
    # Install ZSH plugins
    installZSH_Plugins
    # Install vim configuration
    installVimConfiguration
    # Install iTerm2
    installiTerm2
    # Install Cocoapods
    installCocoapods
    # Install XcodeS (not Xcode!)
    installXcodes
    # Install VSCodium
    installVSCodium
    # Install the LibreWolf browser
    installLibreWolf
    # Install a few browser extensions
    # See ./LibreWolfExtensions/README.md for details.
    installLibreWolfExtensions

    # Done!
    echo -e ""
    echo -e "$GREEN\033[1mDone!\033[0m\n"
    echo -e "Restart your terminal to see the new look!"
    echo -e "You need to authorise the extensions within the LibreWolf browser to use them.\n"
    exit 0
}

# MARK: SCRIPT

# You should never run this script as root (e.g sudo)
checkSudo

# This script will ask your authorisation before installing anything!
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
echo -e "$ARROW \033[1mOh My ZSH plugin \`zsh-autosuggestions\`\033[0m"
echo -e "$ARROW \033[1mOh My ZSH plugin \`zsh-syntax-highlighting\`\033[0m"
echo -e "$ARROW \033[1miTerm2\033[0m"
echo -e "$ARROW \033[1mCocoapods\033[0m"
echo -e "$ARROW \033[1mXcodes\033[0m"
echo -e "$ARROW \033[1mVSCodium\033[0m"
echo -e "$ARROW \033[1mLibreWolf\033[0m"

echo -e ""

echo -e "This script will overwrite these configuration files:"
echo -e "$ARROW \033[1m~/.zshrc\033[0m"
echo -e "$ARROW \033[1m~/.p10k.zsh\033[0m"
echo -e "$ARROW \033[1m~/.vimrc\033[0m"

echo -e ""

echo -e "This script will install these browser extensions in LibreWolf:"
echo -e "$ARROW \033[1mMedium Unlimited\033[0m"
echo -e "$ARROW \033[1mFirefox Multi-Account Container\033[0m"
echo -e "$ARROW \033[1mDashlane\033[0m"
echo -e "$ARROW \033[1mSponsorBlock\033[0m"
echo -e "$ARROW \033[1mAuto Cookie Optout\033[0m"
echo -e "$ARROW \033[1mForget Me Not\033[0m"

# yes, it really does it!
read -p $'Do you wish to continue? [y/n] \x0a' yn
case $yn in
    [Yy]* ) install;;
    [Nn]* ) exit 2;;
    * ) exit 2;;
esac
