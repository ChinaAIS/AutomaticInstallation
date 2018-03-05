import os
import Common

CF = Common.CommonFuction()
centralinkPath = os.path.abspath(".") + "\Source\Centralink.lnk"
scriptPath = os.path.abspath(".") + "\Source\QC_Purge\Import.txt"

CF.centralinkLogin(centralinkPath)
CF.importScriptFile(scriptPath)