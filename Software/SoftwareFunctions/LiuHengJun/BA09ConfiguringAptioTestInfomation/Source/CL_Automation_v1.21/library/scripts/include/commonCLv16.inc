//////////////////////////////////////////////////////////////////////////
// File: 	commonCLv16.inc
// Purpose: Define values for common variables that do not need to be 
//			modified for CentraLink v16
// Notes:   This file is not to be edited by service engineers
// Version: 1.0 Initial Release
//////////////////////////////////////////////////////////////////////////

[Release]
$srsDataStep = step_2_setSRSSpecificData
$labSpecDataStep = step_5_setLabSpecificData


[File System]
$cdRomDrive = H:\
$backupDbDrive = F:\
$siteDataPath = $__INCLUDE_PATH__+siteDataCLv16.inc
$ftpRootPath = C:\inetpub\ftproot\
$winDriversPath = C:\Windows\System32\drivers\
$win2k8SiemensRootPath = C:\Program Files (x86)\Siemens\
$siemensToolsPath = C:\ProgramData\Microsoft\Windows\Start Menu\Siemens Tools
$clStartMenuAppLnkPath = C:\ProgramData\Microsoft\Windows\Start Menu\Programs\CentraLink\
$clUtilDirName = CentralinkUtils
$clUtilsPath = $win2k8SiemensRootPath+$clUtilDirName\


[Network]
$nicBindingOrder = "Local Area Connection,Local Area Connection 2,Local Area Connection 3"


[Services]
$autoUpdateServName = wuauserv
$timeServerServName = w32time
$i2iAgentServiceName = i2iAgent
$i2iVNCServiceName = i2i-vnc-service


[DLL Registration]
$autoUpdateDll = %windir%\system32\wups2.dll


[Firewall]
$cerberusFirewallRuleName = Cerberus FTP Server
$iisFirewallRuleName = FTP Server (FTP Traffic-In)
$rdsFirewallRuleName = Remote Desktop (TCP-In)
$rdsRemoteFXRuleName = Remote Desktop - RemoteFX (TCP-In)


[SRS]
$i2iAgentDir = i2i Agent
$i2iVncDir = i2i VNC Server
$srsFtpRootPath = $win2k8SiemensRootPath+ftproot\
$softwareUpdateDir = $srsFtpRootPath+SoftwareUpdate
$fileUploadDir = $srsFtpRootPath+FileUpload
$i2iAgentInstallPath = $win2k8SiemensRootPath+$i2iAgentDir+\
$srsAgentCfgFileName = Agent.config
$srsPropDataFileName = PropertyData.xml
$srsDevSrcsFileName = DeviceDataSources.config
$srsCLPropDataFileName = CentraLinkPropertyInfoData.xml
$srsDevCmdsFileName = DeviceCommands.config
$srsAgentCfgFilePath = $i2iAgentInstallPath+$srsAgentCfgFileName
$srsPropDataFilePath = $i2iAgentInstallPath+$srsPropDataFileName
$srsDevSrcsFilePath = $i2iAgentInstallPath+$srsDevSrcsFileName
$srsCLPropDataFilePath = $i2iAgentInstallPath+$srsCLPropDataFileName
$srsDevCmdsFilePath = $i2iAgentInstallPath+$srsDevCmdsFileName
$i2iVncInstallPath = $win2k8SiemensRootPath+$i2iVncDir+\
$i2iVncPropsFileName = i2ivnc.props.ini
$i2iVncPropsFilePath = $i2iVncInstallPath+$i2iVncPropsFileName
$i2iVncAuthDataPwd = passwd=48F6A97D99A334976B
$i2iVncAuthDataPwd2 = passwd2=0000000030AB6D0048


[Centralink v16]
$clv16Bulletin = Installation and Startup CentraLink v16.0.1
$bulletinPrint = Refer to the "$clv16Bulletin" bulletin 
$clv16AddSWPrint = Centralink v16 Additional Software CD
$clv16OpGuideName = CntrLnkUsr.pdf
$clOpGuideLabel = Operators Guide
$clRootInstallPath = D:\CentraLink\
$clBinPath = $clRootInstallPath+bin\
$clDocPath = $clRootInstallPath+doc\

$watchdogPath = $clRootInstallPath+Watchdog\
$watchdogConfFilePath = $watchdogPath+conf\
$watchdogPropFileName = watchdog.dashboard.properties
$watchdogPropFilePath = $watchdogConfFilePath+$watchdogPropFileName
$watchdogReceiverPort = 0


[Scheduled Tasks]
$dbServerBackupTaskFileName = v16_ServerBackup_Task.bat
$dbServerBackupTaskSrcPath = $__DATA_PATH__+cldbBackupCmds\+$dbServerBackupTaskFileName
$dbServerBackupTaskDstPath = $clBinPath+$dbServerBackupTaskFileName

$copyDbToHDDTaskFileName = v16_RemovableHD_Task.bat
$copyDbToHDDTaskSrcPath = $__DATA_PATH__+cldbBackupCmds\+$dbServerBackupTaskFileName
$copyDbToHDDTaskDstPath = $clBinPath+$copyDbToHDDTaskFileName

$dbQuadHourlyTaskFileName = v16_QuadHourly_ServerBackup_Task.bat
$dbQuadHourlyServerBackupTaskSrcPath = $__DATA_PATH__+cldbBackupCmds\+$dbQuadHourlyTaskFileName
$dbQuadHourlyServerTaskDstPath = $clBinPath+$dbQuadHourlyTaskFileName

$dbClientBackupTaskFileName = v16_ClientBackup_Task.bat
$dbClientBackupTaskSrcPath = $__DATA_PATH__+cldbBackupCmds\+$dbClientBackupTaskFileName
$dbClientBackupTaskDstPath = $clBinPath+cldbBackupCmds\+$dbClientBackupTaskFileName

$clSchTskAppTrimNoonName = CentraLink16 AppServer trimming noon
$clSchTskAppTrimNightName = CentraLink16 AppServer trimming night

$delCytogramSchTaskFileName = CytogramDeleteCommand.bat
$delCytogramSchTaskSrcPath = $__DATA_PATH__+cldbBackupCmds\+$delCytogramSchTaskFileName 
$delCytogramSchTaskDstPath = $backupDbDrive+$delCytogramSchTaskFileName

///////////////////////////////////////////////////////////////////////////////
// NOTE - This is currently not supported
//$startAppSystemOnLoginTaskName = StartCentralinkApplicationSystem
//$startAppSystemOnLoginPath = D:\CentraLink\bin\StartApplicationSystem.bat
//$startAppSystemOnLoginSchedule = ONLOGON
//$startAppSystemOnLoginStartTime = 03:30:00
///////////////////////////////////////////////////////////////////////////////
