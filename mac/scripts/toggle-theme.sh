#!/bin/bash
# @author Juan Calvopina
# Script to swith the theme in macOS Mojave and also to applications such as:
# SublimeText, Terminal, to be continue...

# Application path
SUBLIME_PATH=~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/

# It checks what is the current theme
CURRENT_THEME="$(defaults read -g AppleInterfaceStyle)"

if [[ $CURRENT_THEME == "Dark" ]]; then
    echo ":: Switching to Light theme!"
    cp ./.theme-settings/sublime/light/Preferences.sublime-settings "$SUBLIME_PATH"
    osascript -e "tell application \"Terminal\" to set current settings of first window to settings set \"LambdaWhite\""
else
    echo ":: Switching to Dark theme!"
    cp ./.theme-settings/sublime/dark/Preferences.sublime-settings "$SUBLIME_PATH"
    osascript -e "tell application \"Terminal\" to set current settings of first window to settings set \"LambdaDark\""
fi
osascript -e "tell application \"System Events\" to tell appearance preferences to set dark mode to not dark mode"
echo ":: Done!"