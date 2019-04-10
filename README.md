# locate-cursor
A Script to allow locating the cursor on screen using the touchpad or mouse, emulating the feature on Mac OS X where you can shake the cursor and it temporarily becomes larger.


## Depends
* GNOME
* xdotool

## Installation (Start at Boot)
Make the script executable:
`chmod a+x locate-cursor.sh`

Run the following commands (with root privileges): 
```
cp locate-cursor.sh /usr/local/bin/locate-cursor
cp locate-cursor.service /usr/lib/systemd/system/
systemctl enable locate-cursor.service
```

## Next Step
Finding a way to reduce the memory footprint of the program. While it's small enough to be used on a decent system without any issues, it still uses more memory than I'm happy with.
