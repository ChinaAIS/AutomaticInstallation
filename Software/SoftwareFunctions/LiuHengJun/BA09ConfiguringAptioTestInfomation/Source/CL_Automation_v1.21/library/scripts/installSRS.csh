//////////////////////////////////////////////////////////////////////////
// Script:  installSRS.csh
// Purpose: Install and configure the i2i agent and i2i vnc service
// Notes:	None
// Version: 1.0 Initial Release
//			1.1 Added VNC authentication configuration
//////////////////////////////////////////////////////////////////////////

#include commonCLv16.inc
#include siteDataCLv16.inc

// Install related variables
$tmpDir = $__DATA_PATH__+_tmp_\
$i2iAgentInstallImagePath = $cdRomDrive+i2i Agent-2.1.3.1.zip
$i2iVncServerInstallImagePath = $cdRomDrive+i2i VNC Server 2.1.4.zip
$i2iAgentExePath = $win2k8SiemensRootPath+i2i Agent\Siemens.DX.Informatics.I2I.agent.exe
$i2iVncExePath = $win2k8SiemensRootPath+i2i VNC Server\i2ivnc.exe

// FTP related variables
$srsFtpSiteName = i2iFTP
$ftpDataFile = i2iFtpSiteData.xml
$ftpSrcFile = $__DATA_PATH__+$ftpDataFile
$ftpDstFile = $tmpDir+$ftpDataFile

// Config file related variables
$agentFilePath = $cdRomDrive+$srsAgentCfgFileName
$propertyFilePath = $cdRomDrive+$srsPropDataFileName
$deviceFilePath = $cdRomDrive+$srsDevSrcsFileName
$propInfoFilePath = $cdRomDrive+$srsCLPropDataFileName


sendMessage \n\n
sendMessage The following variables will be set during this script
getvar $lcmIpAddress $deviceModel $deviceType $materialNumber $serialNumber $softwareVersion
sendMessage \n
sendMessage If any of these variables are set incorrectly do not continue with the script.
sendMessage Refer to the site data file by selecting the $srsDataStep shortcut in the $__ROOT_PATH__ directory to modify the variables.
proceed?

sendMessage \n\n
sendMessage Installing the i2i agent and i2i vnc services
utils/fileSystem/createDir $tmpDir
sendMessage Insert the Siemens Remote Service with the CentraLink System V. 1.0 in the cd tray and close
sendMessage NOTE - It may take up to 10 seconds to detect the installers in the cd-rom
pause
srs/install/installI2IAgent $i2iAgentInstallImagePath $tmpDir
srs/install/installI2IVNCService $i2iVncServerInstallImagePath $tmpDir
sendMessage Installation completed

sendMessage \n\n
sendMessage Setting firewall permissions for the $i2iAgentServiceName and $i2iVNCServiceName OS services
srs/config/setFirewallPermissions $i2iAgentExePath $i2iVncExePath 
srs/config/setLcmFtpFirewallPermission $lcmIpAddress
sendMessage Setting firewall permissions completed
sendMessage Configuring I2I agent 
// NOTE - The "DeviceCommands.config" file located on the root of the cd and installed by i2i agent
// is identical so it will not be copied here
utils/fileSystem/copyFile $agentFilePath $i2iAgentInstallPath
utils/fileSystem/copyFile $deviceFilePath $i2iAgentInstallPath
utils/fileSystem/copyFile $propInfoFilePath $i2iAgentInstallPath
utils/fileSystem/copyFile $propertyFilePath $i2iAgentInstallPath
srs/config/setLcmIpAddress $lcmIpAddress $srsAgentCfgFilePath
srs/config/setSoftwareUpdatePath $softwareUpdateDir $srsAgentCfgFilePath
srs/config/setFileUploadPath $fileUploadDir $srsAgentCfgFilePath
srs/config/setDeviceModel $deviceModel $srsPropDataFilePath
srs/config/setDeviceType $deviceType $srsPropDataFilePath
srs/config/setMaterialNumber $materialNumber $srsPropDataFilePath
srs/config/setSerialNumber $serialNumber $srsPropDataFilePath
srs/config/setSoftwareVersion $softwareVersion $srsPropDataFilePath
srs/config/setPropertyInfoPath $i2iAgentInstallPath $srsDevSrcsFilePath
srs/config/setPropertyFilePath $i2iAgentInstallPath $srsDevSrcsFilePath
sendMessage Configuring I2I agent completed

sendMessage Configuring I2I VNC server
srs/config/vnc/enableVNCAuthentication $i2iVncPropsFilePath
srs/config/vnc/addVNCAuthentication $i2iVncPropsFilePath $i2iVncAuthDataPwd
srs/config/vnc/addVNCAuthentication $i2iVncPropsFilePath $i2iVncAuthDataPwd2
sendMessage Configuring I2I VNC server completed

sendMessage \n\n
sendMessage Enter the user name and password information to create the SRS user
sendMessage $bulletinPrint for the user name and password to use when creating this user
usercredentials?
os/usersAndGroups/createUser $****USER_NAME**** $****USER_PASS**** 
os/usersAndGroups/setUserPasswordExpiration $****USER_NAME**** false
os/usersAndGroups/disableUserInteractiveLogon $****USER_NAME****

sendMessage Initializing the FTP server
utils/fileSystem/createDir $softwareUpdateDir
utils/fileSystem/createDir $fileUploadDir
utils/fileSystem/setUserDirFullControl $****USER_NAME**** $softwareUpdateDir
utils/fileSystem/setUserDirFullControl $****USER_NAME**** $fileUploadDir
utils/fileSystem/copyFile $ftpSrcFile $tmpDir
srs/config/setFTPServerParms $srsFtpSiteName $srsIpAddress $srsFtpRootPath $ftpDstFile
os/administrative/roles/installFTPServer $srsFtpSiteName $****USER_NAME**** $ftpDstFile
sendMessage Initializing the FTP server completed

sendMessage Configuring the $i2iAgentServiceName and $i2iVNCServiceName services 
os/administrative/startService $i2iAgentServiceName
os/administrative/startService $i2iVNCServiceName
utils/fileSystem/removeDir $tmpDir
sendMessage \n\n
sendMessage Remove the Siemens Remote Service with the CentraLink System V. 1.0 cd from the tray
sendMessage \n\n
sendMessage If the CentraLink server is going to be stored in a data center enter "yes" to the following prompt else enter "no".
runScript? enableI2IVNCHostMode
sendMessage SRS installation completed
