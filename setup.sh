#!/bin/ash
#NOTES:

#1. Don't use "$HOME" in this script. It points to "/" at this stage of the boot process. Instead refer directly to "/home/admin"

#Don't do anything if the setup script has already run.
if [[ -e /home/admin ]]; then
    echo "Setup has already been run, nothing to do.";
    exit 0;
fi

#Prepare script log file.
echo "" > /mnt/HD/HD_a2/setup.log

#---------- CREATING HOME DIRECTORY AND CONFIG ----------
echo "Creating home directory and config..." >> /mnt/HD/HD_a2/setup.log
ash /mnt/HD/HD_a2/scripts/setup-home.sh 2>&1 >> /mnt/HD/HD_a2/setup.log

#---------- MAKE CUSTOM BINARIES AVAILABLE IN THIS SCRIPT ----------
. /home/admin/.profile

#---------- MAKE MOST TOOLS AVAILABLE IN /usr/local/bin AS WELL ----------
ln -s /mnt/HD/HD_a2/nas-sysroot/usr/local/bin/ /usr/local/bin

#---------- SSH SETUP ----------
echo "Setting up SSH..." >> /mnt/HD/HD_a2/setup.log
ash /mnt/HD/HD_a2/scripts/setup-ssh.sh 2>&1 >> /mnt/HD/HD_a2/setup.log

#---------- GIT SETUP ----------
echo "Setting up GIT..." >> /mnt/HD/HD_a2/setup.log
ash /mnt/HD/HD_a2/scripts/setup-git.sh 2>&1 >> /mnt/HD/HD_a2/setup.log

#---------- FILE SETUP ----------
echo "Setting up file (the command)..." >> /mnt/HD/HD_a2/setup.log
ash /mnt/HD/HD_a2/scripts/setup-file.sh 2>&1 >> /mnt/HD/HD_a2/setup.log

