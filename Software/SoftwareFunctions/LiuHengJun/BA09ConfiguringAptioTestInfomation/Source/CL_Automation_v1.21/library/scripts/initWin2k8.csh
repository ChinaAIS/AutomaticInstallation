//////////////////////////////////////////////////////////////////////////
// Script:  initWin2k8.csh
// Purpose: Initialize the Win2K8 image for product configuration 
//			installation
// Notes:   This script should only contain items that require a reboot 
// Version: 1.0 Initial Release
//////////////////////////////////////////////////////////////////////////

#include commonCLv16.inc
#include siteDataCLv16.inc

sendMessage \n\n
sendMessage The following variables will be set during this script
getvar $hostName /^nic/
sendMessage \n
sendMessage If any of these variables are set incorrectly do not continue with the script.
sendMessage Refer to the site data file by selecting the $srsDataStep shortcut in the $__ROOT_PATH__ directory to modify the variables.
proceed?

sendMessage \n\n
sendMessage Initializing OS for product installation
os/administrative/security/disableUAC
os/administrative/disableAutoRun
os/administrative/registerDll $autoUpdateDll
os/administrative/setComputerName $hostName

sendMessage \n\n
sendMessage Consult with the customer if this server is to be on a domain
sendMessage If a domain IS NEEDED perform the following steps:
sendMessage 1. Select the "Change..." button
sendMessage 2. Select the "Member Of" radio button and enter the appropriate domain credentials
sendMessage The site data file defines the domain $domainName but verify this value with the customer
sendMessage If a domain IS NOT NEEDED select the "Cancel" button in the applet
os/controlPanel/startSystemApplet
pause

sendMessage \n\n
sendMessage Setting network configuration
sendMessage If DNS servers need to be configured discuss with the customer
sendMessage Refer to the $srsDataStep file for details on the DNS servers defined for each adapter
pause
os/administrative/network/setNicBindingOrder $nicBindingOrder
os/administrative/network/setNicCfgFromSiteData $siteDataPath
sendMessage \n
sendMessage Setting the network interfaces has completed

sendMessage \n\n
sendMessage Initializing Windows 2008 OS has completed
sendMessage The changes performed in this script require a reboot
sendMessage The system will be restarted after the "Enter" key is selected
pause
os/administrative/reboot
