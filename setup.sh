#!/bin/ash
#Don't do anything if the setup script has already run.
#if [[ -e /home/admin ]]; then
#    echo "Setup has already been run, nothing to do.";
#    exit 0;
#fi

mkdir -p /home/admin

#---------- CREATING HOME DIRECTORY AND CONFIG ----------
cat << "EOF" > /home/admin/.bashrc
#Set up PATH and LD_LIBRARY_PATH
export PATH="/mnt/HD/HD_a2/nas-sysroot/usr/local/bin:/mnt/HD/HD_a2/nas-sysroot/usr/local/sbin:$PATH"
export LD_LIBRARY_PATH="/mnt/HD/HD_a2/nas-sysroot/lib:/mnt/HD/HD_a2/nas-sysroot/usr/local/lib:$LD_LIBRARY_PATH"
EOF

cat << "EOF" > /home/admin/.profile
if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
fi
EOF

#---------- MAKE CUSTOM BINARIES AVAILABLE IN THIS SCRIPT ----------
. $HOME/.profile

#---------- MAKE MOST TOOLS AVAILABLE IN /usr/local/bin AS WELL ----------
ln -s /mnt/HD/HD_a2/nas-sysroot/usr/local/bin/ /usr/local/bin

#---------- SSH SETUP ----------
#FIXME: Password authentication is currently not working - key-based only.
#NOTE: port 2222.
#NOTE: This still works even after the parent has exited.

mkdir -p $HOME/.ssh
cp /mnt/HD/HD_a2/.ssh/authorized_keys $HOME/.ssh
chmod 744 $HOME/.ssh/authorized_keys

/mnt/HD/HD_a2/nas-sysroot/usr/local/sbin/sshd -p 2222 -f /mnt/HD/HD_a2/.ssh/ssh
d_config

#---------- GIT SETUP ----------
mkdir -p /usr/local/libexec

ln -s /mnt/HD/HD_a2/nas-sysroot/usr/local/share/git-core /usr/local/share/git-core
ln -s /mnt/HD/HD_a2/nas-sysroot/usr/local/share/git-gui /usr/local/share/git-gui
ln -s /mnt/HD/HD_a2/nas-sysroot/usr/local/share/gitk /usr/local/share/gitk
ln -s /mnt/HD/HD_a2/nas-sysroot/usr/local/share/gitweb /usr/local/share/gitweb
ln -s /mnt/HD/HD_a2/nas-sysroot/usr/local/libexec/git-core /usr/local/libexec/git-core

#FIXME SSL verification is not working, so disable it for the moment.
git config --global http.sslVerify true

#---------- MAKE FILE MAGIC AVAILABLE SO IT WORKS ----------
mkdir -p /usr/local/share/misc

ln -s /mnt/HD/HD_a2/nas-sysroot/usr/local/share/misc/magic.mgc /usr/local/share/misc/magic.mgc

