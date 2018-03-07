//////////////////////////////////////////////////////////////////////////
// Script:  genAptioCfg.csh
// Purpose: Create the Aptio configuration files based on the CentraLink
//			configuration
// Notes:   None
// Version: 1.0 Initial Release
//////////////////////////////////////////////////////////////////////////

#include commonCLv16.inc

$cfgFilePath = $__CFG_PATH__+genCfg.xml

sendMessage \n
sendMessage Verify the appropriate CentraLink tables (.csv) files described in the $clv16Bulletin are located in the $__DATA_PATH__ directory
sendMessage \n
sendMessage NOTE - The files generated are based on the source data provided.
sendMessage Each file needs to be verified on the system and modified if necessary.
sendMessage \n
pause
centralink/config/aptio/generateAptioV1ConfigFiles $__DATA_PATH__ $cfgFilePath
