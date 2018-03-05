//////////////////////////////////////////////////////////////////////////
// Script:  postCentralinkV16Install.csh
// Purpose: Contains all commands to run after the Centralink installation 
//			has been completed
// Notes:   None
// Version: 1.0 Initial Release
//////////////////////////////////////////////////////////////////////////

#include commonCLv16.inc
#include siteDataCLv16.inc

// Set the command references here
// If the variables are defined the following commands will be executed
&instServerTranslators = centralink/network/firewall/createInstrumentsRule
&lasPorts = centralink/network/firewall/createLasRule
&ftpClientIpAddresses = centralink/network/firewall/setFTPClientIpAddresses

sendMessage \n\n
sendMessage The following variables will be set during this script
getvar /^lis/ /^instServerTranslators$/ /^lmxLisIpAddresses$/ /^lasPorts$/ /^dbBackup/ /^copyDbTo/
sendMessage \n
sendMessage If any of these variables are set incorrectly do not continue with the script.
sendMessage Refer to the site data file by selecting the $labSpecDataStep shortcut in the $__ROOT_PATH__ directory to modify the variables.
proceed?

centralink/watchdog/setReceiverPort $watchdogReceiverPort $watchdogPropFilePath
centralink/administrative/removeDesktopIcons
sendMessage \n\n
sendMessage Setting the Centralink scheduled tasks
sendMessage Enter the CentraLink system user and password information for the Centralink scheduled tasks
sendMessage $bulletinPrint for the CentraLink system user credentials
usercredentials?
centralink/scheduledTasks/createDBBackUpTask $dbBackupTaskName $dbServerBackupTaskSrcPath $clBinPath $dbBackupSchedule $dbBackupStartTime $****USER_NAME**** $****USER_PASS****
centralink/scheduledTasks/createCopyDBBackupToRemoveableHDDTask $copyDbToArchiveTaskName $copyDbToHDDTaskSrcPath $clBinPath $copyDbToArchiveSchedule $copyDbToArchiveStartTime $****USER_NAME**** $****USER_PASS****
centralink/scheduledTasks/modifyAppsTrimTasks $****USER_NAME**** $****USER_PASS****
sendMessage Setting the Centralink scheduled tasks has completed

sendMessage Creating the firewall rules
os/administrative/security/disablePing
centralink/network/firewall/createLisRule $lisPorts
centralink/network/firewall/createUploadToLisRule $lisUploadPorts
// NOTE - These are only set if the variables have been set in the site config file
&instServerTranslators $instServerTranslators
&lasPorts $lasPorts
&ftpClientIpAddresses $ftpClientIpAddresses $iisFirewallRuleName

sendMessage \n\n
sendMessage Update the Progress Explorer to use the correct administrator credentials
sendMessage Log into Progress Explorer as the default user "admin" password "admin" 
sendMessage $bulletinPrint for the administrator user and password credentials to use 
centralink/administrative/startProgressExplorer
pause

sendMessage \n\n
runScript installCentralinkOpGuide
sendMessage \n\n

sendMessage \n\n
sendMessage Record the CentraLink server ID.  
sendMessage From the CentraLink Menu bar navigate to Help -> About
sendMessage Record the "Server identifier"
sendMessage Then navigate to Help -> Help
sendMessage Verify the Op Guide has been installed correctly and is in the correct language
sendMessage Close the CentraLink UI and Op Guide when completed
centralink/administrative/startApplicationSystem
centralink/administrative/startUI
pause

sendMessage \n\n
sendMessage Installing Internet Explorer v11
runScript installIE11
os/customize/ie/disableWelcomeScreen
os/customize/ie/disableSearchBar
os/customize/ie/disableFavoritesBar
os/customize/ie/enableActiveContent

sendMessage \n\n
runScript installCSP
sendMessage \n\n

sendMessage \n\n
sendMessage $bulletinPrint to perform the CentraLink application configuration.
sendMessage \n\n
sendMessage Discuss any 3rd Party software, locally validated drivers, and non-CentraLink scheduled tasks that need to be configured with the customer.
sendMessage $bulletinPrint for instructions on restoring 3rd Party software, locally validated drivers, and non-CentraLink scheduled tasks

sendMessage \n\n
sendMessage sendMessage Configuration of the CentraLink server has completed.
sendMessage The changes performed in this script require a reboot
sendMessage The system will be restarted after the "Enter" key is selected
pause
os/administrative/reboot





