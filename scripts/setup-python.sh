#!/bin/ash
#TODO currently doesn't fix pip, more investigation required.
echo "Creating links from /mnt/HD/HD_a2/nas-sysroot/usr/local/lib/python3.7 to /usr/local/lib/python3.7 and /usr/lib/python3.7..."
ln -s /mnt/HD/HD_a2/nas-sysroot/usr/local/lib/python3.7 /usr/local/lib/python3.7
ln -s /mnt/HD/HD_a2/nas-sysroot/usr/local/lib/python3.7 /usr/lib/python3.7
