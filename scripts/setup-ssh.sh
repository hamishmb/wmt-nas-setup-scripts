#!/bin/ash
# NAS box setup scripts.
# Copyright (C) 2017-2019 Wimborne Model Town
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

#FIXME: Currently not starting on boot for unknown reasons, but works when started manually after that.
#FIXME: Password authentication is currently not working - key-based only.
#FIXME: SSL certificates currently not working.
#NOTE: port 2222.
#NOTE: This still works even after the parent has exited.

echo "Setting up SSL certificates..."

rm -r /etc/ssl/certs
rm -r /usr/local/ssl

ln -s /mnt/HD/HD_a2/nas-sysroot/usr/local/ssl/certs /etc/ssl/certs
ln -s /mnt/HD/HD_a2/nas-sysroot/usr/local/ssl/ /mnt/HD/HD_a2/nas-sysroot/usr/ssl
ln -s /mnt/HD/HD_a2/nas-sysroot/usr/local/ssl/ /usr/ssl
ln -s /mnt/HD/HD_a2/nas-sysroot/usr/local/ssl/ /usr/local/ssl
ln -s /mnt/HD/HD_a2/nas-sysroot/usr/local/ssl/ /usr/lib/ssl

echo "Making /home/admin/.ssh and setting up authorised keys..."

mkdir -p /home/admin/.ssh
cp /mnt/HD/HD_a2/.ssh/authorized_keys /home/admin/.ssh
chmod 744 /home/admin/.ssh/authorized_keys

echo "Making SSH Tools available to SSHD..."

ln -s /mnt/HD/HD_a2/nas-sysroot/usr/local/libexec/sftp-server /usr/local/libexec/sftp-server
ln -s /mnt/HD/HD_a2/nas-sysroot/usr/local/libexec/ssh-keysign /usr/local/libexec/ssh-keysign
ln -s /mnt/HD/HD_a2/nas-sysroot/usr/local/libexec/ssh-pkcs11-helper /usr/local/libexec/ssh-pkcs11-helper

echo "Starting SSH server..."

/mnt/HD/HD_a2/nas-sysroot/usr/local/sbin/sshd 2>&1 > /mnt/HD/HD_a2/scripts/ssh.log
