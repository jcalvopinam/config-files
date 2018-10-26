#!/bin/bash
# @author Juan Calvopina
# Script to copy only the new files to the destination

echo ":: Synchronizing new photos... please wait..."
cd ~/Pictures/
ditto Album/ /Volumes/Seagate\ Backup\ Plus\ Drive/Pictures/Album/

echo ":: Synchronizing chats... please wait..."
cd ~/OneDrive/personal/
ditto ._/ /Volumes/Seagate\ Backup\ Plus\ Drive/juanca/OneDrive/personal/._/

echo ":: Done!"