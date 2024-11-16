# FreeplayILI9341
This repository contains compiled binaries from https://github.com/juj/fbcp-ili9341/

## fbcpCropped
by default freeplaytech_waveshare32b.h has these parameters
#define DISPLAY_NATIVE_COVERED_TOP_SIDE 18
#define DISPLAY_NATIVE_COVERED_LEFT_SIDE 9
#define DISPLAY_NATIVE_COVERED_RIGHT_SIDE 29
#define DISPLAY_NATIVE_COVERED_BOTTOM_SIDE 0

note: SPI_BUS_CLOCK_DIVISOR of 6 works best with the regular clock of 400 from the CM3 and CM3+. Can be used with a CM4 or CM4S, however requires underclocking via core_freq=400 option in /boot/config.txt.
cmake -DARMV8A=ON -DFREEPLAYTECH_WAVESHARE32B=ON -DSPI_BUS_CLOCK_DIVISOR=6 -DDISPLAY_BREAK_ASPECT_RATIO_WHEN_SCALING=ON -DUSE_DMA_TRANSFERS=ON -DBACKLIGHT_CONTROL=ON -DGPIO_TFT_BACKLIGHT=31 -DSTATISTICS=0 ..

## fbcpCroppedNoSleep
by default freeplaytech_waveshare32b.h has these parameters
#define DISPLAY_NATIVE_COVERED_TOP_SIDE 18
#define DISPLAY_NATIVE_COVERED_LEFT_SIDE 9
#define DISPLAY_NATIVE_COVERED_RIGHT_SIDE 29
#define DISPLAY_NATIVE_COVERED_BOTTOM_SIDE 0

note: SPI_BUS_CLOCK_DIVISOR of 6 works best with the regular clock of 400 from the CM3 and CM3+. Can be used with a CM4 or CM4S, however requires underclocking via core_freq=400 option in /boot/config.txt.
cmake -DARMV8A=ON -DFREEPLAYTECH_WAVESHARE32B=ON -DSPI_BUS_CLOCK_DIVISOR=6 -DDISPLAY_BREAK_ASPECT_RATIO_WHEN_SCALING=ON -DUSE_DMA_TRANSFERS=ON -DBACKLIGHT_CONTROL=ON -DGPIO_TFT_BACKLIGHT=31 -DSTATISTICS=0 ..

Edit to config.h commenting with a '//' at beginning of the line for these Defines:
SAVE_BATTERY_BY_PREDICTING_FRAME_ARRIVAL_TIMES
DISPLAY_FLIP_ORIENTATION_IN_SOFTWARE
SAVE_BATTERY_BY_SLEEPING_WHEN_IDLE

## fbcpBPCropped
Not exactly sure about the changes to the size of the 

## fbcpBPCroppedNoSleep
## fbcpFilled
## fbcpFilledNoSleep

## fbcpCM4Filled
Edit to freeplaytech_waveshare32b.h setting all borders to 0
#define DISPLAY_NATIVE_COVERED_TOP_SIDE 0
#define DISPLAY_NATIVE_COVERED_LEFT_SIDE 0
#define DISPLAY_NATIVE_COVERED_RIGHT_SIDE 0
#define DISPLAY_NATIVE_COVERED_BOTTOM_SIDE 0

compiled with these parameters
note: SPI_BUS_CLOCK_DIVISOR of 8 works best with the regular clock of 500 from the CM4 and CM4S
cmake -DARMV8A=ON -DFREEPLAYTECH_WAVESHARE32B=ON -DSPI_BUS_CLOCK_DIVISOR=8 -DDISPLAY_BREAK_ASPECT_RATIO_WHEN_SCALING=ON -DUSE_DMA_TRANSFERS=ON -DBACKLIGHT_CONTROL=ON -DGPIO_TFT_BACKLIGHT=31 -DSTATISTICS=0 ..

## fbcpCM4FilledNoSleep
Edit to freeplaytech_waveshare32b.h setting all borders to 0
DISPLAY_NATIVE_COVERED_TOP_SIDE is left border of the screen
DISPLAY_NATIVE_COVERED_LEFT_SIDE is top border of the screen
DISPLAY_NATIVE_COVERED_RIGHT_SIDE is bottom border of the screen
DISPLAY_NATIVE_COVERED_BOTTOM_SIDE is right border of the screen

Edit to config.h commenting with a '//' at beginning of the line for these Defines:
SAVE_BATTERY_BY_PREDICTING_FRAME_ARRIVAL_TIMES
DISPLAY_FLIP_ORIENTATION_IN_SOFTWARE
SAVE_BATTERY_BY_SLEEPING_WHEN_IDLE

compiled with these parameters
note: SPI_BUS_CLOCK_DIVISOR of 8 works best with the regular clock of 500 from the CM4 and CM4S
cmake -DARMV8A=ON -DFREEPLAYTECH_WAVESHARE32B=ON -DSPI_BUS_CLOCK_DIVISOR=8 -DDISPLAY_BREAK_ASPECT_RATIO_WHEN_SCALING=ON -DUSE_DMA_TRANSFERS=ON -DBACKLIGHT_CONTROL=ON -DGPIO_TFT_BACKLIGHT=31 -DSTATISTICS=0 ..

## fbcpZero
## fbcpZeroNoDMA

fbcpCropped.service
fbcpCroppedNoSleep.service
fbcpBPCropped.service
fbcpBPCroppedNoSleep.service
fbcpFilled.service
fbcpFilledNoSleep.service
fbcpZero.service
fbcpZeroNoDMA.service
fbcpOld.service

dispMenuCM3.sh                                   
dispMenuZero.sh
fbcpCropped.sh
fbcpFilled.sh
fbcpZero.sh
install.sh
installCM3.sh
installZero.sh
uninstall.sh

LICENSE
