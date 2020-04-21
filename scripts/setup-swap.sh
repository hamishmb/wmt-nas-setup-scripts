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

#If it doesn't exist, create a 2GB swap file.
if [ ! -e /mnt/HD/HD_a2/swapfile.img ]; then
    echo "Creating 2 GB swapfile. This may take a few minutes..."
    dd if=/dev/zero of=/mnt/HD/HD_a2/swapfile.img bs=1M count=2000

    echo "Formatting swapfile..."
    mkswap /mnt/HD/HD_a2/swapfile.img
fi

echo "Enabling swapfile..."
swapon /mnt/HD/HD_a2/swapfile.img
