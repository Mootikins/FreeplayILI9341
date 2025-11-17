#!/bin/bash

sudo service fbcpFilled stop
sudo service fbcpCropped stop
sudo service fbcpZero stop
sudo service fbcpZeroNoDMA stop
sudo service fbcpCM4Filled stop
sudo service fbcpCM4FilledNoSleep stop

sudo killall fbcpFilled
sudo killall fbcpCropped
sudo killall fbcpZero
sudo killall fbcpZeroNoDMA
sudo killall fbcpCM4Filled
sudo killall fbcpCM4FilledNoSleep

sudo update-rc.d fbcpFilled.sh disable
sudo update-rc.d fbcpCropped.sh disable
sudo update-rc.d fbcp.sh enable

sudo systemctl disable fbcpFilled
sudo systemctl disable fbcpCropped
sudo systemctl disable fbcpZero
sudo systemctl disable fbcpZeroNoDMA
sudo systemctl disable fbcpCM4Filled
sudo systemctl disable fbcpCM4FilledNoSleep

sudo rm -f /usr/local/bin/fbcpFilled
sudo rm -f /usr/local/bin/fbcpCropped
sudo rm -f /usr/local/bin/fbcpZero
sudo rm -f /usr/local/bin/fbcpZeroNoDMA
sudo rm -f /usr/local/bin/fbcpCM4Filled
sudo rm -f /usr/local/bin/fbcpCM4FilledNoSleep

sudo rm -f /home/pi/RetroPie/retropiemenu/dispMenu.sh
sudo rm -f /home/pi/RetroPie/retropiemenu/dispCM4Menu.sh
sudo rm -f /home/pi/RetroPie/retropiemenu/icons/display.png
sudo rm -f /etc/init.d/fbcpCropped.sh
sudo rm -f /etc/init.d/fbcpFilled.sh
sudo rm -f /etc/init.d/fbcpZero.sh

sudo service fbcp start
