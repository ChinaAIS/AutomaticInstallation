import os
import Common

centralinkPath = os.path.abspath(".") + "\Source\Centralink.lnk"
CF = Common.CommonFuction()
# 导入LASProConfig文件
def ImportLASInfo():
    importfile = os.path.abspath(".")+"\Source\Automation Pre-Configuration\sslf_imp.txt"
    CF.importScriptFile(importfile)

CF.centralinkLogin(centralinkPath)
ImportLASInfo()