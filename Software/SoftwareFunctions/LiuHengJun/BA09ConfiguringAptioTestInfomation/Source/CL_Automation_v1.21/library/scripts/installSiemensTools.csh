//////////////////////////////////////////////////////////////////////////
// Script:  installSiemensTools.csh
// Purpose: Install and configure Siemens tools
// Notes:	None
// Version: 1.0 Initial Release
//////////////////////////////////////////////////////////////////////////

#include commonCLv16.inc

$archivePath = $cdRomDrive+siemens_tools\+Siemens Tools.zip


sendMessage \n\n
sendMessage Installing Siemens Tools
sendMessage Insert the $clv16AddSWPrint in the cd tray and close
sendMessage NOTE - It may take up to 10 seconds to detect the media in the cd-rom
pause
utils/fileSystem/extractZipArchive $archivePath $siemensToolsPath

sendMessage \n\n
sendMessage Completed installing Siemens Tools
sendMessage Remove the $clv16AddSWPrint from the cd tray and close


