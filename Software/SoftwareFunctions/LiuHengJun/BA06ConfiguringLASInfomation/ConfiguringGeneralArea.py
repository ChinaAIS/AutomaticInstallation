import csv
import os
import Common

CF = Common.CommonFuction()
centralinkPath = os.path.abspath('.') + '\Source\Centralink.lnk'
layoutPath = os.path.abspath('.') + '\Source\Layout.csv'
lsgaPath = os.path.abspath('.') + '\Source\lsga.csv'
lslnPath = os.path.abspath('.') + '\Source\lsln.csv'
importGeneralAreaPath = os.path.abspath('.') + '\Source\ImortLasGeneralArea.txt'

#根据layout相关内容生成lsga.csv(LAS general area)文件
def createlsgafile():
    with open(layoutPath,'r') as csvfile:
        reader = csv.DictReader(csvfile,delimiter=';')
        with open(lsgaPath,'w') as lsgaFile:
            fieldnames = ['Name','LASChannel.Name','Description','Type','EndOfRoute','ColdStorage']
            csvWrite = csv.DictWriter(lsgaFile, fieldnames=fieldnames)
            csvWrite.writeheader()
            for row in reader:
                if row['nodeType'] in ('IOM','RIM','ROM','BIM','RSM'):
                    csvWrite.writerow({'Name': row['canID'][1:], 'LASChannel.Name': 'Automation1', 'Description': row['nodeType'],
                                   'Type': 'Source-Output', 'EndOfRoute': 'yes', 'ColdStorage': 'no'})
                elif row['nodeType'] not in ('UTC','PSC'):
                    csvWrite.writerow({'Name': row['canID'][1:], 'LASChannel.Name': 'Automation1', 'Description': row['nodeType'],
                                       'Type': 'Source-Output', 'EndOfRoute': 'no', 'ColdStorage': 'no'})
    CF.replaceCSVFileByter(lsgaPath, b'\r\r', b'\r')

#根据lsga.csv文件生成lsln.csv(LAS Lanes)文件
def createlslnfile():
    with open(lsgaPath, 'r') as csvfile:
        reader = csv.DictReader(csvfile)
        with open(lslnPath,'w') as lslnFile:
            fieldnames = ['LASGeneralArea.Name','LASGeneralArea.LASChannel.Name','Name','Description','Type']
            csvWrite = csv.DictWriter(lslnFile, fieldnames=fieldnames)
            csvWrite.writeheader()
            for row in reader:
                if row['Description'] == 'IOM':
                        for i in range(1,21):
                            if i < 10:
                                csvWrite.writerow({'LASGeneralArea.Name':row['Name'],'LASGeneralArea.LASChannel.Name':'Automation1',
                                               'Name':'0' + str(i) , 'Description':'0' + str(i), 'Type':'Source-Output'})
                            else:
                                csvWrite.writerow({'LASGeneralArea.Name':row['Name'],'LASGeneralArea.LASChannel.Name':'Automation1',
                                                   'Name':i, 'Description':i, 'Type':'Source-Output'})
                elif row['Description'] == 'CM':
                    for i in range(1,5):
                        csvWrite.writerow({'LASGeneralArea.Name':row['Name'],'LASGeneralArea.LASChannel.Name':'Automation1',
                                               'Name':'0' + str(i) , 'Description':'0' + str(i), 'Type':'Source-Output'})
    CF.replaceCSVFileByter(lslnPath, b'\r\r', b'\r')



createlsgafile()
createlslnfile()
CF.centralinkLogin(centralinkPath)
CF.importScriptFile(importGeneralAreaPath)