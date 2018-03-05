//////////////////////////////////////////////////////////////////////////
// Script:  installProgress_v11.csh
// Purpose: Invokes the Progress installers for 11.3 and SP3 
// Notes:	None
// Version: 1.0 Initial Release
//////////////////////////////////////////////////////////////////////////

#include commonCLv16.inc

$installerPath = $cdRomDrive+OE11_3_INSTALL\setup.exe
$installerSP3Path = $cdRomDrive+OE11_3_3_INSTALL\setup.exe

sendMessage \n\n
sendMessage Insert the Progress v11.3 install CD into the tray and close
sendMessage NOTE - It may take up to 10 seconds to detect the installer in the cd-rom
sendMessage $bulletinPrint for the Progress 11.3 installation instructions
pause
centralink/install/installProgress11.3 $installerPath
sendMessage Once installation has completed remove the Progress v11.3 install CD from the tray
pause
sendMessage \n\n
sendMessage Insert the Progress v11.3 SP3 install CD in the tray and close
sendMessage NOTE - It may take up to 10 seconds to detect the installer in the cd-rom
sendMessage $bulletinPrint for the Progress 11.3 SP3 installation instructions
pause
centralink/install/installProgress11.3_SP3 $installerSP3Path
sendMessage Once installation has completed remove the Progress v11.3 SP3 install CD from the tray and close
pause
sendMessage \n\n
sendMessage The changes performed in this script require a reboot
sendMessage The system will be restarted after the "Enter" key is selected
pause
os/administrative/reboot

