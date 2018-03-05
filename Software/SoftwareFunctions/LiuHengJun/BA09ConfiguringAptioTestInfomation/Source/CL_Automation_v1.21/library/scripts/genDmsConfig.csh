//////////////////////////////////////////////////////////////////////////
// Script:  genDmsCfg.csh
// Purpose: Create the DMS configuration files based on the CentraLink
//			configuration
// Notes:   None
// Version: 1.0 Initial Release
//////////////////////////////////////////////////////////////////////////

#include commonCLv16.inc

$cfgFilePath = $__CFG_PATH__+genCfg.xml
$dmsCfgFilePath = $__DATA_PATH__+dmsInstrClass.xml

sendMessage \n
sendMessage Verify the appropriate CentraLink tables (.csv) files described in the $clv16Bulletin are located in the $__DATA_PATH__ directory
sendMessage \n
sendMessage Verify the $dmsCfgFilePath file defines each CentraLink instrument in the appropriate DMS instrument class. 
sendMessage \n
sendMessage NOTE - The files generated are based on the source data provided.
sendMessage Each file needs to be verified on the system and modified if necessary.
sendMessage \n
pause
centralink/config/dms/generateDmsV1ConfigFiles $__DATA_PATH__ $cfgFilePath
