#!/usr/bin/env bash

echo "Setting Preferences"

# Desktop & Dock
defaults write com.apple.dock autohide -bool true      # Automatically hide and show the Dock
defaults write com.apple.dock show-recents -bool false # Show suggested and recent apps in Dock
defaults write com.apple.dock launchanim -bool false   # Animate opening applicaitons
defaults write com.apple.dock mineffect -string scale  # Minimize window using (scale or genie)
defaults write com.apple.dock tilesize -int 50         # Dock size
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.WindowManager EnableTiledWindowMargins -bool false # Tiled window have margins
killall Dock

# Finder
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder FXRemoveOldTrashItems -bool true # Empty trash after 30 days
defaults write com.apple.finder NewWindowTarget -string PfHm     # New Finder windows show
killall Finder

# Battery
sudo pmset -b lowpowermode 1  # Low Power Mode (Only on Battery)
sudo pmset -a displaysleep 10 # Display sleeps after # minutes of no use

# Appearance
defaults write NSGlobalDomain AppleScrollerPagingBehavior -bool true # Click in the scrollbar to (Jump to the spot that's clicked)

# Sound
defaults write -g com.apple.sound.uiaudio.enabled -int 0 # Play user interface sound effects
sudo nvram StartupMute=%01                               # Play sound on startup (off)

killall SystemUIServer

# Wallpaper & Screensaver
osascript -e 'tell application "System Events" to set picture of every desktop to "~/Pictures/wallpaper/mac/panigale_v4r_2(mbp14).jpg"'

defaults write com.apple.screensaver moduleDict -dict moduleName "PhotoLibrary" path "$HOME/Pictures/wallpaper/mac/screensaver" type 0

# Setting hostname
sudo scutil --set HostName rmbp
sudo scutil --set LocalHostName rmbp
sudo scutil --set ComputerName rmbp

dscacheutil -flushcache
