//////////////////////////////////////////////////////////////////////////
// Script:  initCL16ReleaseData.csh
// Purpose: Initialize the system for Centralink v16 operations
// Notes:	None
// Version: 1.0 Initial Release
//////////////////////////////////////////////////////////////////////////

$releaseFilePath = $__CFG_PATH__+release.xml
utils/management/setReleaseData clv16_01 $releaseFilePath
sendMessage Successfully initialized system for Centralink v16 operations
