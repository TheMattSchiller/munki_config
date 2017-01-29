#/bin/bash

#Client manifest name
ClientIdentifier="hostname"
#Server address & path to repository
SoftwareUpdateRepoURL="https://yourwebsite.com/munki/repo"
#SSL Certificate options
UseClientCertificate="False"
#Path to certificate authority cert (needed if own CA is used)
SoftwareRepoCACertificate=""
#Path to client certificate issued by CA
ClientCertificatePath=""
#Allow munki to install Apple Upates?
InstallAppleSoftwareUpdates="True"
#Check for updates at next boot?
Bootstrap="True"

#Path to ManagedInstalls.plist
munki_plist="/Library/Preferences/ManagedInstalls.plist"

#Check if script is being run as root
if [ $(id -u) != 0 ];
then
	echo "this script must be run as root"
	exit 1
fi

#Set partameters
defaults write "$plist" ClientIdentifier "$ClientIdentifier"
defaults write "$plist" SoftwareUpdateRepoURL "$SoftwareUpdateRepoURL"
defaults write "$plist" UseClientCertificate -bool "$UseClientCertificate"
defaults write "$plist" SoftwareRepoCACertificate "$SoftwareRepoCACertificate"
defaults write "$plist" ClientCertificatePath "$ClientCertificatePath"
defaults write "$plist" InstallAppleSoftwareUpdates -bool "$InstallAppleSoftwareUpdates"

exit 0
