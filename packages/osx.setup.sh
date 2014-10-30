#!/bin/zsh
echo_title "Defining OS X options"

# Set wallpaper
#osascript -e "tell application \"System Events\" to set picture of every desktop to \"~/Dropbox/wallpapers/example.jpg\""

COMPUTER_NAME="$USER"
COMPUTER_MODEL=`sysctl -n hw.model`
if [[ $COMPUTER_MODEL == "iMac"* ]]
then
  COMPUTER_NAME="i$COMPUTER_NAME"
elif [[ $COMPUTER_MODEL == "MacBook"* ]]
then
  COMPUTER_NAME="Mac$COMPUTER_NAME"
fi
# notifying computer name update only if name will be changed
if [[ $COMPUTER_NAME != $(sudo scutil --get ComputerName) ]]
then
  echo_info "Computer name set to $COMPUTER_NAME"
fi
sudo scutil --set ComputerName $COMPUTER_NAME
sudo scutil --set HostName $COMPUTER_NAME
sudo scutil --set LocalHostName $COMPUTER_NAME
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string $COMPUTER_NAME

###
# SecAssessment system policy security
###
if type spctl  &> /dev/null
then
  # Allow apps downloaded from "Anywhere"
  sudo spctl --master-disable
fi

###
# pmset -a: for all (-b battery, -c charger)
###

if type pmset  &> /dev/null
then
  # Computer sleep: Never
  sudo pmset -a sleep 0

  # Display sleep: 10 min
  sudo pmset -a displaysleep 10

  # Wake for network access
  sudo pmset -a womp 1

  # Automatically reduce brightness before display goes to sleep
  sudo pmset -a halfdim 0

  # Start up automatically after a power failure
  sudo pmset -a autorestart 1

  # Never wake the machine if lib open or when power source changes
  sudo pmset -a lidwake 0
  sudo pmset -a acwake 0
fi

###
# Enable access for assistive devices
###
if ls /private/var/db/.AccessibilityAPIEnabled &> /dev/null
then
  # /usr/bin/osascript -e 'tell application "System Events" to set UI elements enabled to true'
  echo -n 'a' | sudo tee /private/var/db/.AccessibilityAPIEnabled > /dev/null 2>&1
  sudo chmod 444 /private/var/db/.AccessibilityAPIEnabled
fi

# Never require password after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 0

# Startup sound chime effect (disable: %00)
sudo nvram SystemAudioVolume=%10﻿

# Enable subpixel font rendering on non-Apple LCDs
defaults write NSGlobalDomain AppleFontSmoothing -int 2

# recovery_message 'If this Mac is found, please call +33 6 78 13 54 39 - Si vous trouvez ce Mac, merci d\'appeler le 06 78 13 54 39': }
# https://github.com/boxen/puppet-osx/blob/master/manifests/recovery_message.pp

# Always show scrollbars
defaults write NSGlobalDomain AppleShowScrollBars -string "WhenScrolling"
# Possible values: `WhenScrolling`, `Automatic` and `Always`

# disable auto correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# expand save dialog
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

# expand print dialog
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true

# no .DS_Store on newtwork
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# disk utility debug menu
defaults write com.apple.DiskUtility DUDebugMenuEnabled -bool true

# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Zoom: Options… > Use scroll wheel with modifier keys to zoom: ^ [control]
defaults write com.apple.universalaccess HIDScrollZoomModifierMask 262144

# Zoom: Options… > Disable zoom with cmd+scroll
defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool false

# Enable AirDrop over Ethernet and on unsupported Macs:
defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true

# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Set sidebar icon size to medium
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 2

# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Enable spring loading for directories
defaults write NSGlobalDomain com.apple.springing.enabled -bool true

# Remove the spring loading delay for directories
defaults write NSGlobalDomain com.apple.springing.delay -float 0

# Disable Dashboard
defaults write com.apple.dashboard mcx-disabled -bool true

# Reset Launchpad, but keep the desktop wallpaper intact
find "$HOME/Library/Application Support/Dock" -name "*-*.db" -maxdepth 1 -delete

# Only use UTF-8 in Terminal.app
defaults write com.apple.terminal StringEncodings -array 4

# Don’t automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

# Reset Launchpad
find ~/Library/Application\ Support/Dock -name "*.db" -maxdepth 1 -delete

# Dark mode
defaults write NSGlobalDomain AppleInterfaceStyle Dark

###
# Time Machine
###

# Prevent Time Machine from prompting to use new hard drives as backup volume
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

# Disable local Time Machine backups
hash tmutil &> /dev/null && sudo tmutil disablelocal

source $DOTFILES/packages/osx/preferences/ActivityMonitor
source $DOTFILES/packages/osx/preferences/Dock
source $DOTFILES/packages/osx/preferences/HotCorner
source $DOTFILES/packages/osx/preferences/Keyboard
source $DOTFILES/packages/osx/preferences/MenuBar
source $DOTFILES/packages/osx/preferences/Mouse
source $DOTFILES/packages/osx/preferences/Screencapture
source $DOTFILES/packages/osx/preferences/Spotlight

source $DOTFILES/packages/osx/preferences/apps/Finder.app
source $DOTFILES/packages/osx/preferences/apps/Mail.app
source $DOTFILES/packages/osx/preferences/apps/Safari.app
source $DOTFILES/packages/osx/preferences/apps/Calendar.app

# Kill affected applications
for app in "Address Book" "Calendar" "Contacts" "Messages"
do
  killa "${app}"
done

if [ "$FIRSTRUN" = "true" ]; then fuckosx; fi;


# Enable local FTP Server
# used for some stuff (local wordpress) & wii ftp access
sudo launchctl load -w /System/Library/LaunchDaemons/ftp.plist > /dev/null 2>&1
