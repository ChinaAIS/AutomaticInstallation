//////////////////////////////////////////////////////////////////////////
// Script:  auditWin2K3Hematology.csh
// Purpose: Audit the Win2K3 OS for Hematology data
// Notes:   None
// Version: 1.0 Initial Release
//////////////////////////////////////////////////////////////////////////

#include commonCLv15Win2K8.inc
#include siteDataCLv15Win2K8.inc

$srsAgentCfgPath = $win2k3SRSInstallPath+$srsAgentCfgFileName
$srsPropDataCfgPath = $win2k3SRSInstallPath+$srsPropDataFileName

sendMessage \n\n
sendMessage Saving Siemens Hematology specific data
utils/siteData/setHematologyDirList $ftpRootPath $win2k3CytogramDirListPath $siteDataPath

sendMessage \n\n
sendMessage Audit of Windows 2003 Hematology data completed
