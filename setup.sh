#!/bin/ash
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
. $HOME/.profile

#---------- MAKE MOST TOOLS AVAILABLE IN /usr/local/bin AS WELL ----------
ln -s /mnt/HD/HD_a2/nas-sysroot/usr/local/bin/ /usr/local/bin

#---------- SSH SETUP ----------
echo "Creating home directory and scripts..." >> /mnt/HD/HD_a2/setup.log
ash /mnt/HD/HD_a2/scripts/setup-ssh.sh 2>&1 >> /mnt/HD/HD_a2/setup.log

#---------- GIT SETUP ----------
echo "Creating home directory and scripts..." >> /mnt/HD/HD_a2/setup.log
ash /mnt/HD/HD_a2/scripts/setup-ash.sh 2>&1 >> /mnt/HD/HD_a2/setup.log

#---------- FILE SETUP ----------
echo "Creating home directory and scripts..." >> /mnt/HD/HD_a2/setup.log
ash /mnt/HD/HD_a2/scripts/setup-nano.sh 2>&1 >> /mnt/HD/HD_a2/setup.log

