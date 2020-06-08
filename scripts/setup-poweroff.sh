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

echo "Creating custom shutdown script..."

echo "#!/bin/ash
swapoff /mnt/HD/HD_a2/swapfile.img
echo 'When you are logged out, wait two minutes and then remove the power'
sync; sync; sync;
poweroff" > /mnt/HD/HD_a2/shutdown.sh

chmod a+x /mnt/HD/HD_a2/shutdown.sh
ln -s /mnt/HD/HD_a2/shutdown.sh /home/admin/shutdown.sh

echo "Creating custom reboot script..."

echo "#!/bin/ash
swapoff /mnt/HD/HD_a2/swapfile.img
sync; sync; sync;
reboot" > /mnt/HD/HD_a2/reboot.sh

chmod a+x /mnt/HD/HD_a2/reboot.sh
ln -s /mnt/HD/HD_a2/reboot.sh /home/admin/reboot.sh

echo "Done!"
