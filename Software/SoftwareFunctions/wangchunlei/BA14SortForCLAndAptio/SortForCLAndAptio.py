# -*- coding: utf-8 -*-

import autoit;
import os,sys,time,datetime;

#--------参数定义--------
#---主窗体标题---
title=''
#---子窗体标题-----
text=''
#---超时时间-----
timeout=0
#---日志路径--
logpath = sys.path[0] + '\\Log\\'
#---文件路径---
baseline= sys.path[0] 
#---目标testfile路径----
#sortfliepath = '\\\\192.168.1.200\\Sorting-Tests.ini'
sortfliepath = '\\\\VBOXSVR\\f_drive\\Works\\Pythonlearn1\\src\\SortForCLAndAptio\\import\\Sorting-Tests.ini'
#---源testfile路径----
testfliepath = sys.path[0] + '\\import\\Sorting-Tests1.ini'


#------导入数据文件-------------
def importscvdatabase(baseline):

    winwaitactivate("CentraLink")
    autoit.send("{ESC 3}")
    autoit.send("!S S D I")                                           
    winwaitactivate("CentraLink",text="Import")
    autoit.control_command("CentraLink","Button5","Check",text="&Use script") 
    autoit.send("{TAB}")
    autoit.send(baseline + "\\import" + "\\sslf_imp.txt")
    printlog(baseline + "\\import" + "\\sslf_imp.txt" + " Start importing")
    winwaitactivate("CentraLink",text="Import")
    autoit.control_command("CentraLink","Button7","Check",text="OK")              
    winwaitactivate("CentraLink",text="Database import")
    time.sleep(2)
    autoit.control_command("CentraLink","Button2","Check",text="&Close")
    printlog(baseline + "\\import" + "\\sslf_imp.txt" + " imported successfully")     
    autoit.send("{ESC 3}")

#--------

#---------显示并记录日志文件---------
def printlog(text):  #同步显示及记录日志文件
    try:
        os.mkdir(logpath)
    except:
        pass
    print (str(text))
    logfile = open(logpath+"/"+curtime("date")+'.txt','a+')
    logfile.write(curtime("datetime")+" "+str(text)+'\n')
    logfile.close()
#------------------------------------

#--------
def winwaitactivate(title,**kwargs):
    autoit.win_wait(title,**kwargs)
    if not autoit.win_activate(title,**kwargs):
        autoit.win_activate(title,**kwargs)
    autoit.win_wait_active(title,**kwargs)
#----------


#----------取日期及时间函数---------
def curtime(par):
    time.sleep(0.01) #避免取到一样的时间
    time1 = time.strftime("%Y%m%d%H%M%S",time.localtime(time.time()))+"."+str(datetime.datetime.now().microsecond)[0:3]
    if par == "date":  #2017-01-01
        time1 = time1[0:4]+"-"+time1[4:6]+"-"+time1[6:8]
    if par == "datetime":  #2017-01-01 01:01:01
        time1 = time1[0:4]+"-"+time1[4:6]+"-"+time1[6:8]+" "+time1[8:10]+":"+time1[10:12]+":"+time1[12:18]
    if par == "datetimed":  #20170101020202123
        time1 = time.strftime("%Y%m%d%H%M%S",time.localtime(time.time()))+str(datetime.datetime.now().microsecond)[0:3]
    if par == "second":
        time1 = str(time.time()).split(".")[0]   #从1970年至今的秒数
    return time1
#-----------------------------------

#-----------写入sort项目------------
def writetest():    
    with open(testfliepath,'r') as f1:
        with open(sortfliepath,'a+') as f2:
            f2.write(f1.read())
#----------------------------------

#主执行流程

importscvdatabase(baseline)

writetest()