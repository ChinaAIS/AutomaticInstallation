//////////////////////////////////////////////////////////////////////////
// Script:  installCentralink_v15_0_3.csh
// Purpose: Invokes the installer for Centralink v15.0.3 update
// Notes:	None
// Version: 1.0 Initial Release
//////////////////////////////////////////////////////////////////////////

#include commonCLv15Win2K8.inc

sendMessage \n\n
sendMessage Insert the CentraLink 15.0.3 disk 3 of 3 in the tray and close
sendMessage NOTE - It may take up to 10 seconds to detect the installer in the cd-rom
sendMessage $bulletinPrint for the CentraLink v15.03 installation instructions
pause
centralink/install/installCentralink15.0.3  
sendMessage Once installation is completed select the "Enter" key
pause

sendMessage \n\n
sendMessage Installing Centralink 15.0.3 release has completed
sendMessage Remove the CentraLink 15.0.3 disk 3 of 3 from the tray and close
sendMessage The changes performed in this script require a reboot
sendMessage The system will be restarted after the "Enter" key is selected
pause
os/administrative/reboot


