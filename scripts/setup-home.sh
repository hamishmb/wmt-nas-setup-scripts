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

echo "Deleting and Re-creating temporary directory..."

rm -rv /mnt/HD/HD_a2/.temp

mkdir /mnt/HD/HD_a2/.temp

echo "Making home directory..."

mkdir -p /home/admin

echo "Creating .bashrc..."

cat << "EOF" > /home/admin/.bashrc
#Set up PATH and LD_LIBRARY_PATH
export PATH="/mnt/HD/HD_a2/nas-sysroot/usr/local/bin:/mnt/HD/HD_a2/nas-sysroot/usr/local/sbin:/usr/local/sbin:$PATH"
export LD_LIBRARY_PATH="/mnt/HD/HD_a2/nas-sysroot/lib:/mnt/HD/HD_a2/nas-sysroot/usr/local/lib:$LD_LIBRARY_PATH"

#Set up TMPDIR
export TMPDIR=/mnt/HD/HD_a2/.temp
EOF

echo "Creating .profile..."

cat << "EOF" > /home/admin/.profile
if [ -f "/home/admin/.bashrc" ]; then
    . "/home/admin/.bashrc"
fi
EOF
