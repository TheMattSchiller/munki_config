#/bin/bash

#Client manifest name
ClientIdentifier="hostname"
#Server address & path to repository
SoftwareRepoURL="https://yourwebsite.com/munki/repo"
#SSL Certificate options
UseClientCertificate="False"
#Path to certificate authority cert (needed if own CA is used)
SoftwareRepoCACertificate=""
#Path to client certificate issued by CA
ClientCertificatePath=""
#Allow munki to install Apple Upates?
InstallAppleSoftwareUpdates="True"
#Custom apple update server url (if you have one)
SoftwareUpdateServerURL=""
#Check for updates at next boot?
Bootstrap="True"

#Path to ManagedInstalls.plist
plist="/Library/Preferences/ManagedInstalls.plist"

#Check if script is being run as root
if [ $(id -u) != 0 ];
then
	echo "this script must be run as root"
	exit 1
fi

#Set partameters
defaults write "$plist" ClientIdentifier "$ClientIdentifier"
defaults write "$plist" SoftwareRepoURL "$SoftwareRepoURL"
defaults write "$plist" UseClientCertificate -bool "$UseClientCertificate"
defaults write "$plist" SoftwareRepoCACertificate "$SoftwareRepoCACertificate"
defaults write "$plist" ClientCertificatePath "$ClientCertificatePath"
defaults write "$plist" InstallAppleSoftwareUpdates -bool "$InstallAppleSoftwareUpdates"
defaults write "$plist" SoftwareUpdateServerURL "$SoftwareUpdateServerURL"

exit 0
