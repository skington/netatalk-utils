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

## open-on-mac.pl

Put this as $ENV{BROWSER} and open URLs on your mac, not your local
VM.
