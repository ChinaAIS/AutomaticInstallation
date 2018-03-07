//////////////////////////////////////////////////////////////////////////
// Script:  enableRDSLicenseServer.csh
// Purpose: Enable the RDS License Server
// Notes:	This script only enables the RDS license service for the role.
//			The license activation needs to be performed manually.
// Version: 1.0 Initial Release
//////////////////////////////////////////////////////////////////////////

#include commonCLv16.inc

sendMessage \n\n
sendMessage Enabling the Remote Desktop Services (RDS) License Server
os/administrative/roles/services/installRDSLicenseServer
sendMessage \n\n
sendMessage Enabling the Remote Desktop Services (RDS) License Server has completed
sendMessage $bulletinPrint for activation and configuration of the licensing server

