//////////////////////////////////////////////////////////////////////////
// Script:  installIE11.csh
// Purpose: Install IE11 
// Notes:   This script assumes the IE11 installer is 
//			zipped up and stored on the 'Additional Software' cd 
// Version: 1.0 Initial Release
//////////////////////////////////////////////////////////////////////////

#include commonCLv16.inc

$tmpDir = $__DATA_PATH__+_tmp_\
$archivePath = $cdRomDrive+ms_updates\ie11_installer.zip

sendMessage \n\n
sendMessage Installing IE v11
sendMessage Insert the $clv16AddSWPrint in the cd tray and close
sendMessage NOTE - It may take up to 10 seconds to detect the media in the cd-rom
pause
utils/fileSystem/createDir $tmpDir
utils/fileSystem/extractZipArchive $archivePath $tmpDir

// NOTE - IE11 requires Microsoft updates to be installed before IE11 can be installed.  
// These updates require a reboot or IE11 install will fail so the updates are installed
// in an earlier script that already required a reboot.
$absPath = $tmpDir+IE11-Windows6.1-x64-en-us.exe
os/install/installExe $absPath
utils/fileSystem/removeDir $tmpDir

sendMessage \n\n
sendMessage Completed installing IE v11
sendMessage Remove the $clv16AddSWPrint from the cd tray and close
// NOTE - This script is run as a part of the postCentraLinkInstall script
// A reboot is performed after that script completes
//sendMessage The changes performed in this script require a reboot
//sendMessage The system will be restarted after the "Enter" key is selected
//pause
//os/administrative/reboot
