#!/bin/ash
#FIXME: Password authentication is currently not working - key-based only.
#NOTE: port 2222.
#NOTE: This still works even after the parent has exited.

echo "Making $HOME/.ssh and setting up authorised keys..."

mkdir -p $HOME/.ssh
cp /mnt/HD/HD_a2/.ssh/authorized_keys $HOME/.ssh
chmod 744 $HOME/.ssh/authorized_keys

echo "Starting SSH server..."

/mnt/HD/HD_a2/nas-sysroot/usr/local/sbin/sshd -p 2222 -f /mnt/HD/HD_a2/.ssh/sshd_config
