# FreeplayILI9341
This repository contains compiled binaries compiled from from https://github.com/juj/fbcp-ili9341/, services (start, stopping), and scripts (installation and removal). Upon successful install, the various binaries are copied into place, the services are installed, and a menu is available through the Retropie configuration --> Freeplay options --> LCD Driver Selection. Once a LCD Driver is selected that file's service is then enabled and started.

## Usage

To Install:
```
cd ~/Freeplay
git clone https://github.com/Mootikins/FreeplayILI9341
cd FreeplayILI9341
./install.sh
```
This will open a menu then select your hardware to install the appropriate display drivers.

To Uninstall:
```
cd ~/Freeplay/FreeplayILI9341
./uninstall
```

## Binary Files
### fbcpCropped
Has the necessary cropping for standard Freeplay units.
by default, freeplaytech_waveshare32b.h has these parameters:
```
#define DISPLAY_NATIVE_COVERED_TOP_SIDE 18
#define DISPLAY_NATIVE_COVERED_LEFT_SIDE 9
#define DISPLAY_NATIVE_COVERED_RIGHT_SIDE 29
#define DISPLAY_NATIVE_COVERED_BOTTOM_SIDE 0
```

compiled with these parameters
note: SPI_BUS_CLOCK_DIVISOR of 6 works best with the regular clock of 400 from the CM3 and CM3+. Can be used with a CM4 or CM4S, however requires underclocking via core_freq=400 option in /boot/config.txt.
```
cmake -DARMV8A=ON -DFREEPLAYTECH_WAVESHARE32B=ON -DSPI_BUS_CLOCK_DIVISOR=6 -DDISPLAY_BREAK_ASPECT_RATIO_WHEN_SCALING=ON -DUSE_DMA_TRANSFERS=ON -DBACKLIGHT_CONTROL=ON -DGPIO_TFT_BACKLIGHT=31 -DSTATISTICS=0 ..
```

### fbcpCroppedNoSleep
by default freeplaytech_waveshare32b.h has these parameters
```
#define DISPLAY_NATIVE_COVERED_TOP_SIDE 18
#define DISPLAY_NATIVE_COVERED_LEFT_SIDE 9
#define DISPLAY_NATIVE_COVERED_RIGHT_SIDE 29
#define DISPLAY_NATIVE_COVERED_BOTTOM_SIDE 0
```
compiled with these parameters
note: SPI_BUS_CLOCK_DIVISOR of 6 works best with the regular clock of 400 from the CM3 and CM3+. Can be used with a CM4 or CM4S, however requires underclocking via core_freq=400 option in /boot/config.txt.
```
cmake -DARMV8A=ON -DFREEPLAYTECH_WAVESHARE32B=ON -DSPI_BUS_CLOCK_DIVISOR=6 -DDISPLAY_BREAK_ASPECT_RATIO_WHEN_SCALING=ON -DUSE_DMA_TRANSFERS=ON -DBACKLIGHT_CONTROL=ON -DGPIO_TFT_BACKLIGHT=31 -DSTATISTICS=0 ..
```
Edit to config.h commenting with a '//' at beginning of the line for these Defines:
```
//SAVE_BATTERY_BY_PREDICTING_FRAME_ARRIVAL_TIMES
//DISPLAY_FLIP_ORIENTATION_IN_SOFTWARE
//SAVE_BATTERY_BY_SLEEPING_WHEN_IDLE
```
### fbcpBPCropped
Necessary cropping for a BoxyPixel shell using a Freeplay lens.
Changes were made to the freeplaytech_waveshare32b.h file, however I am not exactly sure what the value were set to when compiled.

### fbcpBPCroppedNoSleep
Changes were made to the freeplaytech_waveshare32b.h file, however I am not exactly sure what the value were set to when compiled.

