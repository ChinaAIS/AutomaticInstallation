//////////////////////////////////////////////////////////////////////////
// Script:  confWin2k8Common.csh
// Purpose: Configure all things Win2K8 for both new installs and upgrades
// Notes:   None
// Version: 1.0 Initial Release
// Version: 1.1 Modified for CentraLink v16:
//					Removed NIC configuration
//					Removed mapped drive query
//					Removed setting passwords to never expire
//					Added IE 11 install script
//					Added enableRDS script
//////////////////////////////////////////////////////////////////////////

#include commonCLv16.inc
#include siteDataCLv16.inc


sendMessage \n\n
sendMessage $bulletinPrint for instructions on how to validate the disk partitions for this server platform
sendMessage Select File -> Exit to close the Disk Management applet
sendMessage Do not not continue the script if the disk partitions are incorrect
os/controlPanel/startDiskManagementApplet
proceed?

sendMessage \n\n
sendMessage Set resolution to highest possible; then select OK
os/controlPanel/startScreenResolutionApplet
pause

sendMessage \n\n
sendMessage $bulletinPrint for instructions on setting the date, time, and timezone
sendMessage Select "OK" when the configuration is completed
os/controlPanel/startDateTimeApplet
pause

sendMessage \n\n
sendMessage Modify the group policy to allow active scripting as follows:
sendMessage 1. In the left pane of the security editor
sendMessage 2. Navigate to User Configuration > Administrative Templates > Windows Components > Internet Explorer > Internet Control Panel > Security Page > Locked-Down Local Machine Zone
sendMessage 3. In the right pane, double-select Allow active scripting.
sendMessage 4. Select the Enabled radio button.
sendMessage 5. In the Options group box find the Allow active scripting option, and then select Enable from the list box options.
sendMessage 6. Select Apply, and then select OK.
sendMessage Select File -> Exit to close the Group Policy applet
sendMessage \n\n
sendMessage NOTE - It may take a few seconds to update the group policy
os/controlPanel/startGroupPolicyEdit
os/administrative/security/updateGroupPolicy
sendMessage \n\n
pause

sendMessage \n\n
sendMessage Configuring OS Users and Groups
os/usersAndGroups/addUserToGroup LabManager Administrators
os/usersAndGroups/removeUserFromGroup LabManager Users
os/usersAndGroups/removeUserFromGroup LabManager LabManagers
os/usersAndGroups/disableUserLogonAsAService SiemensService
os/usersAndGroups/removeEnableUserLogonAsAService SiemensService
runScript createCLSystemUser

sendMessage \n\n
sendMessage Querying system for RAID controller
hardware/devices/getRaidData
sendMessage \n\n\n\n
sendMessage NOTE - If RAID utility installation is required it may take up to 10 seconds to detect the installer in the cd-rom
sendMessage \n\n
sendMessage $installPrompt
pause
$installFunc
hardware/administrative/removeRaidDesktopIcons

sendMessage \n\n
runScript enableRDS
sendMessage \n\n
runScript installMSUpdates
sendMessage \n\n

sendMessage \n\n
sendMessage Configuring Windows 2008 OS has completed
sendMessage The changes performed in this script require a reboot
sendMessage The system will be restarted after the "Enter" key is selected
pause
os/administrative/reboot

