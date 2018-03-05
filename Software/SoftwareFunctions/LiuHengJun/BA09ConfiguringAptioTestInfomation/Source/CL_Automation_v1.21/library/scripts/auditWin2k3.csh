//////////////////////////////////////////////////////////////////////////
// Script:  auditWin2K3.csh
// Purpose: Audit the Win2K3 OS for the upgrade to Win2K8
// Notes:   None
// Version: 1.0 Initial Release
//////////////////////////////////////////////////////////////////////////

#include commonCLv15Win2K8.inc
#include siteDataCLv15Win2K8.inc


sendMessage \n
utils/fileSystem/createDir $win2k3DataDir
sendMessage Querying the system for Operating System release information
os/system/releaseInfo
sendMessage The "name" must be "Microsoft(R) Windows(R) Server 2003, Standard Edition" in order to perform the upgrade
proceed?

sendMessage Querying the system for the Centralink Server Version
sendMessage The "majorVersion" must be "15" and the "minorVersion" must be "03" in order to perform the upgrade
centralink/administrative/serverVersion
proceed?

sendMessage \n\n
sendMessage If this server is currently using FTP to receive cytograms enter "yes" to the following prompt
sendMessage If this server does not currently use FTP to receive cytograms enter "no" to the following prompt
runScript? auditWin2k3Hematology

sendMessage \n\n
sendMessage If this server is currently using SRS enter "yes" to the following prompt
sendMessage If this server does not currently use SRS enter "no" to the following prompt
runScript? auditWin2k3Srs

sendMessage \n\n
sendMessage Setting the network identification data into the site data configuration file
os/system/networkId
utils/siteData/setHostName $host $siteDataPath
utils/siteData/setDomainName $domain $siteDataPath

sendMessage \n\n
sendMessage Saving OS specific data
os/system/saveNICConfDataToFile $win2k3IpConfigFilePath $siteDataPath
utils/fileSystem/copyFile C:\WINDOWS\system32\drivers\etc\hosts $win2k3DataDir
os/system/saveMappedDriveDataToFile $win2k3MappedDriveDataPath
os/system/saveScheduledTasksDataToFile $win2k3ScheduledTasksDataPath $win2k3DataDir

sendMessage \n\n
sendMessage Saving Siemens specific data
centralink/progress/saveProgressConfigToFile $win2k3ProgressConfigFilePath 
centralink/watchdog/copyConfigFilesToDir $win2k3CLWatchdogPath $win2k3DataDir

sendMessage \n\n
sendMessage Starting the printers applet
sendMessage $bulletinPrint for details to record all printer information
sendMessage When all data is recorded close the printers applet
sendMessage NOTE - It may take up to 20 seconds for control to return to this script after the printers applet is closed
//os/controlPanel/startPrintersAndFaxesApplet
os/controlPanel/win2k3/startPrintersApplet
pause

sendMessage \n\n
sendMessage Discuss any 3rd party software and locally validated drivers with customer
sendMessage Copy any needed files to the $win2k3DataDir directory
sendMessage $bulletinPrint for instructions on saving all files and information for 3rd party software
pause

sendMessage \n\n
sendMessage Create a Centralink database backup
sendMessage $bulletinPrint for instructions on creating a CentraLink database backup
sendMessage Close the Centralink UI when the backup has completed
centralink/administrative/startUI
pause

sendMessage \n\n
sendMessage Create an Acronis boot disk
sendMessage $bulletinPrint for instructions on creating an Acronis boot disk
os/administrative/archive/win2k3/startAcronisRescueMediaBuilder
sendMessage Close the Acronis UI when the operation has completed
pause

sendMessage \n\n
sendMessage Create an Acronis snapshot of the server 
sendMessage $bulletinPrint for instructions on creating an Acronis backup
os/administrative/archive/win2k3/startAcronisTrueImageOEM
sendMessage Close the Acronis UI when the operation has completed
pause

sendMessage \n\n
sendMessage Audit of Windows 2003 Operating System completed







	





