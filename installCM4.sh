#!/bin/bash

stop_all_running_services ()
{
	sudo service fbcp stop
	sudo systemctl stop fbcpOld.service
	sudo systemctl stop fbcpCropped.service
	sudo systemctl stop fbcpFilled.service
	sudo systemctl stop fbcpCM4Filled.service
	sudo systemctl stop fbcpBPCropped.service
	sudo systemctl stop fbcpCroppedNoSleep.service
	sudo systemctl stop fbcpFilledNoSleep.service
	sudo systemctl stop fbcpCM4FilledNoSleep.service
	sudo systemctl stop fbcpBPCroppedNoSleep.service
	sudo killall Freeplay-fbcp
	sudo killall fbcpOld
	sudo killall fbcpCropped
	sudo killall fbcpOldNoSleep
	sudo killall fbcpCroppedNoSleep
	sudo killall fbcpBPCropped
	sudo killall fbcpBPCroppedNoSleep
}

INSTALL_DIR=~/Freeplay/$( ls ~/Freeplay | grep -i freeplayili9341 )

git -C $INSTALL_DIR pull

stop_all_running_services

sudo cp $INSTALL_DIR/fbcpCM4Filled /usr/local/bin/fbcpCM4Filled
sudo cp $INSTALL_DIR/fbcpCM4FilledNoSleep /usr/local/bin/fbcpCM4FilledNoSleep

mkdir -p "/home/pi/RetroPie/retropiemenu/Freeplay Options"
cp $INSTALL_DIR/dispMenuCM4.sh "/home/pi/RetroPie/retropiemenu/Freeplay Options/dispMenu.sh"
cp $INSTALL_DIR/display.png /home/pi/RetroPie/retropiemenu/icons/display.png
sudo cp $INSTALL_DIR/fbcpCM4Filled.service /lib/systemd/system/fbcpCM4Filled.service
sudo cp $INSTALL_DIR/fbcpCM4FilledNoSleep.service /lib/systemd/system/fbcpCM4FilledNoSleep.service
sudo cp $INSTALL_DIR/fbcpOld.service /lib/systemd/system/fbcpOld.service

sudo systemctl disable fbcpCM4Filled.service
sudo systemctl disable fbcpCM4FilledNoSleep.service
sudo update-rc.d fbcp.sh disable
sudo rm -rf /etc/init.d/fbcp.sh

sudo systemctl enable fbcpOld.service
sudo systemctl start fbcpOld.service

sudo sed -i "s|^#dtoverlay=waveshare32b|#FP#dtoverlay=waveshare32b|" /boot/config.txt

if grep -q "Freeplay Change Display Driver" /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml ; then
	echo "Display Driver Menu Item Already Added"
else
	sudo sed -i 's|</gameList>|\t<game>\n\t\t<path>./Freeplay Options/dispMenu.sh</path>\n\t\t<name>Freeplay Change Display Driver</name>\n\t\t<desc>Choose which display driver to use, between two versions of the experimental driver and the default driver</desc>\n\t\t<image>./icons/display.png</image>\n\t\t<playcount>0</playcount>\n\t\t<lastplayed>20180514T205700</lastplayed>\n\t</game>\n</gameList>|' /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml
fi
