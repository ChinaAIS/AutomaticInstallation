import os
import Common

CF = Common.CommonFuction()
centralinkPath = os.path.abspath(".") + "\Source\Centralink.lnk"
scriptPath = os.path.abspath(".") + "\Source\Purge_data\Import.txt"

CF.centralinkLogin(centralinkPath)
CF.importScriptFile(scriptPath)