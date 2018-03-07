import csv
import os
from tkinter import messagebox
import Common

centralinkPath = os.path.abspath(".") + "\Source\Centralink.lnk"
filelasc = os.path.abspath(".") + "\Source\lasc.csv"
fileinst = os.path.abspath(".") + "\Source\inst.csv"
exportTables = "Instrument, LASChannel"
CF = Common.CommonFuction()

# 导出CSV文件
def ExportInstrumentCSV():
    exportPath = os.path.abspath(".") + "\Source"
    CF.exportCSVFile(exportTables, exportPath)


# 判断LASChannel是否存在，如存在，则修改Inst文件的LASChannel信息
def UpdateCSV():
    n = 0
    LASChannelName = ""
    newLine = ""

    with open(filelasc) as csvfile1:
        readerlasc = csv.DictReader(csvfile1)
        for row1 in readerlasc:
            n += 1
            if n == 10:
                LASChannelName = row1["Name"]
    if LASChannelName != "":
        CF.replaceCSVFileStr(fileinst, "?,yes,?,?,?,Always", LASChannelName + ",yes,?,?,?,Always")
    else:
        messagebox.showinfo('提示','无LASChannel信息！')


CF.centralinkLogin(centralinkPath)
ExportInstrumentCSV()
UpdateCSV()
CF.importCSVFile(fileinst)
