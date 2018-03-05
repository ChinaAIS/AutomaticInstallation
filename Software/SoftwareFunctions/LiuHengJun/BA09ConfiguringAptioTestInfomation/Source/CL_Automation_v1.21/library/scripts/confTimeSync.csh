//////////////////////////////////////////////////////////////////////////
// Script:  confTimeSync.csh
// Purpose: Configure server to act as an NTP server
// Notes:   None
// Version: 1.0 Initial Release
//////////////////////////////////////////////////////////////////////////


#include commonCLv16.inc


os/administrative/network/enableNTPServer
os/administrative/stopNetService $timeServerServName
os/administrative/startNetService $timeServerServName
sendMessage CentraLink server NTP configuration completed
sendMessage $bulletinPrint for instructions to configure the Aptio and other NTP clients