Edit to config.h commenting with a '//' at beginning of the line for these Defines:
```
SAVE_BATTERY_BY_PREDICTING_FRAME_ARRIVAL_TIMES
DISPLAY_FLIP_ORIENTATION_IN_SOFTWARE
SAVE_BATTERY_BY_SLEEPING_WHEN_IDLE
```
### fbcpFilled
Edit to freeplaytech_waveshare32b.h setting all borders to 0
```
  #define DISPLAY_NATIVE_COVERED_TOP_SIDE 0
  #define DISPLAY_NATIVE_COVERED_LEFT_SIDE 0
  #define DISPLAY_NATIVE_COVERED_RIGHT_SIDE 0
  #define DISPLAY_NATIVE_COVERED_BOTTOM_SIDE 0
```
compiled with these parameters
note: SPI_BUS_CLOCK_DIVISOR of 6 works best with the regular clock of 400 from the CM3 and CM3+. Can be used with a CM4 or CM4S, however requires underclocking via core_freq=400 option in /boot/config.txt.
```
cmake -DARMV8A=ON -DFREEPLAYTECH_WAVESHARE32B=ON -DSPI_BUS_CLOCK_DIVISOR=6 -DDISPLAY_BREAK_ASPECT_RATIO_WHEN_SCALING=ON -DUSE_DMA_TRANSFERS=ON -DBACKLIGHT_CONTROL=ON -DGPIO_TFT_BACKLIGHT=31 -DSTATISTICS=0 ..
```
### fbcpFilledNoSleep
Edit to freeplaytech_waveshare32b.h setting all borders to 0
```
  DISPLAY_NATIVE_COVERED_TOP_SIDE is left border of the screen
  DISPLAY_NATIVE_COVERED_LEFT_SIDE is top border of the screen
  DISPLAY_NATIVE_COVERED_RIGHT_SIDE is bottom border of the screen
  DISPLAY_NATIVE_COVERED_BOTTOM_SIDE is right border of the screen
```
Edit to config.h commenting with a '//' at beginning of the line for these Defines:
```
  SAVE_BATTERY_BY_PREDICTING_FRAME_ARRIVAL_TIMES
  DISPLAY_FLIP_ORIENTATION_IN_SOFTWARE
  SAVE_BATTERY_BY_SLEEPING_WHEN_IDLE
```
compiled with these parameters
note: SPI_BUS_CLOCK_DIVISOR of 6 works best with the regular clock of 400 from the CM3 and CM3+. Can be used with a CM4 or CM4S, however requires underclocking via core_freq=400 option in /boot/config.txt.
```
cmake -DARMV8A=ON -DFREEPLAYTECH_WAVESHARE32B=ON -DSPI_BUS_CLOCK_DIVISOR=6 -DDISPLAY_BREAK_ASPECT_RATIO_WHEN_SCALING=ON -DUSE_DMA_TRANSFERS=ON -DBACKLIGHT_CONTROL=ON -DGPIO_TFT_BACKLIGHT=31 -DSTATISTICS=0 ..
```
### fbcpCM4Filled
Edit to freeplaytech_waveshare32b.h setting all borders to 0
```
  #define DISPLAY_NATIVE_COVERED_TOP_SIDE 0
  #define DISPLAY_NATIVE_COVERED_LEFT_SIDE 0
  #define DISPLAY_NATIVE_COVERED_RIGHT_SIDE 0
  #define DISPLAY_NATIVE_COVERED_BOTTOM_SIDE 0
```
compiled with these parameters
note: SPI_BUS_CLOCK_DIVISOR of 8 works best with the regular clock of 500 from the CM4 and CM4S
```
cmake -DARMV8A=ON -DFREEPLAYTECH_WAVESHARE32B=ON -DSPI_BUS_CLOCK_DIVISOR=8 -DDISPLAY_BREAK_ASPECT_RATIO_WHEN_SCALING=ON -DUSE_DMA_TRANSFERS=ON -DBACKLIGHT_CONTROL=ON -DGPIO_TFT_BACKLIGHT=31 -DSTATISTICS=0 ..
```
### fbcpCM4FilledNoSleep
Edit to freeplaytech_waveshare32b.h setting all borders to 0
```
  #define DISPLAY_NATIVE_COVERED_TOP_SIDE 0
  #define DISPLAY_NATIVE_COVERED_LEFT_SIDE 0
  #define DISPLAY_NATIVE_COVERED_RIGHT_SIDE 0
  #define DISPLAY_NATIVE_COVERED_BOTTOM_SIDE 0
```
Edit to config.h commenting with a '//' at beginning of the line for these Defines:
```
  SAVE_BATTERY_BY_PREDICTING_FRAME_ARRIVAL_TIMES
  DISPLAY_FLIP_ORIENTATION_IN_SOFTWARE
  SAVE_BATTERY_BY_SLEEPING_WHEN_IDLE
```
compiled with these parameters
note: SPI_BUS_CLOCK_DIVISOR of 8 works best with the regular clock of 500 from the CM4 and CM4S
```
  cmake -DARMV8A=ON -DFREEPLAYTECH_WAVESHARE32B=ON -DSPI_BUS_CLOCK_DIVISOR=8 -DDISPLAY_BREAK_ASPECT_RATIO_WHEN_SCALING=ON -DUSE_DMA_TRANSFERS=ON -DBACKLIGHT_CONTROL=ON -DGPIO_TFT_BACKLIGHT=31 -DSTATISTICS=0 ..
```
### fbcpZero

### fbcpZeroNoDMA

## Service Definitions
These are the systemctl service definitions that provide information to the operating system about how the binaries files should be run and where they are located. Please find an example of the content and the list of services.

* fbcpCropped.service
* fbcpCroppedNoSleep.service
* fbcpBPCropped.service
* fbcpBPCroppedNoSleep.service
* fbcpFilled.service
* fbcpFilledNoSleep.service
* fbcpCM4Filled.service
* fbcpCM4FilledNoSleep.service
* fbcpZero.service
* fbcpZeroNoDMA.service
* fbcpOld.service

## Provided scripts

* dispMenuCM3.sh : Menu that is displayed in RetroPie that contains the options that apply to the Freeplay CM3
* dispMenuZero.sh : Menu that is displayed in RetroPie that contains the options that apply to the Freeplay Zero
* fbcpCropped.sh : init.d script that handle start, stop, status, restart, reload, force-reload
* fbcpFilled.sh : init.d script that handle start, stop, status, restart, reload, force-reload
* fbcpZero.sh : init.d script that handle start, stop, status, restart, reload, force-reload
* install.sh : main install script (run this first)
* installCM3.sh : install script - this is a selectable item in the install.sh script
* installCM4.sh : install script - this is a selectable item in the install.sh script
* installZero.sh : install script - this is a selectable item in the install.sh script
* uninstall.sh : uninstall script - this is a selectable item in the install.sh script

## Other Files
LICENSE
display.png : icon file that is displayed in RetroPie under the Freeplay Options menu for the dispMenu item
