#!/bin/bash
# @author Juan Calvopina
# Script to swith the theme in macOS Mojave and also to applications such as:
# SublimeText, Terminal, to be continue...

# Application path
SRC_PATH=~/codespace/config-files/mac/scripts/.theme-settings
SUBLIME_PATH=~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/
INTELLIJ_PATH=~/Library/Preferences/IntelliJIdea2018.2/options/

# It checks if IntelliJ is opened
if [ -e ~/Library/Preferences/IntelliJIdea2018.2/port ]; then
    echo ":: [ERROR] It is not possible to update the IntelliJ theme because it is currently open! Please switch from the IDE."
fi

# It checks what is the current theme
CURRENT_THEME="$(defaults read -g AppleInterfaceStyle)"

if [[ $CURRENT_THEME == "Dark" ]]; then
    echo ":: [OK] Switching to Light theme!"
    cp "$SRC_PATH"/sublime/light/Preferences.sublime-settings "$SUBLIME_PATH"
    rm -f "$INTELLIJ_PATH"/colors.scheme.xml
    cp "$SRC_PATH"/intellij/light/laf.xml "$INTELLIJ_PATH"
    osascript -e "tell application \"Terminal\" to set current settings of first window to settings set \"LambdaWhite\""
else
    echo ":: [OK] Switching to Dark theme!"
    cp ~/codespace/config-files/mac/scripts/.theme-settings/sublime/dark/Preferences.sublime-settings "$SUBLIME_PATH"
    cp "$SRC_PATH"/intellij/dark/colors.scheme.xml "$INTELLIJ_PATH"
    cp "$SRC_PATH"/intellij/dark/laf.xml "$INTELLIJ_PATH"
    osascript -e "tell application \"Terminal\" to set current settings of first window to settings set \"LambdaDark\""
fi
osascript -e "tell application \"System Events\" to tell appearance preferences to set dark mode to not dark mode"

rm -f "$INTELLIJ_PATH"/options/usage.statistics.xml

echo ":: [OK] Done!"