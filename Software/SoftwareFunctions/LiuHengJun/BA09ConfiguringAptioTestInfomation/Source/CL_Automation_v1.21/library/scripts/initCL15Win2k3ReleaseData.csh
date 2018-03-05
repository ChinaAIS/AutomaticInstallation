//////////////////////////////////////////////////////////////////////////
// Script:  initCL15Win2k3ReleaseData.csh
// Purpose: Initialize the system for Centralink v15 win2k8 operations
// Notes:	None
// Version: 1.0 Initial Release
//////////////////////////////////////////////////////////////////////////

$releaseFilePath = $__CFG_PATH__+release.xml
utils/management/setReleaseData clv15_03_win2k3 $releaseFilePath
sendMessage Successfully initialized system for Centralink v15 Win2k3 operations
