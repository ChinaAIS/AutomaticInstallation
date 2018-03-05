//////////////////////////////////////////////////////////////////////////
// Script:  installDMSHematology.csh
// Purpose: Configures the system for integration with DMS Hematology
// Notes:	None
// Version: 1.0 Initial Release
//////////////////////////////////////////////////////////////////////////

#include commonCLv16.inc

$dmsMapDriveBatFileName = mapDmsHemaDrive.bat
$dmsUnMapDriveBatFileName = unmapDmsHemaDrive.bat
$dmsRunMapDriveSchTaskBatName = runMapDmsHemaDriveSchTask.bat
$dmsRunUnMapDriveSchTaskBatName = runUnMapDmsHemaDriveSchTask.bat
$dmsMapDriveBatFilePath = $clUtilsPath+$dmsMapDriveBatFileName
$dmsUnMapDriveBatFilePath = $clUtilsPath+$dmsUnMapDriveBatFileName
$dmsRunMapDriveSchTaskPath = $clUtilsPath+$dmsRunMapDriveSchTaskBatName
$dmsRunUnMapDriveSchTaskPath = $clUtilsPath+$dmsRunUnMapDriveSchTaskBatName

$clLnkRunMapDriveName = MapDMSHemaDrive.lnk
$clLnkRunUnMapDriveName = UnMapDMSHemaDrive.lnk
$clMapDriveLnkPath = $clStartMenuAppLnkPath+$clLnkRunMapDriveName
$clUnMapDriveLnkPath = $clStartMenuAppLnkPath+$clLnkRunUnMapDriveName

$dmsRunMapDriveSchTaskName = CentraLink_Map_DMS_Hema_Drive
$dmsRunUnMapDriveSchTaskName = CentraLink_UnMap_DMS_Hema_Drive
$dmsHemaDriveDevName = Q:
$schTaskUser = SYSTEM
$schTaskOnceTimeStamp = 00:00:00
$schTaskOnceDateStamp = 01/01/2000

sendMessage Configuring system for DMS Hematology integration
utils/fileSystem/createDir $clUtilsPath
utils/fileSystem/createFile $dmsMapDriveBatFilePath
utils/fileSystem/createFile $dmsUnMapDriveBatFilePath
utils/fileSystem/createFile $dmsRunMapDriveSchTaskPath
utils/fileSystem/createFile $dmsRunUnMapDriveSchTaskPath

utils/fileSystem/appendToFile $dmsMapDriveBatFilePath '@echo off'
utils/fileSystem/appendToFile $dmsUnMapDriveBatFilePath '@echo off'
utils/fileSystem/appendToFile $dmsRunMapDriveSchTaskPath '@echo off'
utils/fileSystem/appendToFile $dmsRunUnMapDriveSchTaskPath '@echo off'
utils/fileSystem/appendToFile $dmsRunMapDriveSchTaskPath 'schtasks.exe /run /tn $dmsRunMapDriveSchTaskName'
utils/fileSystem/appendToFile $dmsRunUnMapDriveSchTaskPath 'schtasks.exe /run /tn $dmsRunUnMapDriveSchTaskName'

sendMessage Configuring the DMS Samba share configuration
$prompt = Enter the UNC path to the DMS Samba share
getUserInput? _NULL_ _NULL_ $prompt _TRUE_
$dmsSmbSvrPath = $__LAST_USER_RESPONSE__
sendMessage \n\n
sendMessage Enter the DMS Samba user name and password information for the DMS Samba share
sendMessage $bulletinPrint for the user name and password to use for this Samba share
usercredentials?
utils/fileSystem/appendToFile $dmsMapDriveBatFilePath 'net use $dmsHemaDriveDevName $dmsSmbSvrPath /user:$****USER_NAME**** $****USER_PASS**** /persistent:yes'
utils/fileSystem/appendToFile $dmsUnMapDriveBatFilePath 'net use $dmsHemaDriveDevName /delete'

utils/fileSystem/createShortcut $clMapDriveLnkPath $dmsRunMapDriveSchTaskPath
utils/fileSystem/createShortcut $clUnMapDriveLnkPath $dmsRunUnMapDriveSchTaskPath
os/administrative/createOnStartupTask $dmsRunMapDriveSchTaskName $dmsMapDriveBatFilePath $schTaskUser
// The UnMap task is created so unmapping the drive can be executed on demand by the user if required
// There is no need to run this task unless on demand so it is set to run in the past
os/administrative/createOneTimeTask $dmsRunUnMapDriveSchTaskName $dmsUnMapDriveBatFilePath $schTaskOnceTimeStamp $schTaskOnceDateStamp $schTaskUser
sendMessage \n\n
sendMessage Configuring system for DMS Hematology has completed
