from time import sleep
import autoit

class CommonFuction(object):

    def __init__(self):
        pass

    # Centralink登录
    def centralinkLogin(self, centralinkPath):
        #判断程序是否运行
        if autoit.win_exists("CentraLink"):
            autoit.win_activate("CentraLink")
            if autoit.win_active(" CentraLink - Timeout, please re-login"):
                autoit.control_send(" CentraLink - Timeout, please re-login", "Edit4", "sysman")
                autoit.control_send(" CentraLink - Timeout, please re-login", "Edit2", "Advia1")
                autoit.control_click(" CentraLink - Timeout, please re-login", "OK")
                sleep(1)
                if autoit.win_active(" Maintenance session"):
                    autoit.control_send(" Maintenance session", "Edit1", "Auto Login")
                    autoit.control_click(" Maintenance session", "OK")
            autoit.send("{ESC 5}")
        else:
            autoit.send("#r")
            autoit.win_wait_active("Run")
            autoit.send(centralinkPath)
            autoit.control_click("Run", "OK")
            autoit.win_wait_active(" CentraLink - Login")
            autoit.control_send(" CentraLink - Login", "Edit4", "sysman")
            autoit.control_send(" CentraLink - Login", "Edit2", "Advia1")
            autoit.control_click(" CentraLink - Login", "OK")
            while autoit.win_active("CentraLink") == 0:
                sleep(1)
                if autoit.win_active("Information"):
                    autoit.control_click("Information", "OK")
            sleep(6)
            if autoit.win_active(" Maintenance session"):
                autoit.control_send(" Maintenance session", "Edit1", "Auto Login")
                autoit.control_click(" Maintenance session", "OK")

    #导入脚本文件
    def importScriptFile(self, importPath):
        autoit.win_activate("CentraLink")
        autoit.send("!S S D I")
        autoit.win_wait_active("CentraLink", text="Import")
        autoit.control_click("CentraLink", "&Use script")
        autoit.control_send("CentraLink", "Edit6", importPath)
        autoit.control_click("CentraLink", "OK")
        sleep(2)
        autoit.win_wait_active("CentraLink", text="Database import")
        sleep(2)
        autoit.send("{ESC 5}")

    #导入CSV文件
    def importCSVFile(self, importPath):
        autoit.win_activate("CentraLink")
        autoit.send("!S S D I")
        autoit.win_wait_active("CentraLink", text="Import")
        autoit.control_send("CentraLink", "Edit4", importPath)
        autoit.control_click("CentraLink", "OK")
        sleep(2)
        autoit.win_wait_active("Information")
        sleep(0.5)
        autoit.control_click("Information", "OK")
        autoit.send("{ESC 5}")

    # 导出CSV文件
    def exportCSVFile(self, exportTables, exportPath):
        autoit.win_activate("CentraLink")
        autoit.send("!S S D E")
        autoit.win_wait_active("CentraLink", text="Export")
        autoit.control_send("CentraLink", "Edit4", exportTables)
        autoit.control_send("CentraLink", "Edit2", "{DELETE 20}")
        autoit.control_send("CentraLink", "Edit2", exportPath)
        autoit.control_click("CentraLink", "OK")
        sleep(3)
        autoit.send("{ESC 5}")

    # 替换CSV文件中相关字符串
    def replaceCSVFileStr(self, filePath, old, new):
        with open(filePath, "r") as csvfile:
            lines = csvfile.read()
            newLine = lines.replace(old, new)
        with open(filePath, "w") as csvfile:
            csvfile.write(newLine)

    # 替换CSV文件中相关字节
    def replaceCSVFileByter(self, filePath, old, new):
        with open(filePath, "rb") as csvfile:
            lines = csvfile.read()
            newLine = lines.replace(old, new)
        with open(filePath, "wb") as csvfile:
            csvfile.write(newLine)

