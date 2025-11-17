#!/usr/bin/env bash

#Copied from the dispMenuCM3.sh script and removed all selections except CM4 specific ones.
#Most of new menu taken from https://askubuntu.com/questions/901247/bash-dialog-menu-leaves-menu

stop_all_running_services ()
{
	sudo service fbcp stop
	sudo systemctl stop fbcpOld.service
	sudo systemctl stop fbcpCropped.service
	sudo systemctl stop fbcpFilled.service
	sudo systemctl stop fbcpCroppedNoSleep.service
	sudo systemctl stop fbcpFilledNoSleep.service
	sudo systemctl stop fbcpBPCroppedNoSleep.service
	sudo systemctl stop fbcpBPCropped.service
    sudo systemctl stop fbcpCM4Filled.service
    sudo systemctl stop fbcpCM4FilledNoSleep.service
	sudo killall Freeplay-fbcp
	sudo killall fbcpOld
	sudo killall fbcpCropped
	sudo killall fbcpOldNoSleep
	sudo killall fbcpCroppedNoSleep
    sudo killall fbcpCM4Filled
    sudo killall fbcpCM4FilledNoSleep
}

disable_all_services ()
{
	sudo update-rc.d fbcp.sh disable
	sudo systemctl disable fbcpOld.service
	sudo systemctl disable fbcpCropped.service
	sudo systemctl disable fbcpFilled.service
	sudo systemctl disable fbcpCroppedNoSleep.service
	sudo systemctl disable fbcpFilledNoSleep.service
	sudo systemctl disable fbcpBPCroppedNoSleep.service
	sudo systemctl disable fbcpBPCropped.service
    sudo systemctl disable fbcpCM4Filled.service
    sudo systemctl disable fbcpCM4FilledNoSleep.service
}

update ()
{
	git -C /home/pi/Freeplay/FreeplayILI9341 pull

	stop_all_running_services

	/home/pi/Freeplay/FreeplayILI9341/installCM4.sh

	dialog --clear --title "Update"
}

use_dev_filled ()
{
	sudo sed -i "s|^dtoverlay=waveshare32b|#FP#dtoverlay=waveshare32b|" /boot/config.txt

		stop_all_running_services

	sleep 1

	disable_all_services

	sleep 1
	sudo systemctl enable fbcpCM4Filled.service
	sudo reboot
}

use_dev_filled_nosleep ()
{
	sudo sed -i "s|^dtoverlay=waveshare32b|#FP#dtoverlay=waveshare32b|" /boot/config.txt

		stop_all_running_services

	sleep 1

	disable_all_services
	sudo systemctl enable fbcpCM4FilledNoSleep.service

	sleep 1
	sudo reboot
}

use_std ()
{
	sudo sed -i 's|^#FP#dtoverlay=waveshare32b|dtoverlay=waveshare32b|' /boot/config.txt

	stop_all_running_services

	sleep 1

	disable_all_services
	sudo systemctl enable fbcpOld.service

	sleep 1
	sudo reboot
}

OPTIONS=(Stable "Stable, low framerate"
FastFilled "Fills the entire display"
FastNoSleepFilled "Fills, no sleep"
Update "Update binaries and Menu"
Exit "Exit without any changes")

CMD=(dialog --clear --title "LCD Driver Selection" --menu "Choose which LCD Driver you would like to use" 15 50 15)

while true; do
	choices=$("${CMD[@]}" "${OPTIONS[@]}" 2>&1 >/dev/tty)

#If cancelled, drop the dialog
if [ $? -ne 0  ]; then
	clear;
	exit;
fi;

for choice in $choices; do
	case "$choice" in
		Stable)
			dialog --title "Stable Driver Description" --yesno "The stable driver is more thoroughly tested, but is less efficient and may have more frame drops. It also has customizable cropping by editing /boot/freeplayfbcp.cfg. Would you like to enable it?" 15 60
			RESP=$?
			case $RESP in
				0) dialog --title "Stable Driver Selection" --infobox "Switching to Stable driver. System will turn off" 5 60;use_std;;
				1) dialog --title "Stable Driver Selection" --infobox "NOT switching to Stable driver." 5 60;;
				255) dialog --title "Stable Driver Selection" --infobox "Returning to main menu" 5 60;;
			esac
			;;
		FastFilled)
			dialog --title "Fast Filled Driver Description" --yesno "The Fast Filled driver is blazingly fast with rare incompatibility and fills the display on large screen shells like the BoxyPixel; it also has sleep enabled for battery saving, which may cause low framerates after periods of inactivity. Would you like to enable it?" 15 60
			RESP=$?
			case $RESP in
				0) dialog --title "Fast Filled Driver Selection" --infobox "Switching to Fast Filled driver. System will turn off" 5 60; use_dev_filled;;
				1) dialog --title "Fast Filled Driver Selection" --infobox "NOT switching to Fast Filled driver." 5 60;;
				255) dialog --title "Fast Filled Driver Selection" --infobox "Returning to main menu" 5 60;;
			esac
			;;
		FastNoSleepFilled)
			dialog --title "Fast No Sleep Filled Driver Description" --yesno "The Fast No Sleep Filled driver is blazingly fast with rare incompatibility and fills the display on large screen shells like the BoxyPixel; it also has sleep disabled which prevents framerate drops after periods of inactivity, but may reduce battery life. Would you like to enable it?" 15 60
			RESP=$?
			case $RESP in
				0) dialog --title "Fast No Sleep Filled Driver Selection" --infobox "Switching to Fast No Sleep Filled driver. System will turn off" 5 60; use_dev_filled_nosleep;;
				1) dialog --title "Fast No Sleep Filled Driver Selection" --infobox "NOT switching to Fast No Sleep Filled driver." 5 60;;
				255) dialog --title "Fast No Sleep Filled Driver Selection" --infobox "Returning to main menu" 5 60;;
			esac
			;;
		Update)
			dialog --title "Update Display Drivers" --yesno "Updating your drivers and menu items may take some time and requires an internet connection. Would you like to continue?" 15 60
			RESP=$?
			case $RESP in
				0) dialog --title "Update Display Drivers" --infobox "Updating Display Drivers" 5 60; update;;
				1) dialog --title "Update Display Drivers" --infobox "NOT Updating Display Drivers" 5 60;;
				255) dialog --title "Update Display Drivers" --infobox "Returning to main menu" 5 60;;
			esac
			;;
		Exit)
			dialog --title "Exiting Display Driver Dialogs" --infobox "Returning to RetroPie Menu" 15 60; sleep 2;
			exit
			;;
	esac
done
done
