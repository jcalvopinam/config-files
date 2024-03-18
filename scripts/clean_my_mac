#!/bin/bash
SECONDS=0

#Check if running as root and if not elevate
amiroot=$(sudo -n uptime 2>&1| grep -c "load")
if [ "$amiroot" -eq 0 ]
then
    echo "Maid Service Require Root Access. Please Enter Your Password."
    sudo -v
fi

#You can add apps by space like (JetBrains ExampleApp1 ExampleApp2)
guardedApps=(JetBrains)

for guardedApp in "${guardedApps[@]}"; do
    guardedAppsString+="! -name '$guardedApp' "
done

#user and system cache & log locations
guardedLocations=("~/Library/Caches" "~/Library/logs" "/Library/Caches" "/Library/logs")
for guardedLocation in "${guardedLocations[@]}"; do
    eval "find ${guardedLocation} -mindepth 1 -maxdepth 1 ${guardedAppsString}-exec rm -rf {} + >/dev/null 2>&1"
done

#system logs
echo "Cleaning system logs"
sudo rm -rf /private/var/log/*  > /dev/null 2>&1
sudo rm -rf /Library/Logs/DiagnosticReports/* > /dev/null 2>&1
sudo rm -rf /var/log/* > /dev/null 2>&1

echo "Deleting the quicklook files."
sudo rm -rf /private/var/folders/ > /dev/null 2>&1

#application caches
echo "Cleaning application caches"
for x in $(ls ~/Library/Containers/) 
do 
    rm -rf ~/Library/Containers/$x/Data/Library/Caches/* > /dev/null 2>&1
done

#Taking out the trash.
echo "Emptying the trash."
sudo rm -rfv /Volumes/*/.Trashes > /dev/null 2>&1
sudo rm -rfv ~/.Trash  > /dev/null 2>&1

#Cleaning Up Homebrew.
echo "Cleaning up Homebrew."
brew cleanup --force -s > /dev/null 2>&1
brew cask cleanup > /dev/null 2>&1
rm -rfv /Library/Caches/Homebrew/* > /dev/null 2>&1
brew tap --repair > /dev/null 2>&1
brew update > /dev/null 2>&1
brew upgrade > /dev/null 2>&1

#Purging Memory.
echo "Purging memory."
sudo purge > /dev/null 2>&1

#Finishing Up.
timed="$((SECONDS / 3600)) Hours $(((SECONDS / 60) % 60)) Minutes $((SECONDS % 60)) seconds"

echo "Maid Service Took %s this time. Dont Forget To Tip!" "$timed"
