## LIVE WORKFLOW
##
# ## Machine Configuration
DEPNotify "Command: MainText: Configuring System Settings"
jamfCommand recon
DEPNotify "Status: Installing Rosetta 2"
jamfCommand labzt-onboarding-rosetta2
DEPNotify "Status: Setting Computer Name"
jamfCommand labzt-onboarding-setdevicename
DEPNotify "Status: Setting Computer Time Zone to UK"
jamfCommand labzt-onboarding-setTimeZoneNTP
DEPNotify "Status: Installing Microsoft Defender ATP"
jamfCommand labzt-onboarding-ai-defenderatp
#
# ## Browsers
DEPNotify "Status: Installing Microsoft Edge"
DEPNotify "Command: MainText: Starting software deployment.\n\nThis process can take up to 3-4 hours to complete."
jamfCommand labzt-onboarding-ai-edge
sleep 3
DEPNotify "Status: Installing Google Chrome"
jamfCommand labzt-onboarding-ai-chrome
sleep 3
DEPNotify "Status: Installing Google Chrome"
jamfCommand labzt-onboarding-ai-firefox
sleep 3
#
# ## Office Applications
DEPNotify "Status: Installing Microsoft Office 365"
jamfCommand labzt-onboarding-ai-mso365bpro
sleep 3
jamfCommand labzt-onboarding-remove-outlook
sleep 3
DEPNotify "Status: Installing Keka"
jamfCommand labzt-onboarding-ai-keka
sleep 3
#
# ## Media Applications
DEPNotify "Status: Installing VLC"
jamfCommand labzt-onboarding-ai-vlc
sleep 3
DEPNotify "Status: Installing Audacity"
jamfCommand labzt-onboarding-ai-audacity
sleep 3
#
# ## Adobe Suite
DEPNotify "Status: Updating Smart Group Memberships"
jamfCommand recon
DEPNotify "Status: Downloading Adobe Creative Cloud 2022"
jamfCommand labzt-onboarding-adobearm-cache
sleep 300
DEPNotify "Status: Installing Adobe Creative Cloud 2022"
jamfCommand labzt-onboarding-adobearm-install
sleep 300
DEPNotify "Status: Downloading Adobe Creative Cloud 2022"
jamfCommand labzt-onboarding-adobeintel-cache
sleep 300
DEPNotify "Status: Installing Adobe Creative Cloud 2022"
jamfCommand labzt-onboarding-adobeintel-install
sleep 300
#
# ## Send updated inventory for Smart Groups and check for any remaining scoped policies
DEPNotify "Command: MainText: Installing Room Specific Requirements"
DEPNotify "Status: Update inventory record."
jamfCommand recon
sleep 3
jamfCommand policy
sleep 3
/usr/bin/defaults write /Library/Preferences/co.uk.grayw.blog onboardingComplete -string "Complete"
#
## Prepare for Final Usage
DEPNotify "Status: Install NoMAD & NoMAD Login"
jamfCommand labzt-nomad
DEPNotify "Status: Removing Auto Logon"
jamfCommand labzt-remove-autologon