#!/bin/bash
#Use under your responsibility. This script delete the following files: "*.url", ".DS_Store", in the current directory and in their subfolders

echo "Please, wait until the script finishes cleaning..."
currentPath=${PWD}/
find "$currentPath" -name "*.url" -depth -type f -delete
find "$currentPath" -name ".DS_Store" -depth -type f -delete
find "$currentPath" -name "Informaci*.txt" -depth -type f -delete
echo "...The files were deleted!"

rm -rf /Volumes/Stonehall/juanca/Library/LaunchAgents/com.google.*
rm -rf /Volumes/Stonehall/juanca/Library/LaunchAgents/com.spotify.webhelper.plist

exit;