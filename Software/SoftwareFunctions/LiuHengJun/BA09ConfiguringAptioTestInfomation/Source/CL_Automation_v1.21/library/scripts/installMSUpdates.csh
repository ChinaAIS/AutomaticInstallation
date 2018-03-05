//////////////////////////////////////////////////////////////////////////
// Script:  installMSUPdates.csh
// Purpose: Install Microsoft supported updates
// Notes:   This script assumes the the update installers are 
//			zipped up and stored on the 'Additional Software' cd 
// Version: 1.0 Initial Release
//////////////////////////////////////////////////////////////////////////

#include commonCLv16.inc

$tmpDir = $__DATA_PATH__+_tmp_\
$archivePath = $cdRomDrive+ms_updates\updates.zip
$wupSrvName = wuauserv


sendMessage \n\n
sendMessage Installing Microsoft Updates
sendMessage Insert the $clv16AddSWPrint in the cd tray and close
sendMessage NOTE - It may take up to 10 seconds to detect the media in the cd-rom
pause
utils/fileSystem/createDir $tmpDir
utils/fileSystem/extractZipArchive $archivePath $tmpDir


// NOTE - The order is documented in the 'CentraLink System Security Updates' bulletin 
// and will be maintained here.
os/administrative/setServiceStartupMode $wupSrvName demand
os/administrative/startService $wupSrvName
$absPath = $tmpDir+Windows6.1-KB2533623-x64.msu
os/install/installWindowsUpdate $absPath quiet false
$absPath = $tmpDir+Windows6.1-KB2670838-x64.msu
os/install/installWindowsUpdate $absPath quiet false
$absPath = $tmpDir+Windows6.1-KB2729094-v2-x64.msu
os/install/installWindowsUpdate $absPath quiet false
$absPath = $tmpDir+Windows6.1-KB2731771-x64.msu
os/install/installWindowsUpdate $absPath quiet false
$absPath = $tmpDir+Windows6.1-KB2786081-x64.msu
os/install/installWindowsUpdate $absPath quiet false
$absPath = $tmpDir+Windows6.1-KB2834140-v2-x64.msu
os/install/installWindowsUpdate $absPath quiet false
os/administrative/stopService $wupSrvName
os/administrative/setServiceStartupMode $wupSrvName disabled
utils/fileSystem/removeDir $tmpDir

sendMessage \n\n
sendMessage Completed installing Microsoft updates
sendMessage Remove the $clv16AddSWPrint from the cd tray and close
// NOTE - This script is run as a part of the confWin2k8Common script
// A reboot is performed after that script completes
//sendMessage The changes performed in this script require a reboot
//sendMessage The system will be restarted after the "Enter" key is selected
//pause
//os/administrative/reboot
