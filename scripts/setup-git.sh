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

#---------- MAKE CUSTOM BINARIES AVAILABLE IN THIS SCRIPT ----------
. /home/admin/.profile

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
ln -s /mnt/HD/HD_a2/.gitconfig /home/admin/.gitconfig
