//////////////////////////////////////////////////////////////////////////
// File: 	commonCLv15Win2K8.inc
// Purpose: Define values for common variables that do not need to be 
//			modified
// Notes:   This file is not to be edited by service engineers
// Version: 1.0 Initial Release
//////////////////////////////////////////////////////////////////////////

[File System]
$cdRomDrive = H:\
$siteDataPath = $__INCLUDE_PATH__+siteDataCLv15Win2K8.inc
$ftpRootPath = C:\inetpub\ftproot\
$win2k3SiemensRootPath = C:\Program Files\Siemens\
$win2k8SiemensRootPath = C:\Program Files (x86)\Siemens\
$winDriversPath = C:\Windows\System32\drivers\
$clRootInstallPath = D:\CentraLink\
$clBinPath = $clRootInstallPath+bin\


[Network]
$nicBindingOrder = "Local Area Connection,Local Area Connection 2,Local Area Connection 3"


[Centralink v15]
$watchdogConfFilePath = D:\CentraLink\Watchdog\conf
$clv15Bulletin = CentraLink StreamLined Installation and Startup (V15.0.3)
$bulletinPrint = Refer to the "$clv15Bulletin" bulletin 


[Services]
$autoUpdateServName = wuauserv
$timeServerServName = w32time
$i2iAgentServiceName = i2iAgent
$i2iVNCServiceName = i2i-vnc-service


[DLL Registration]
$autoUpdateDll = %windir%\system32\wups2.dll


[Scheduled Tasks]
$dbServerBackupTaskFileName = v15_ServerBackup_Task.bat
$dbServerBackupTaskSrcPath = $__DATA_PATH__+cldbBackupCmds\+$dbServerBackupTaskFileName
$dbServerBackupTaskDstPath = $clBinPath+$dbServerBackupTaskFileName

$copyDbToHDDTaskFileName = v15_RemovableHD_Task.bat
$copyDbToHDDTaskSrcPath = $__DATA_PATH__+cldbBackupCmds\+$dbServerBackupTaskFileName
$copyDbToHDDTaskDstPath = $clBinPath+$copyDbToHDDTaskFileName

$dbQuadHourlyTaskFileName = v15_QuadHourly_ServerBackup_Task.bat
$dbQuadHourlyServerBackupTaskSrcPath = $__DATA_PATH__+cldbBackupCmds\+$dbQuadHourlyTaskFileName
$dbQuadHourlyServerTaskDstPath = $clBinPath+$dbQuadHourlyTaskFileName

$dbClientBackupTaskName = V15_ClientBackup_Task.bat
$dbClientBackupTaskSrcPath = $__DATA_PATH__+cldbBackupCmds\+$dbClientBackupTaskName
$dbClientBackupTaskDstPath = $clBinPath+cldbBackupCmds\+$dbClientBackupTaskName

///////////////////////////////////////////////////////////////////////////////
// NOTE - This is currently not supported
//$startAppSystemOnLoginTaskName = StartCentralinkApplicationSystem
//$startAppSystemOnLoginPath = D:\CentraLink\bin\StartApplicationSystem.bat
//$startAppSystemOnLoginSchedule = ONLOGON
//$startAppSystemOnLoginStartTime = 03:30:00
///////////////////////////////////////////////////////////////////////////////


[Firewall]
$cerberusFirewallRuleName = Cerberus FTP Server
$iisFirewallRuleName = FTP Server (FTP Traffic-In)
$rdsFirewallRuleName = Remote Desktop (TCP-In)
$rdsRemoteFXRuleName = Remote Desktop - RemoteFX (TCP-In)
$watchdogRuleName = MIPS Watchdog
$watchdogRulePorts = 3500,27375


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


[Win2k3 Upgrade]
$win2k3DataDir = $__DATA_PATH__+Windows2003Config
$win2k3CLInstallPath = D:\CentraLink\
$win2k3CLWatchdogPath = $win2k3CLInstallPath+Watchdog\Conf\
$win2k3SRSInstallPath = $win2k3SiemensRootPath+$i2iAgentDir+\
$win2k3IpConfigFilePath = $win2k3DataDir+\IpConfigData.txt
$win2k3MappedDriveDataPath = $win2k3DataDir+\MappedDrives.txt
$win2k3ScheduledTasksDataPath = $win2k3DataDir+\ScheduledTasks.txt
$win2k3CytogramDirListPath = $win2k3DataDir+\CytogramDirs.txt
$win2k3ProgressConfigFilePath = $win2k3DataDir+\ProgressConfig.txt
$win2k3HostsDstFilePath = $win2k3DataDir+\hosts

