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

echo "Remounting"

#Remount the RAID array with non-stupid options for better reliability.
mount -t ext4 -o remount,rw,noatime,nodiratime,commit=5,barrier=1,usrquota,grpquota /dev/md1 /mnt/HD/HD_a2

echo "Done, mount output:"
echo ""

mount

echo ""
