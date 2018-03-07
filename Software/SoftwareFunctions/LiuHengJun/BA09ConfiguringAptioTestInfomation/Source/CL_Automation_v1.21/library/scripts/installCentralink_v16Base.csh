//////////////////////////////////////////////////////////////////////////
// Script:  installCentralink_v16Base.csh
// Purpose: Invokes the installer for Centralink v16 base image
// Notes:	None
// Version: 1.0 Initial Release
//////////////////////////////////////////////////////////////////////////

#include commonCLv16.inc

$installerPath = $cdRomDrive+CentraLink\setup.exe

sendMessage \n\n
sendMessage Insert the CentraLink v16.0.1 install CD into the tray and close
sendMessage NOTE - It may take up to 10 seconds to detect the installer in the cd-rom
sendMessage $bulletinPrint for the CentraLink v16 installation instructions
sendMessage \n\n
sendMessage Once installation has completed remove the CentraLink v16.0.1 install CD from the tray and close
sendMessage Follow the installer instructions to reboot the server
pause
centralink/install/installCentralink16 $installerPath 

// The Centralink installer prompts for a reboot so no need to 
// do it here
//sendMessage Once installation is completed select the "Enter" key
//pause
//sendMessage \n\n
//sendMessage Installing Centralink v16 release has completed
//sendMessage Remove the CentraLink v16 disk 3 of 3 from the tray and close
//sendMessage The changes performed in this script require a reboot
//sendMessage The system will be restarted after the "Enter" key is selected
//pause
//os/administrative/reboot

