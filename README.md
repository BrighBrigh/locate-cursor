# locate-cursor
A Script to allow locating the cursor on screen using the touchpad or mouse


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
