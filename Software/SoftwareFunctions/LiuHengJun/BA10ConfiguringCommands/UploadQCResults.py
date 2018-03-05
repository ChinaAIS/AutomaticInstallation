import os
import Common

CF = Common.CommonFuction()
centralinkPath = os.path.abspath(".") + "\Source\Centralink.lnk"
scriptPath = os.path.abspath(".") + r"\Source\Upload_QC_results\Import.txt"

CF.centralinkLogin(centralinkPath)
CF.importScriptFile(scriptPath)