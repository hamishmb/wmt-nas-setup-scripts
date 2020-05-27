#!/bin/ash
# NAS box setup scripts.
# Copyright (C) 2019-2020 Wimborne Model Town
# This program is free software: you can redistribute it and/or modify it
# under the terms of the GNU General Public License version 3 or,
# at your option, any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

#Version: 1.0~pre2

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

#---------- XINETD (TIME SERVER) SETUP ----------
echo "Setting up xinted..." >> /mnt/HD/HD_a2/setup.log
ash /mnt/HD/HD_a2/scripts/setup-xinetd.sh 2>&1 >> /mnt/HD/HD_a2/setup.log

#---------- PYTHON SETUP ----------
echo "Setting up Python..." >> /mnt/HD/HD_a2/setup.log
ash /mnt/HD/HD_a2/scripts/setup-python.sh 2>&1 >> /mnt/HD/HD_a2/setup.log

#---------- FILE SETUP ----------
echo "Setting up file (the command)..." >> /mnt/HD/HD_a2/setup.log
ash /mnt/HD/HD_a2/scripts/setup-file.sh 2>&1 >> /mnt/HD/HD_a2/setup.log

#---------- ENGINEER GUI SETUP ----------
echo "Setting up the engineer GUI..." >> /mnt/HD/HD/a2/setup.log
ash /mnt/HD/HD_a2/scripts/setup-enggui.sh 2>&1 >> /mnt/HD/HD_a2/setup.log

#---------- SWAP SETUP ----------
echo "Setting up swap file..." >> /mnt/HD/HD_a2/setup.log
ash /mnt/HD/HD_a2/scripts/setup-swap.sh 2>&1 >> /mnt/HD/HD_a2/setup.log

#---------- CLEAN SHUTDOWN/REBOOT SCRIPT ----------
echo "Setting up clean shutdown/reboot script..." >> /mnt/HD/HD_a2/setup.log
ash /mnt/HD/HD_a2/scripts/setup-shutdown.sh 2>&1 >> /mnt/HD/HD_a2/setup.log
