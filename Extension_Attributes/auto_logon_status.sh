#!/bin/bash

status=`defaults read /Library/Preferences/com.apple.loginwindow autoLoginUser`
if [ "$status" == "blogadmin" ]; then
    echo "<result>Auto Logon Enabled</result>"
elif [ "$status" != "blogadmin" ]; then
    echo "<result>Auto Logon Disabled</result>"
fi