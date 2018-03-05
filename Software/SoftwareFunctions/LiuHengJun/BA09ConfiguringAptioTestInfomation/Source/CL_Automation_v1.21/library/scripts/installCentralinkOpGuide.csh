//////////////////////////////////////////////////////////////////////////
// Script:  installCentralinkOpGuide.csh
// Purpose: Invokes the installer for Centralink Operators Guide
// Notes:	None
// Version: 1.0 Initial Release
//			1.1 Complete rewrite for the latest Op Guide installer
//////////////////////////////////////////////////////////////////////////

#include commonCLv16.inc

$readerUpdateDirName = AdbeRdrUpd11016

sendMessage \n\n
sendMessage Insert the Centralink Operator Guide installation cd in the tray and close
sendMessage NOTE - It may take up to 10 seconds to detect the media in the cd-rom
pause

// Retrieve the required language and copy the PDF file
sendMessage \n\n
utils/fileSystem/listDirectories $cdRomDrive $readerUpdateDirName
sendMessage \n\n
$prompt = Choose the appropriate language from the list: $entries
getUserInput? $entries , $prompt
$opGuideAbsPath = $cdRomDrive+$__LAST_USER_RESPONSE__+\Operators Guide\+$clv16OpGuideName
centralink/docs/copyOpGuide $opGuideAbsPath

// Install Adobe Reader for the selected language
$readerPath = $cdRomDrive+$__LAST_USER_RESPONSE__+\Adobe\
// NOTE - The op guide media will only have the installer executable in the 'Adobe' directory
utils/fileSystem/listFiles $readerPath
$readerAbsPath = $readerPath+$entries
sendMessage \n\n
sendMessage Invoking the Adobe Reader installer
sendMessage $bulletinPrint for installation instructions for the Adobe Reader
centralink/install/installOpGuideReader $readerAbsPath
sendMessage Once installation is completed select the "Enter" key
pause

// Install the Adobe Reader update
$updatePath = $cdRomDrive+$readerUpdateDirName+\
// NOTE - The op guide media will only have the update installer executable in the update directory
utils/fileSystem/listFiles $updatePath
$updateAbsPath = $updatePath+$entries
sendMessage \n\n
sendMessage Invoking the Adobe Reader update installer 
sendMessage $bulletinPrint for installation instructions for the Adobe Reader Update
centralink/install/installOpGuideReader $updateAbsPath
sendMessage Once installation is completed select the "Enter" key
pause

sendMessage \n\n
sendMessage Remove the Centralink Operator Guide installation cd in the tray and close
sendMessage Installing Centralink Operator Guide has completed


// NOTE - This script is being called in the post install script so let that
// script reboot the server when everything is completed.
//sendMessage \n\n
//sendMessage sendMessage Configuration of the CentraLink server has completed.
//sendMessage The changes performed in this script require a reboot
//sendMessage The system will be restarted after the "Enter" key is selected
//pause
//os/administrative/reboot
