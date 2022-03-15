# Enzo VICTORIN's environment installer

Here is the script I use to configure a new Apple computer with all my development tools.

# What does it do?
It installs and configures:
 - Apple's Command Line Tools
 - [Homebrew](https://brew.sh/)
 - [Oh My ZSH](https://ohmyz.sh/)
    - Theme: [PowerLevel10k](https://github.com/romkatv/powerlevel10k)
    - Plugins: [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) and [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting.git)
 - ~/.vimrc
 - [iTerm2](https://iterm2.com/)
 - [Cocoapods](https://cocoapods.org/)
 - [Xcodes](https://github.com/RobotsAndPencils/XcodesApp)
 - [VSCodium](https://vscodium.com/)
 - [Firefox](https://www.mozilla.org/fr/firefox/new//)
    - With:
        - [uBlock Origin](https://github.com/gorhill/uBlock#ublock-origin)
        - [Medium Unlimited](https://addons.mozilla.org/en-US/firefox/addon/medium-unlimited-read-for-free/)
        - [SponsorBlock](https://sponsor.ajay.app/)
        - [1Password](https://1password.com)
        - [Dark Reader](https://darkreader.org/)
        - [Honey](https://www.joinhoney.com/fr/explore)
        - [Return Youtube Dislikes](https://returnyoutubedislike.com/)
        - [My user.js](./browser/user.js)
  - [Thunderbird](https://www.thunderbird.net/fr/)

The scripts to install `Homebrew` and `Oh My ZSH` are located in [./installers](./installers). They were downloaded from their respective websites.
The browser extensions are located in [./browser](./LibreWolfExtensions). Remember to update them!

The script will always ask your permission before doing anything.

# Usage

```bash
$ chmod +x ./install.sh
$ ./install.sh
```

## Browser extensions
After running this script, Firefox will not load the extensions. Go to the settings menu of Firefox to fix it.

# License
This script is licensed under [GNU GPLv3](./LICENSE).

This script comes with **ABSOLUTELY NO WARRANTY**.
This is free software, and you are welcome to redistribute it
under certain conditions; see [./LICENSE](./LICENSE).