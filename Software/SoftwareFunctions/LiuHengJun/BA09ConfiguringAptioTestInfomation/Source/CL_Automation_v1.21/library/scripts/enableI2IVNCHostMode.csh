//////////////////////////////////////////////////////////////////////////
// Script:  enableVNCHostMode.csh
// Purpose: Configures the SRS VNC service to run in host mode
// Notes:	None
// Version: 1.0 Initial Release
//////////////////////////////////////////////////////////////////////////

#include commonCLv16.inc


sendMessage Configuring the SRS I2I VNC service to run in host mode
os/administrative/stopService $i2iVNCServiceName
os/administrative/setServiceStartupMode $i2iVNCServiceName disabled
runScript installSiemensTools
sendMessage Completed configuring the SRS I2I VNC service to run in host mode
