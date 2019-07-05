#!/bin/ash
echo "Deleting and Re-creating temporary directory..."

rm -rv /mnt/HD/HD_a2/.temp

mkdir /mnt/HD/HD_a2/.temp

echo "Making home directory..."

mkdir -p /home/admin

echo "Creating .bashrc..."

cat << "EOF" > /home/admin/.bashrc
#Set up PATH and LD_LIBRARY_PATH
export PATH="/mnt/HD/HD_a2/nas-sysroot/usr/local/bin:/mnt/HD/HD_a2/nas-sysroot/usr/local/sbin:$PATH"
export LD_LIBRARY_PATH="/mnt/HD/HD_a2/nas-sysroot/lib:/mnt/HD/HD_a2/nas-sysroot/usr/local/lib:$LD_LIBRARY_PATH"

#Set up TMPDIR
export TMPDIR=/mnt/HD/HD_a2/.temp
EOF

echo "Creating .profile..."

cat << "EOF" > /home/admin/.profile
if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
fi
EOF
