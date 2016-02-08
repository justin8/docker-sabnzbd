#!/bin/sh

if [ ! -f /config/sabnzbd.ini ]; then
	timeout -t 2 /sabnzbd/SABnzbd.py -f /config &>/dev/null
fi
sed -i 's/^host.*/host = 0.0.0.0/' /config/sabnzbd.ini
/sabnzbd/SABnzbd.py -f /config
