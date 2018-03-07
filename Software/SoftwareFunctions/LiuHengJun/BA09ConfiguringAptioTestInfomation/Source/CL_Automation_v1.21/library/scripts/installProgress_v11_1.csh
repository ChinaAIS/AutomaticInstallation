//////////////////////////////////////////////////////////////////////////
// Script:  installProgress_v11_1.csh
// Purpose: Invokes the Progress installer and then reboots
// Notes:	None
// Version: 1.0 Initial Release
//////////////////////////////////////////////////////////////////////////

#include commonCLv15Win2K8.inc

$installerPath = $cdRomDrive+OE11-1_INSTALL\setup.exe

sendMessage \n\n
sendMessage Insert the Progress v11.1 disk 1 of 3 in the tray and close
sendMessage NOTE - It may take up to 10 seconds to detect the installer in the cd-rom
sendMessage $bulletinPrint for the Progress 11.1 installation instructions
pause
centralink/install/installProgress11.1 $installerPath
sendMessage Once installation is completed select the "Enter" key
pause

sendMessage \n\n
sendMessage Installing Progress 11.1 has completed
sendMessage Remove the Progress v11.1 disk 1 of 3 from the tray and close
sendMessage The changes performed in this script require a reboot
sendMessage The system will be restarted after the "Enter" key is selected
pause
os/administrative/reboot

