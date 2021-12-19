# Enzo VICTORIN's environment installer

Here is the script I use to configure a new Apple computer with all my development tools.

# What does it do?
It installs and configures:
 - Apple's Command Line Tools
 - [Homebrew](https://brew.sh/)
 - [Oh My ZSH](https://ohmyz.sh/)
    - Theme: [PowerLevel10k](https://github.com/romkatv/powerlevel10k)
    - Plugins: [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) and [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting.git)
 - [Cocoapods](https://cocoapods.org/)
 - [Xcodes](https://github.com/RobotsAndPencils/XcodesApp)
 - [VSCodium](https://vscodium.com/)
 - [LibreWolf](https://librewolf.net/)
    - With:
        - [uBlock Origin](https://github.com/gorhill/uBlock#ublock-origin)
        - [Medium Unlimited](https://addons.mozilla.org/en-US/firefox/addon/medium-unlimited-read-for-free/)
        - [Firefox multi-account container](https://addons.mozilla.org/en-US/firefox/addon/multi-account-containers/?utm_source=addons.mozilla.org&utm_medium=referral&utm_content=homepage-primary-hero)
        - [Dashlane](https://www.dashlane.com/)
        - [SponsorBlock](https://sponsor.ajay.app/)
        - [Forget Me Not](https://addons.mozilla.org/en-US/firefox/addon/forget_me_not/?utm_source=addons.mozilla.org&utm_medium=referral&utm_content=search)

The scripts to install `Homebrew` and `Oh My ZSH` are located in [./installers](./installers). They were downloaded from their respective websites.
The browser extensions are located in [./LibreWolfExtensions](./LibreWolfExtensions). Remember to update them!

The script will always ask your permission before doing anything.

# Usage

```bash
$ chmod +x ./install.sh
$ ./install.sh
```

## Browser extensions
After running this script, LibreWolf will not load the extensions. Go to the settings menu of LibreWolf to fix it.

# License
This script is licensed under [GNU GPLv3](./LICENSE).

This script comes with **ABSOLUTELY NO WARRANTY**.
This is free software, and you are welcome to redistribute it
under certain conditions; see [./LICENSE](./LICENSE).