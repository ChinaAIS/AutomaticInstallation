//////////////////////////////////////////////////////////////////////////
// Script:  enableRDSBasic.csh
// Purpose: Configure basic RDS (2 or less connections) 
// Notes:	None
// Version: 1.0 Initial Release
//////////////////////////////////////////////////////////////////////////

#include commonCLv16.inc
#include siteDataCLv16.inc


// Set the command references here
// If the variables are defined the following commands will be executed
&rdsClientsIpAddresses = os/administrative/network/firewall/setAllowedRDSClientsIpAddresses


sendMessage \n\n
sendMessage Enabling Remote Desktop Services (RDS) for basic (2 or less clients) functionality
os/customize/remoteDesktop/startRDSService
os/customize/remoteDesktop/enableRDS
os/administrative/network/firewall/enableFirewallRule $rdsFirewallRuleName
os/administrative/network/firewall/enableFirewallRule $rdsRemoteFXRuleName
&rdsClientsIpAddresses $rdsClientsIpAddresses $rdsFirewallRuleName

sendMessage \n\n
sendMessage Enabling basic Remote Desktop Services (RDS) has completed
sendMessage If more than 2 RDS clients are needed the license server will have to be configured
sendMessage $bulletinPrint for configuration of the licensing server

