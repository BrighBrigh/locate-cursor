# locate-cursor
A Script to allow locating the cursor on screen using the touchpad or mouse, emulating the feature on Mac OS X where you can shake the cursor and it temporarily becomes larger.


## Depends
* GNOME
* xdotool

## Installation (Start at Boot)
* Make the script executable:
`chmod a+x locate-cursor.sh`
*  Set it to autostart, using whichever method you prefer.

## Autostart using GNOME
* Copy locate-cursor.desktop to `~/.config/autostart/locate-cursor.desktop`
* Check that its enabled in Tweaks->Startup Applications

## Troubleshooting
If you are having issues getting the script to run, double check the permissions of `/usr/local/bin/locate-cursor`. You may have to adjust these permissions in order for it to work.

## Next Step
* The sensitivity is a bit too high right now. I'm yet to find the sweet spot.
* Finding a way to reduce the memory footprint of the program. While it's small enough to be used on a decent system without any issues, it still uses more memory than I'm happy with.
