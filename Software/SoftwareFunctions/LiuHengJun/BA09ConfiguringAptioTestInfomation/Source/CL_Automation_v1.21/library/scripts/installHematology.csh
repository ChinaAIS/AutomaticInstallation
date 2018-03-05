//////////////////////////////////////////////////////////////////////////
// Script:  installHematology.csh
// Purpose: Configures the system for Hematology
// Notes:	None
// Version: 1.0 Initial Release
//////////////////////////////////////////////////////////////////////////

#include commonCLv16.inc
#include siteDataCLv16.inc

$installerPath = $cdRomDrive+CerberusInstall64.exe
&ftpClientIpAddresses = centralink/network/firewall/setFTPClientIpAddresses
&cytogramDirList = utils/fileSystem/createDir

sendMessage \n\n
sendMessage The following variables will be set during this script
getvar $cytogramDirList /^del/
sendMessage \n
sendMessage If any of these variables are set incorrectly do not continue with the script.
sendMessage Refer to the site data file by selecting the $labSpecDataStep shortcut in the $__ROOT_PATH__ directory to modify the variables.
proceed?

sendMessage \n\n
sendMessage Insert the Cerberus FTP Server installation cd into the tray and close
sendMessage NOTE - It may take up to 30 seconds for the installer to begin
sendMessage $bulletinPrint for the Cerberus installation instructions
pause
centralink/install/installCerberus1.0 $installerPath
sendMessage Once installation is completed select the "Enter" key
pause

&ftpClientIpAddresses $ftpClientIpAddresses $cerberusFirewallRuleName
&cytogramDirList $cytogramDirList $ftpRootPath 


sendMessage Setting the delete cytogram scheduled task
sendMessage Enter the CentraLink system user and password information for the CentraLink scheduled tasks
sendMessage $bulletinPrint for the CentraLink system user credentials
usercredentials?
centralink/scheduledTasks/createDeleteCytogramTask $delCytogramTaskName $delCytogramSchTaskSrcPath $backupDbDrive $delCytogramSchedule $delCytogramStartTime $****USER_NAME**** $****USER_PASS****

sendMessage \n\n
sendMessage Installing Cerberus FTP Server has completed
sendMessage Remove the Cerberus FTP Server installation cd from the tray and close
sendMessage The changes performed in this script require a reboot
sendMessage The system will be restarted after the "Enter" key is selected
pause
os/administrative/reboot
