#!/usr/bin/env bash

INPUT=/tmp/dialogInstall.sh.$$

dialog --clear --title "Freeplay Display Driver Install" \
	--menu "Select your Freeplay model:" 0 0 0 \
	CM3 "Tested and fairly stable" \
	CM4 "Freeplay CM3 with a CM4S or CM4 and adapter" \
	Zero "Not recommended, poor emulator compatibility" \
	Exit "Exit without installation" 2> "${INPUT}"

MENUITEM=$(<"${INPUT}")

case "$MENUITEM" in
	CM3) ./installCM3.sh;;
	CM4) ./installCM4.sh;;
	Zero) ./installZero.sh;;
	Exit) dialog --title "Freeplay Display Driver Install" --infobox "No driver selected.\nExiting installation" 5 30 ; sleep 2;;
esac

[ -f "$INPUT" ] && rm "$INPUT"

exit 0
