# netatalk-utils
Random utilities for doing stuff over AppleTalk.

I develop Linux software for $WORK on a VirtualBox virtual machine
mounted on my MacBook Pro. I use netatalk and avahi to share the virtual
machine's file system to my Mac so I can use a sensible editor. These are
utilities I've written to help me out in a variety of situations.

## remount-with-new-ip.pl

This bounces eth0, which on my VM is the main interface that shares my
wi-fi connection, gets the new IP address, connects to my local Mac
and tells it to mount the volume using the new IP address.

Incidentally, if you ever get the urge to mount an AppleTalk volume via
the command line and find the urge to use mount_afp, and then you need to
work out what the mount point, volume name etc. are, stop, and just use
open instead.

## open-on-mac.pl

Put this as $ENV{BROWSER} and open URLs on your mac, not your local
VM.
