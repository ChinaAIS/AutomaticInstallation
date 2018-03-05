import os
import Common

CF = Common.CommonFuction()
centralinkPath = os.path.abspath(".") + "\Source\Centralink.lnk"
scriptPath = os.path.abspath(".") + "\Source\Dispatch_to_LAS\Import.txt"

CF.centralinkLogin(centralinkPath)
CF.importScriptFile(scriptPath)