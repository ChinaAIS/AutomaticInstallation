//////////////////////////////////////////////////////////////////////////
// File: 	siteDataCLv15Win2K8.inc
// Purpose: Define all site specific variables
// Notes:   This file is to be edited by the service engineer on a site 
//			by site basis
// Version: 1.0 Initial Release
//////////////////////////////////////////////////////////////////////////


///////////////////////////////////////////////////////////////////////////////
[NETWORK]
$hostName = CENTRALINKSVR
$domainName = CENTRALINK

$nic1IfName = Local Area Connection
$nic1DHCP = no
$nic1IpAddress = 192.168.1.221
$nic1SubNetMask = 255.255.255.0
$nic1DefaultGateway = NULL
$nic1DnsServerList = NULL

$nic2IfName = Local Area Connection 2
$nic2DHCP = no
$nic2IpAddress = 10.0.0.1
$nic2SubNetMask = 255.255.255.0
$nic2DefaultGateway = NULL
$nic2DnsServerList = NULL

$nic3IfName = Local Area Connection 3
$nic3DHCP = no
$nic3IpAddress = 10.0.0.97
$nic3SubNetMask = 255.255.255.0
$nic3DefaultGateway = NULL
$nic3DnsServerList = NULL

////////////
// NOTE - This interface is only available on the HCS models
// If this is a new install uncomment (remove the '//') this block and set 
// the values defined for this interface
//$nic4IfName = Local Area Connection 4
//$nic4DHCP = no
//$nic4IpAddress = 172.0.0.1
//$nic4SubNetMask = 255.255.255.248
//$nic4DefaultGateway = NULL
//$nic4DnsServerList = NULL
///////////////////////////////////////////////////////////////////////////////


///////////////////////////////////////////////////////////////////////////////
[SRS]
$srsIpAddress = $nic3IpAddress
$lcmIpAddress = 10.0.0.99
$deviceModel = CentraLink
$deviceType = CentraLink
$materialNumber = 12345678
$serialNumber = DC12345678
$softwareVersion = 15.0.x-Server2008
///////////////////////////////////////////////////////////////////////////////


///////////////////////////////////////////////////////////////////////////////
[FIREWALL]
// All firewall port and ip addresses are to be entered as a csv list
// NOTE - All ranges must be seperated by a ',' WITHOUT whitespace
// between the entries 
// i.e $portRangeList = 100,101,102,103
//     $ipAddrRangeList = 192.168.1.201,192.168.1.202,192.168.1.203
$lisPorts = 8888
$lisUploadPorts = 20

////////////
// Instrument translators 
// If there are CentraLink instrument translators that act as the TCP
// server; i.e. use '-s' in the translator 'Specific options'.
// Uncomment the '$instServerTranslators' variable and assign each 
// translator server port in a CSV list format.
//$instServerTranslators = 10001,10002,etc
////////////

////////////
// FTP Client connections
// The following list represents the list of IP addresses that 
// require access to the FTP server.
// There are three components that require FTP access:
// 1.  SRS
//		  If SRS is being used the LCM IP address used to connect the  
//		  servers must be put into this list.
// 		  NOTE - Use the $lcmIpAddress for this value
// 2.  Hematology Instruments
//        If cytogram images are being sent to CentraLink the IP 
//        addresses of the instruments must be defined here.
// 3.  LMX LIS 
//		  If LMX LIS communication is required the IP addresses of those 
//		  servers must be defined here.
// Uncomment the '$ftpClientIpAddresses' variable and assign each 
// each Hematology and / or LMX LIS server IP address in a CSV list format.
// DO NOT REMOVE $lcmIpAddress from the list below, only add to it
//$ftpClientIpAddresses = $lcmIpAddress,192.168.1.200,192.168.1.201,etc
////////////

////////////
// Lab Automation System (LAS)
// Uncomment the '$lasPorts' variable for the appropriate LAS
// Aptio Automation uses ports 9001 & 9002 
// Advia Automation uses ports 19001 & 19002
// If a LAS is not being used at this site leave both variables commented
//$lasPorts = 9001,9002
//$lasPorts = 19001,19002
////////////

////////////
// Remote Desktop Services (RDS)
// If RDS clients are being used the IP addresses of those clients 
// must be defined here.
// Uncomment the '$rdsClientsIpAddresses' variable and assign each 
// each client IP address in a CSV list format.
//$rdsClientsIpAddresses = 192.168.1.200,192.168.1.201,etc
///////////////////////////////////////////////////////////////////////////////


///////////////////////////////////////////////////////////////////////////////
[CENTRALINK SCHEDULED TASKS]
$dbBackupTaskName = V15_ServerBackup_Task
$dbBackupSchedule = Daily
$dbBackupStartTime = 03:00:00

$copyDbToArchiveTaskName = V15_RemovableHD_Task
$copyDbToArchiveSchedule = Daily
$copyDbToArchiveStartTime = 03:30:00
///////////////////////////////////////////////////////////////////////////////


///////////////////////////////////////////////////////////////////////////////
[HEMATOLOGY]
// If hematology instruments are being used at this site 
// uncomment the "$cytogramDirList" variable and enter the directory name
// used for each instrument as defined in the "Specific options" section
// in a CSV list format.
// NOTE - If this site is being upgraded from the Windows 2003 operating
// system this variable will already be set with the correct values
$cytogramDirList = Advia2120_1,Advia2120_2,Advia2120_3,etc
///////////////////////////////////////////////////////////////////////////////

