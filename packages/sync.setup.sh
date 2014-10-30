#!/bin/zsh

##
# Synced folders
##
if ! ls $DIR_SYNC &> /dev/null
then
  mkdir $DIR_SYNC
  setfileicon $OS_ICONS_DIR/GroupFolder.icns $DIR_SYNC
fi

brewcaskinstall "BitTorrent Sync"
openifnot "BitTorrent Sync" "/Applications/BitTorrent Sync.app"
defaults write com.bittorrent.Sync shouldShowAlretOnFolderRemoval -bool true
defaults write com.bittorrent.Sync SUAutomaticallyUpdate -bool true
defaults write com.bittorrent.Sync SUEnableAutomaticChecks -bool true
defaults write com.bittorrent.Sync UserDidntAgreeWithLicense -bool false

if ls $DIR_SYNC_BTSYNC &> /dev/null
then
  setfileicon $OS_ICONS_DIR/UsersFolderIcon.icns $DIR_SYNC_BTSYNC

  if ls $DIR_SYNC_BTSYNC/Fonts &> /dev/null
  then
    sudo rm -rf $HOME/Library/Fonts
    ln -s $DIR_SYNC_BTSYNC/Fonts $HOME/Library/Fonts
  fi
fi

if ls $DIR_SYNC/Development &> /dev/null
then
  setfileicon $OS_ICONS_DIR/DeveloperFolderIcon.icns $DIR_SYNC/Development
fi

if ls $DIR_SYNC/Music &> /dev/null
then
  sudo rm -rf $HOME/Music
  ln -s $DIR_SYNC/Music $HOME/Music
  setfileicon $OS_ICONS_DIR/MusicFolderIcon.icns $HOME/Music

  sudo rm -rf $HOME/iTunes
  ln -s $HOME/Music $HOME/iTunes
fi

if ls $DIR_SYNC/Pictures &> /dev/null
then
  sudo rm -rf $HOME/Pictures
  ln -s $DIR_SYNC/Pictures $HOME/Pictures
  setfileicon $OS_ICONS_DIR/PicturesFolderIcon.icns $DIR_SYNC/Pictures
fi

brewcaskinstall "Dropbox"
openifnot "Dropbox" "/Applications/Dropbox.app"
