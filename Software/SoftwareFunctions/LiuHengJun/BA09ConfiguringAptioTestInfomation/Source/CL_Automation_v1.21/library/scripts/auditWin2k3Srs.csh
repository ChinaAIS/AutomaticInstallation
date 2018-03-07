//////////////////////////////////////////////////////////////////////////
// Script:  auditWin2K3Srs.csh
// Purpose: Audit the Win2K3 OS for SRS data
// Notes:   None
// Version: 1.0 Initial Release
//////////////////////////////////////////////////////////////////////////

#include commonCLv15Win2K8.inc
#include siteDataCLv15Win2K8.inc

$srsAgentCfgPath = $win2k3SRSInstallPath+$srsAgentCfgFileName
$srsPropDataCfgPath = $win2k3SRSInstallPath+$srsPropDataFileName


sendMessage \n\n
sendMessage Saving Siemens SRS specific data
srs/config/copyConfigFilesToDir $win2k3SRSInstallPath $win2k3DataDir
utils/fileSystem/fileManipulation/getTokensInFile $srsAgentCfgPath 'server address="(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})"'
utils/siteData/srs/setLcmIpAddress $csvTokenList $siteDataPath
utils/fileSystem/fileManipulation/getTokensInFile $srsPropDataCfgPath name="DX-DeviceModel"\s+value="(\w+)"
utils/siteData/srs/setDeviceModel $csvTokenList $siteDataPath
utils/fileSystem/fileManipulation/getTokensInFile $srsPropDataCfgPath name="DX-DeviceType"\s+value="(\w+)"
utils/siteData/srs/setDeviceType $csvTokenList $siteDataPath
utils/fileSystem/fileManipulation/getTokensInFile $srsPropDataCfgPath name="DX-MaterialNumber"\s+value="(\w+)"
utils/siteData/srs/setMaterialNumber $csvTokenList $siteDataPath
utils/fileSystem/fileManipulation/getTokensInFile $srsPropDataCfgPath name="DX-SerialNumber"\s+value="(\w+)"
utils/siteData/srs/setSerialNumber $csvTokenList $siteDataPath
utils/fileSystem/fileManipulation/getTokensInFile $srsPropDataCfgPath name="DX-SoftwareVersion"\s+value="([^\r\n]+)"
utils/siteData/srs/setSoftwareVersion $csvTokenList $siteDataPath

sendMessage \n\n
sendMessage Audit of Windows 2003 SRS data completed

