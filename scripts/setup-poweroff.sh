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

#The script that starts this file can be a bit flaky - put it in two different places to make sure it works.
echo "Creating custom shutdown script..."

echo "#!/bin/ash
swapoff /mnt/HD/HD_a2/swapfile.img" > /usr/local/sbin/custom_shutdown.sh

echo "#!/bin/ash
swapoff /mnt/HD/HD_a2/swapfile.img" > /usr/local/bin/custom_shutdown.sh

chmod a+x /usr/local/sbin/custom_shutdown.sh
chmod a+x /usr/local/bin/custom_shutdown.sh

echo "Done!"
