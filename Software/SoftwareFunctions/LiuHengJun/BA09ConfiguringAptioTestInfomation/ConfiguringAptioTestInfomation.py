import os
import shutil
from time import sleep
import autoit
import Common


CF = Common.CommonFuction()
centralinkPath = os.path.abspath(".") + "\Source\Centralink.lnk"

#安装及初始化StreamlinedTool工具
def initStreamlinedTool():
    streamlinedInstallationToolPath = 'E:\CL_Automation_v1.21'
    destinationPath = os.path.abspath('.') + '\Source\CL_Automation_v1.21'
    lnkPath = 'E:\CL_Automation_v1.21\optional_genAptioConfig.lnk'
    initCLv16Path = 'E:\CL_Automation_v1.21\initCLv16_01.bat'
    if not os.path.exists(streamlinedInstallationToolPath):
        shutil.copytree(destinationPath, streamlinedInstallationToolPath)
    if not os.path.exists(lnkPath):
        autoit.send("#r")
        autoit.win_wait_active("Run")
        autoit.send(initCLv16Path)
        autoit.control_click("Run", "OK")
        autoit.win_wait_active('C:\Windows\system32\cmd.exe')
        sleep(4)
        autoit.send('{ENTER}')

#导出相关表数据
def exportAptioRelatedTables():
    exportTables = 'gp_Translator,Instrument,InstrumentTranslator,Method,Test'
    exportPath = 'E:\CL_Automation_v1.21\data'
    CF.exportCSVFile(exportTables, exportPath)

#执行StreamlinedTool工具中的相关功能
def execStreamlinedLnk():
    exePath = 'E:\CL_Automation_v1.21\optional_genAptioConfig.lnk'
    autoit.send("#r")
    autoit.win_wait_active("Run")
    autoit.send(exePath)
    autoit.control_click("Run", "OK")
    autoit.win_wait_active('optional_genAptioConfig')
    sleep(1)
    autoit.send('{ENTER}')
    sleep(2)
    autoit.send('{ENTER}')


initStreamlinedTool()
CF.centralinkLogin(centralinkPath)
exportAptioRelatedTables()
execStreamlinedLnk()

