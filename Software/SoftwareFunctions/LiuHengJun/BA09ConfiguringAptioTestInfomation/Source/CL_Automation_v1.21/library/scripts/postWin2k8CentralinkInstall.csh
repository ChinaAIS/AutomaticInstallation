//////////////////////////////////////////////////////////////////////////
// Script:  postWin2K8CentralinkInstall.csh
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
sendMessage Refer to the site data file by selecting the step_2_setSiteSpecificData shortcut in the $__ROOT_PATH__ directory to modify the variables.
proceed?

centralink/watchdog/copyConfigFilesToDir $__DATA_PATH__ $watchdogConfFilePath
centralink/administrative/removeDesktopIcons
sendMessage \n\n
sendMessage Setting the Centralink scheduled tasks
sendMessage Enter the administrator user and password information for the Centralink scheduled tasks
sendMessage $bulletinPrint for the administrator user and password credentials to use for CentraLink scheduled tasks
usercredentials?
centralink/scheduledTasks/createDBBackUpTask $dbBackupTaskName $dbServerBackupTaskSrcPath $clBinPath $dbBackupSchedule $dbBackupStartTime $****USER_NAME**** $****USER_PASS****
centralink/scheduledTasks/createCopyDBBackupToRemoveableHDDTask $copyDbToArchiveTaskName $copyDbToHDDTaskSrcPath $clBinPath $copyDbToArchiveSchedule $copyDbToArchiveStartTime $****USER_NAME**** $****USER_PASS****
centralink/scheduledTasks/modifyAppsTrimTasks $****USER_NAME**** $****USER_PASS****
sendMessage Setting the Centralink scheduled tasks has completed

sendMessage Creating the firewall rules
os/administrative/security/disablePing
centralink/network/firewall/modifyWatchdogRule $watchdogRulePorts
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
sendMessage Record the CentraLink server ID.  
sendMessage From the CentraLink Menu bar navigate to Help -> About
sendMessage Record the "Server identifier"
sendMessage Close the CentraLink UI when completed
centralink/administrative/startApplicationSystem
centralink/administrative/startUI
pause

sendMessage \n\n
sendMessage Configuration of the CentraLink server has completed.
sendMessage $bulletinPrint to perform the CentraLink application configuration.
sendMessage \n\n
sendMessage Discuss any 3rd Party software, locally validated drivers, and non-CentraLink scheduled tasks that need to be configured with the customer.
sendMessage If this server was upgraded from the Windows 2003 Operating System refer to the $win2k3DataDir directory for the saved data.
sendMessage $bulletinPrint for instructions on restoring 3rd Party software, locally validated drivers, and non-CentraLink scheduled tasks
