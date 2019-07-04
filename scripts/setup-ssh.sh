#!/bin/ash
#FIXME: Currently not starting on boot for unknown reasons, but works when started manually after that.
#FIXME: Password authentication is currently not working - key-based only.
#NOTE: port 2222.
#NOTE: This still works even after the parent has exited.

echo "Making /home/admin/.ssh and setting up authorised keys..."

mkdir -p /home/admin/.ssh
cp /mnt/HD/HD_a2/.ssh/authorized_keys /home/admin/.ssh
chmod 744 /home/admin/.ssh/authorized_keys

echo "Starting SSH server..."

/mnt/HD/HD_a2/nas-sysroot/usr/local/sbin/sshd -p 2222 -f /mnt/HD/HD_a2/.ssh/sshd_config 2>&1 > /mnt/HD/HD_a2/scripts/ssh.log
