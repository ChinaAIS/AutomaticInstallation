//////////////////////////////////////////////////////////////////////////
// Script:  enableRDS.csh
// Purpose: Configure RDS services, roles, and firewall rules
// Notes:	None
// Version: 1.0 Initial Release
//////////////////////////////////////////////////////////////////////////

#include commonCLv16.inc
#include siteDataCLv16.inc

sendMessage \n\n
sendMessage The following variables will be set during this script
getvar /^rds/
sendMessage \n
sendMessage If any of these variables are set incorrectly do not continue with the script.
sendMessage Refer to the site data file by selecting the $labSpecDataStep shortcut in the $__ROOT_PATH__ directory to modify the variables.
proceed?

sendMessage \n\n
sendMessage Enabling Remote Desktop Services (RDS) 
os/customize/remoteDesktop/startRDSService
os/customize/remoteDesktop/enableRDS
os/administrative/network/firewall/enableFirewallRule $rdsFirewallRuleName
os/administrative/network/firewall/enableFirewallRule $rdsRemoteFXRuleName
os/administrative/network/firewall/setAllowedRDSClientsIpAddresses $rdsClientsIpAddresses $rdsFirewallRuleName

sendMessage \n\n
sendMessage Enabling Remote Desktop Services (RDS) role
// NOTE - A future enhancement is to decouple the RDS session manager and
// the license server.  For now always install both.
//os/administrative/roles/installRDSServer
os/administrative/roles/installRDSServerAndLicense
sendMessage Enabling Remote Desktop Services (RDS) has completed

sendMessage \n\n
sendMessage Modify the group policy to allow audio / video playback
sendMessage 1. In the left pane of the security editor
sendMessage 2. Navigate to Computer Configuration > Administrative Templates > Windows Components > Remote Desktop Services > Remote Desktop Session Host > Device and Resource Redirection
sendMessage 3. In the right pane, double-select Allow audio and video playback redirection
sendMessage 4. Select the Enabled radio button.
sendMessage 6. Select Apply, and then select OK.
sendMessage Select File -> Exit to close the Group Policy applet
sendMessage \n\n
sendMessage NOTE - It may take a few seconds to update the group policy
os/controlPanel/startGroupPolicyEdit
os/administrative/security/updateGroupPolicy
sendMessage \n\n
pause

// NOTE - A future enhancement is to decouple the RDS session manager and
// the license server.  For now always install both.
//sendMessage \n\n
//sendMessage If this server is going to be used for RDS licensing enter "yes" to the following prompt else enter "no"
//runScript? enableRDSLicenseServer


// NOTE - This script is being called by the confWin2k8Common script.
// This script will reboot the server when completed
//sendMessage \n\n
//sendMessage Configuring RDS has completed
//sendMessage The changes performed in this script require a reboot
//sendMessage The system will be restarted after the "Enter" key is selected
//pause
//os/administrative/reboot




