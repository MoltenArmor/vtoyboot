#!/bin/sh
#************************************************************************************
# Copyright (c) 2020, longpanda <admin@ventoy.net>
# 
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License as
# published by the Free Software Foundation; either version 3 of the
# License, or (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program; if not, see <http://www.gnu.org/licenses/>.
# 
#************************************************************************************

if [ -e /lib/dracut/dracut-install ]; then
    vtmodpath=/lib/dracut/modules.d/99ventoy
else
    vtmodpath=/usr/lib/dracut/modules.d/99ventoy
fi

rm -f /bin/vtoydump /bin/vtoypartx
rm -rf $vtmodpath
mkdir -p $vtmodpath

cp -a $vtdumpcmd /bin/vtoydump
cp -a $partxcmd /bin/vtoypartx
cp -a ./distros/$os/module-setup.sh $vtmodpath/
cp -a ./distros/$os/ventoy-settled.sh $vtmodpath/


echo "updating the initramfs, please wait ..."
extdrivers='usb-storage'
dracut -f --force-drivers "$extdrivers" --add "ventoy"

    

