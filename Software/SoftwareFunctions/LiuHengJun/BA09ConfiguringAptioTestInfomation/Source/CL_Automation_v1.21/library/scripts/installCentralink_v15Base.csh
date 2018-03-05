//////////////////////////////////////////////////////////////////////////
// Script:  installCentralink_v15_Base.csh
// Purpose: Invokes the installer for Centralink v15 base image
// Notes:	None
// Version: 1.0 Initial Release
//////////////////////////////////////////////////////////////////////////

#include commonCLv15Win2K8.inc

$installerPath = $cdRomDrive+CentraLink\setup.exe

sendMessage \n\n
sendMessage Insert the CentraLink 15.0.1.6 disk 2 of 3 in the tray and close
sendMessage NOTE - It may take up to 10 seconds to detect the installer in the cd-rom
sendMessage $bulletinPrint for the CentraLink v15.0.1.6 installation instructions
pause
centralink/install/installCentralink15.0.1.6 $installerPath  
sendMessage Once installation is completed select the "Enter" key
pause

sendMessage \n\n
sendMessage Installing Centralink 15.0.1.6 release has completed
sendMessage Remove the CentraLink 15.0.1.6 disk 2 of 3 from the tray and close
sendMessage The changes performed in this script require a reboot
sendMessage The system will be restarted after the "Enter" key is selected
pause
os/administrative/reboot

