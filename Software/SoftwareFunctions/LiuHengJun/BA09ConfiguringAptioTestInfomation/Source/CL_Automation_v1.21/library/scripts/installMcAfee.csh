//////////////////////////////////////////////////////////////////////////
// Script:  installMcAfee.csh
// Purpose: Invokes the installer for McAfee Antivirus software
// Notes:	None
// Version: 1.0 Initial Release
//////////////////////////////////////////////////////////////////////////

#include commonCLv16.inc

$installerPath = $cdRomDrive+SetupVSE.Exe

sendMessage \n\n
sendMessage Insert the McAfee Antivirus installation cd in the tray and close
sendMessage NOTE - It may take up to 10 seconds to detect the installer in the cd-rom
sendMessage $bulletinPrint for the McAfee Antivirus installation instructions
pause
os/install/installExe $installerPath 
sendMessage Once installation is completed select the "Enter" key
pause

sendMessage \n\n
sendMessage Remove the McAfee Antivirus installation cd in the tray and close
sendMessage Installing McAfee Antivirus has completed
sendMessage $bulletinPrint for configuring the McAfee Antivirus software
sendMessage \n\n
sendMessage The changes performed in this script require a reboot
sendMessage The system will be restarted after the "Enter" key is selected
pause
os/administrative/reboot
