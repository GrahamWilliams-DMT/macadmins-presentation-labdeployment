#!/bin/bash

status=`defaults read /Library/Preferences//Library/Preferences/co.uk.grayw.blog onboardingComplete`
if [ "$status" == "Complete" ]; then
    echo "<result>Onboarding Complete</result>"
elif [ "$status" != "Complete" ]; then
    echo "<result>Onboarding Not Complete</result>"
fi