#!/bin/bash

# Jamf Binary Location
JAMF_BINARY="/usr/local/bin/jamf"


# Extract Serial Number and set as device name
DEVICESERIAL="BLOG-$(ioreg -l | grep IOPlatformSerialNumber | sed -e 's/.*\"\(.*\)\"/\1/')"
"$JAMF_BINARY" setComputerName -name "$DEVICESERIAL"