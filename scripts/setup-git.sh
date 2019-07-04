#!/bin/ash
echo "Creating /usr/local/libexec..."
mkdir -p /usr/local/libexec

echo "Linking GIT executables and configuration so they can be used..."
ln -s /mnt/HD/HD_a2/nas-sysroot/usr/local/share/git-core /usr/local/share/git-core
ln -s /mnt/HD/HD_a2/nas-sysroot/usr/local/share/git-gui /usr/local/share/git-gui
ln -s /mnt/HD/HD_a2/nas-sysroot/usr/local/share/gitk /usr/local/share/gitk
ln -s /mnt/HD/HD_a2/nas-sysroot/usr/local/share/gitweb /usr/local/share/gitweb
ln -s /mnt/HD/HD_a2/nas-sysroot/usr/local/libexec/git-core /usr/local/libexec/git-core

#FIXME SSL verification is not working, so disable it for the moment.
echo "Disabling SSL verification (currently broken)..."
git config --global http.sslVerify false
