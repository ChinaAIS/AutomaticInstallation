//////////////////////////////////////////////////////////////////////////
// Script:  installCSP.csh
// Purpose: Install the CSP component
// Notes:   None
// Version: 1.0 Initial Release
//////////////////////////////////////////////////////////////////////////

#include commonCLv16.inc
#include siteDataCLv16.inc


$tmpDir = $__DATA_PATH__+_tmp_\
$archivePath = $cdRomDrive+csp\+csp.zip
$installPath = $win2k8SiemensRootPath+csp\
$cspBinName = OSPassManager.exe
$cspCpyBinPath = $tmpDir+$cspBinName
$cspCpyCfgPath = $tmpDir+OSPassManager.exe.config
$cspTaskPath = $installPath+$cspBinName
$schTaskUser = SYSTEM
$schTaskSchedule = DAILY
$schTaskTime = 01:00


sendMessage \n\n
sendMessage Installing CSP
sendMessage Insert the $clv16AddSWPrint in the cd tray and close
sendMessage NOTE - It may take up to 10 seconds to detect the media in the cd-rom
pause
utils/fileSystem/createDir $tmpDir
utils/fileSystem/createSecureDir $installPath SiemensService
utils/fileSystem/extractZipArchive $archivePath $tmpDir
utils/fileSystem/copyFile $cspCpyBinPath $installPath
utils/fileSystem/copyFile $cspCpyCfgPath $installPath
utils/fileSystem/removeDir $tmpDir

// NOTE - The serial number is now set as part of the SRS configuration step
// Leave the prompt here as a reference in case feedback wants this changed
//sendMessage \n\n
//$prompt = Enter the serial number of the CentraLink software kit
//getUserInput? _NULL_ _NULL_ $prompt _TRUE_
//system/software/setCentraLinkSerialNumber $__LAST_USER_RESPONSE__
system/software/setCentraLinkSerialNumber $clSerialNumber

os/administrative/createScheduledTask SiemensSMG_Daily $cspTaskPath $schTaskSchedule $schTaskTime $schTaskUser
os/administrative/createOnStartupTask SiemensSMG_OnStartUp $cspTaskPath $schTaskUser

sendMessage \n\n
sendMessage Installing CSP has completed
sendMessage Remove the $clv16AddSWPrint from the cd tray and close


