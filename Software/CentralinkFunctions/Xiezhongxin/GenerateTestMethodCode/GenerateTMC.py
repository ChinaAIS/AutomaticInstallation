# encoding : utf-8        
import os,sys,time,datetime,shutil
import configparser,xlrd,autoit
import win32com.client

now=datetime.datetime.now()

# Start Define Function

def WriteLogFile(strLogMessage):
      #now=datetime.datetime.now()
      LogFileName= os.getcwd()+r'\Log\\'+str(now.strftime('%Y%m%d'))+'.log'
      if os.path.exists(LogFileName):
            LogFile=open(LogFileName,'a')
            LogFile.write('['+now.strftime('%Y-%m-%d %H:%M:%S')+']'+' '+strLogMessage+'\n')
            LogFile.close()
      else:
            LogFile=open(LogFileName,'w')
            LogFile.write('['+now.strftime('%Y-%m-%d %H:%M:%S')+']'+' '+strLogMessage+'\n')
            LogFile.close()   

#根据test.xlsx文件生成文件:test.csv,mtd.csv,tstc.csv,sslf_imp.txt,Analyzer-Test-Codes.ini,Test-Information.ini

def GenerateTestCsvFile():
      #打开指定文件路径的excel文件  
      xlsfile = os.getcwd()+r'\doc\test.xlsx'
      csvFilePath =os.getcwd()+r'\CSVFile'
       
      book = xlrd.open_workbook(xlsfile)
      sheet=book.sheet_by_index(0)     
      nrows = sheet.nrows
      
      #创建test.csv,mtd.csv,tstc.csv,sslf_imp.txt,Analyzer-Test-Codes.ini,Test-Information.ini
      testFile=open(csvFilePath+r'\test.csv','w')
      testFile.write('Name,Description:E,SampleType.Name,OmitOnLASUpdate,PatientDataType,ControlDataType,PatientUnit.Name,ControlUnit.Name,AlternateUnit.Name,UnitCoefficient,UnitTerm,SeqNo,DefaultValue,Calculation,CalcNormSevLimit,CalcDeltaNormSevLimit,CalcQCSevLimit,CalcInstSevLimit,EditWarning,DeltaCheckLimit,AllowAutovalidation,AllowLISDownload,LISUploadMode,ControlReportDecimals,PatientReportDecimals,AllowLASDownload,Trigger.Description,OnNewRequest.Description,~_DeltaNormsForCompActive\n')
      testFile.close();
      print('['+now.strftime('%Y-%m-%d %H:%M:%S')+']'+' '+'Create test.csv File')
      WriteLogFile('Create test.csv File')

      mtdFile=open(csvFilePath+r'\mtd.csv','w')
      mtdFile.write('Test.Name,Instrument.Name,Westgard12sSeverity,Westgard13sSeverity,Westgard10xSeverity,Westgard22sSeverity,Westgard41sSeverity,WestgardR4sSeverity,ApplyWestgardChecks,QCSeverity,Unit.Name,LowDetectionLimit,HighDetectionLimit,EnableTargeting,AutoTargetSeqNo,EnableWorkOrders,DownloadDilution,CheckMovingAverage,QCSeverityOnTypeError,QCSeverityOnInvalidRef,ValidateOnTypeError,ValidateOnInvalidRange,NormSeverityLimit,DeltaNormSeverityLimit,QCSeverityLimit,InstSeverityLimit,CounterKeyLabel,ReagentInformation,WGCheckIfCompForQC,InstrRerunSelection,PatientResultSelector.Name,ControlResultSelector.Name,OnQualityResultProcess.Description,LASTestAvailAlias.Test.Name\n')
      mtdFile.close();
      print('['+now.strftime('%Y-%m-%d %H:%M:%S')+']'+' '+'Create mtd.csv File')
      WriteLogFile('Create mtd.csv File')
      
      tstcFile=open(csvFilePath+r'\tstc.csv','w')
      tstcFile.write('CodingSystem.Name,Test.Name,InboundValue,OutboundValue\n')
      tstcFile.close();
      print('['+now.strftime('%Y-%m-%d %H:%M:%S')+']'+' '+'Create tstc.csv File')
      WriteLogFile('Create tstc.csv File')
      
      AnalyzerTestCodesFile=open(csvFilePath+r'\Analyzer-Test-Codes.ini','w')
      AnalyzerTestCodesFile.write('ANALYZER TYPE'+'\t'+'ANALYZER TEST CODE'+'\t'+'ASTM TEST CODE'+'\t'+'TEST NAME'+'\t'+'ORDER DESPITE ZERO INVENTORY'+'\t'+'COMBI TESTS\n')
      AnalyzerTestCodesFile.close();
      print('['+now.strftime('%Y-%m-%d %H:%M:%S')+']'+' '+'Create Analyzer-Test-Codes.ini File')
      WriteLogFile('Create Analyzer-Test-Codes.ini File')
      
      TestInformationFile=open(csvFilePath+r'\Test-Information.ini','w')
      TestInformationFile.write('ASTM TEST CODE'+'\t'+'TEST CODE'+'\t'+'ASTM TEST CODE'+'\t'+'TEST DESCRIPTION'+'\t'+'NODE TYPE'+'\t'+'DISPOSING TIME (HRS)\n')
      TestInformationFile.close();
      print('['+now.strftime('%Y-%m-%d %H:%M:%S')+']'+' '+'Create Test-Information.ini File')
      WriteLogFile('Create Test-Information.ini File')
      
      testFile=open(csvFilePath+r'\test.csv','a')
      mtdFile=open(csvFilePath+r'\mtd.csv','a')
      tstcFile=open(csvFilePath+r'\tstc.csv','a')
      AnalyzerTestCodesFile=open(csvFilePath+r'\Analyzer-Test-Codes.ini','a')
      TestInformationFile=open(csvFilePath+r'\Test-Information.ini','a')
      
      for i in range(1,nrows):
            strTestName= sheet.cell_value(i,0)
            if strTestName !='' :
                  #1)write to test.csv
                  strInstrumentType= str(sheet.cell(i,4).value)
                  strDescription= str(strInstrumentType)+'-'+strTestName
                  strSampleType= sheet.cell(i,1).value
                  strDataType= sheet.cell(i,2).value
                  strUnit= sheet.cell(i,3).value
                  testFile.write(strTestName+','+strDescription+','+strSampleType+',no,'+strDataType+','+strDataType+','+strUnit+','+strUnit+','+'?,?,?,?,?,?,?,?,?,?,?,?,yes,yes,Allow always,?,?,yes,?,?,?'+'\n')
                  print('['+now.strftime('%Y-%m-%d %H:%M:%S')+']'+' '+'Write \''+strTestName+','+strDescription+','+strSampleType+',no,'+strDataType+','+strDataType+','+strUnit+','+strUnit+','+'?,?,?,?,?,?,?,?,?,?,?,?,yes,yes,Allow always,?,?,yes,?,?,?'+'\' to test.csv')
                  WriteLogFile('Write \''+strTestName+','+strDescription+','+strSampleType+',no,'+strDataType+','+strDataType+','+strUnit+','+strUnit+','+'?,?,?,?,?,?,?,?,?,?,?,?,yes,yes,Allow always,?,?,yes,?,?,?'+'\' to test.csv')
                  
                  #2)write to mtd.csv 
                  strInstrumentList= str(sheet.cell(i,5).value)
                  if strInstrumentList !='':
                        if strInstrumentList.find(',') != -1:
                              arrInstrumentList=strInstrumentList.split(',')
                              for j in range(len(arrInstrumentList)):
                                    if strInstrumentType=='A24':
                                          strInstrumentName='Advia2400_'+arrInstrumentList[j]
                                    else:
                                          if strInstrumentType=='CEN':
                                                strInstrumentName='CentaurXP_'+arrInstrumentList[j]
                                          else:
                                                if strInstrumentType=='ACH':
                                                      strInstrumentName='ChemistryXPT_'+arrInstrumentList[j]
                                    mtdFile.write(strTestName+','+strInstrumentName+',1,1,1,1,1,1,yes,0,?,?,?,no,?,yes,no,no,5,5,no,no,6,6,6,6,?,?,no,Any,?,?,?,?'+'\n')
                                    print('['+now.strftime('%Y-%m-%d %H:%M:%S')+']'+' '+'Write \''+strTestName+','+strInstrumentName+',1,1,1,1,1,1,yes,0,?,?,?,no,?,yes,no,no,5,5,no,no,6,6,6,6,?,?,no,Any,?,?,?,?'+'\' to mtd.csv')
                                    WriteLogFile('Write \''+strTestName+','+strInstrumentName+',1,1,1,1,1,1,yes,0,?,?,?,no,?,yes,no,no,5,5,no,no,6,6,6,6,?,?,no,Any,?,?,?,?'+'\' to mtd.csv')
                        else:
                              if strInstrumentType=='A24':
                                    strInstrumentName='Advia2400_'+strInstrumentList
                              else:
                                    if strInstrumentType=='CEN':
                                          strInstrumentName='CentaurXP_'+strInstrumentList
                                    else:
                                          if strInstrumentType=='ACH':
                                                strInstrumentName='ChemistryXPT_'+strInstrumentList
                              mtdFile.write(strTestName+','+strInstrumentName+',1,1,1,1,1,1,yes,0,?,?,?,no,?,yes,no,no,5,5,no,no,6,6,6,6,?,?,no,Any,?,?,?,?'+'\n')
                              print('['+now.strftime('%Y-%m-%d %H:%M:%S')+']'+' '+'Write \''+strTestName+','+strInstrumentName+',1,1,1,1,1,1,yes,0,?,?,?,no,?,yes,no,no,5,5,no,no,6,6,6,6,?,?,no,Any,?,?,?,?'+'\' to mtd.csv')
                              WriteLogFile('Write \''+strTestName+','+strInstrumentName+',1,1,1,1,1,1,yes,0,?,?,?,no,?,yes,no,no,5,5,no,no,6,6,6,6,?,?,no,Any,?,?,?,?'+'\' to mtd.csv')
                              
                  #3)write to tstc.csv
                  strBoundValue=str(sheet.cell(i,6).value)
                  if strBoundValue !='':
                        if strInstrumentType=='A24':
                              strCodingSystem='Advia 2400'
                              tstcFile.write(strCodingSystem+','+strTestName+','+strBoundValue+','+strBoundValue+'\n')
                              print('['+now.strftime('%Y-%m-%d %H:%M:%S')+']'+' '+'Write \''+strCodingSystem+','+strTestName+','+strBoundValue+','+strBoundValue+'\' to tstc.csv')
                              WriteLogFile('Write \''+strCodingSystem+','+strTestName+','+strBoundValue+','+strBoundValue+'\' to tstc.csv')
                  #4)write to Analyzer-Test-Codes.ini
                  AnalyzerTestCodesFile.write(strInstrumentType+'\t'+strTestName+'\t'+strTestName+'\t'+strTestName+'\t'+'NO'+'\t'+'\n')
                  print('['+now.strftime('%Y-%m-%d %H:%M:%S')+']'+' '+'Write \''+strCodingSystem+','+strInstrumentType+'\t'+strTestName+'\t'+strTestName+'\t'+strTestName+'\t'+'NO'+'\t'+'\' to Analyzer-Test-Codes.ini.csv')
                  WriteLogFile('Write \''+strCodingSystem+','+strInstrumentType+'\t'+strTestName+'\t'+strTestName+'\t'+strTestName+'\t'+'NO'+'\t'+'\' to Analyzer-Test-Codes.ini.csv')
                  #5)write to Test-Information.ini
                  TestInformationFile.write(strTestName+'\t'+strTestName+'\t'+strInstrumentType+'-'+strTestName+'\t'+strInstrumentType+'\t'+'\n')
                  print('['+now.strftime('%Y-%m-%d %H:%M:%S')+']'+' '+'Write \''+strTestName+'\t'+strTestName+'\t'+strInstrumentType+'-'+strTestName+'\t'+strInstrumentType+'\t'+'\' to Test-Information.ini')
                  WriteLogFile('Write \''+strTestName+'\t'+strTestName+'\t'+strInstrumentType+'-'+strTestName+'\t'+strInstrumentType+'\t'+'\' to Test-Information.ini')
                  
      testFile.close();
      print('['+now.strftime('%Y-%m-%d %H:%M:%S')+']'+' '+'Generate test.csv successful')
      WriteLogFile('Generate test.csv successful')
      
      mtdFile.close();
      print('['+now.strftime('%Y-%m-%d %H:%M:%S')+']'+' '+'Generate mtd.csv successful')
      WriteLogFile('Generate mtd.csv successful')
      
      tstcFile.close();
      print('['+now.strftime('%Y-%m-%d %H:%M:%S')+']'+' '+'Generate tstc.csv successful')
      WriteLogFile('Generate tstc.csv successful')
      
      AnalyzerTestCodesFile.close();
      print('['+now.strftime('%Y-%m-%d %H:%M:%S')+']'+' '+'Generate Analyzer-Test-Codes.ini successful')
      WriteLogFile('Generate Analyzer-Test-Codes.ini successful')
      
      TestInformationFile.close();
      print('['+now.strftime('%Y-%m-%d %H:%M:%S')+']'+' '+'Generate Test-Information.ini successful')
      WriteLogFile('Generate Test-Information.ini successful')
      
      #write sslf_imp.txt
      sslf_impFile=open(csvFilePath+r'\sslf_imp.txt','w')
      sslf_impFile.write('test.csv ?\n')
      sslf_impFile.write('mtd.csv ?\n')
      sslf_impFile.write('cods.csv ?\n')
      sslf_impFile.write('sptc.csv ?\n')
      sslf_impFile.write('cntc.csv ?\n')
      sslf_impFile.write('tstc.csv ?\n')
      sslf_impFile.close();
      print('['+now.strftime('%Y-%m-%d %H:%M:%S')+']'+' '+'Generate sslf_imp.txt successful')
      WriteLogFile('Generate sslf_imp.txt successful')
      
def isRun(ProcessName):
      isRunFlag=False
      try:
            WMI=win32com.client.GetObject('winmgmts:')
            processCodeCov=WMI.ExecQuery('select * from Win32_Process where Name="%s"' % ProcessName)
            if len(processCodeCov) > 0:
                  isRunFlag=True
            else:
                  isRunFlag=False
      except:
            isRunFlag=False
      finally:
            return isRunFlag
      
def isRunning(ProcessName):
      isRunFlag=False
      try:
            file_handle = os.popen('tasklist /FI "IMAGENAME eq ' + ProcessName + '"')
            file_content =file_handle.read()
            if file_content.find(ProcessName) > -1:
                  isRunFlag=True
      except:
            isRunFlag=False
      finally:
            return isRunFlag
      
def LoginCentralink():
      if isRunning('prowin32.exe'):
            print('['+now.strftime('%Y-%m-%d %H:%M:%S')+']'+' '+'Centralink is already running')
            WriteLogFile('Centralink is already running')
            # at Login Form, But can't Login   
            if autoit.win_active(" CentraLink - Login") :
                  autoit.control_send(" CentraLink - Login", "Edit4", "Advia") 
                  autoit.control_send(" CentraLink - Login", "Edit2", "1Advia") 
                  autoit.control_click(" CentraLink - Login", "OK") 
                  while autoit.win_active("CentraLink") == 0:
                        time.sleep(1)
                        if autoit.win_active("Information"):
                              autoit.control_click("Information", "OK")
                  time.sleep(5)
                  if autoit.win_active(" Maintenance session"):
                        autoit.control_send(" Maintenance session", "Edit1", "sss")
                        autoit.control_click(" Maintenance session", "OK")
      else:      
            autoit.send("^{esc}")
            autoit.send("c c")
            autoit.send("{Enter}")
            time.sleep(2)
            if autoit.win_wait_active("Enter license key",3):
                  autoit.send("{ESC}")
            #autoit.control_click("[Enter license key", "Cancel")
            if autoit.win_wait_active("Information",3):
                  autoit.control_click("Information", "OK")     
            autoit.win_wait_active(" CentraLink - Login") 
            autoit.control_send(" CentraLink - Login", "Edit4", "Advia") 
            autoit.control_send(" CentraLink - Login", "Edit2", "1Advia") 
            autoit.control_click(" CentraLink - Login", "OK") 
            while autoit.win_active("CentraLink") == 0:
                  time.sleep(1)
                  if autoit.win_active("Information"):
                        autoit.control_click("Information", "OK")
            time.sleep(5)
            if autoit.win_active(" Maintenance session"):
                  autoit.control_send(" Maintenance session", "Edit1", "sss")
                  autoit.control_click(" Maintenance session", "OK") 


#import csv file to Centralink Database
def ImportCsvFile(CsvFilename=''):
    autoit.win_activate("CentraLink")
    autoit.send("!S S D I")
    #autoit.win_wait_active("[Title: Import", 3)    
    time.sleep(2)
    autoit.send("!U")
    autoit.send("{TAB}")
    time.sleep(1)
    autoit.send(CsvFilename)
    autoit.send("{TAB 7}")
    autoit.send("{Enter}")
    time.sleep(8)
    autoit.send("{esc}")
    
def LogoutCentralink():
    time.sleep(1)
    autoit.send("!S x")
    if autoit.win_wait_active(" Confirm exit",3):
          autoit.control_click(" Confirm exit", "Button1")

def read_config(config_file_path, field, key): 
    cf = configparser.ConfigParser()
    try:
        cf.read(config_file_path)
        result = cf.get(field, key)
    except:
        sys.exit(1)
    return result

def CopyFile(SourceFile,DestinationFile):
      shutil.copyfile(SourceFile,DestinationFile)

# End Define Function

if __name__ == "__main__":
      print('['+now.strftime('%Y-%m-%d %H:%M:%S')+']'+' '+'Start system')
      WriteLogFile('Start system')
      #1)Generate test.csv,mtd.csv,tstc.csv,sslf_imp.txt,Analyzer-Test-Codes.ini,Test-Information.ini 
      GenerateTestCsvFile()
      
      #2)import .csv to centralink
      
      #a)Login Centralink
      try:
            LoginCentralink()
            isLogin=True
            print('['+now.strftime('%Y-%m-%d %H:%M:%S')+']'+' '+'Login Centralink successful')
            WriteLogFile('Login Centralink successful')
      except:
            isLogin=False
            print('['+now.strftime('%Y-%m-%d %H:%M:%S')+']'+' '+'Login Centralink successful')
            WriteLogFile('Login Centralink successful')
            
      #b)import .csv file to centralink database
      sslfimpFile = os.getcwd()+r'\CSVFile\sslf_imp.txt'
      try:
            print('['+now.strftime('%Y-%m-%d %H:%M:%S')+']'+' '+'Start import .csv file to Centralink')
            WriteLogFile('Start import .csv file to Centralink')
            ImportCsvFile(sslfimpFile)
            print('['+now.strftime('%Y-%m-%d %H:%M:%S')+']'+' '+'Import .csv file to Centralink successful')
            WriteLogFile('Import .csv file to Centralink successful')
      except :
            print('['+now.strftime('%Y-%m-%d %H:%M:%S')+']'+' '+'Import .csv file to Centralink Fail')
            WriteLogFile('Import .csv file to Centralink fail')
      #c)Logout Centralink
      if isLogin:
            LogoutCentralink()
            print('['+now.strftime('%Y-%m-%d %H:%M:%S')+']'+' '+'Logout Centralink')
            WriteLogFile('Logout Centralink') 

      #3)copy  Analyzer-Test-Codes.ini,Test-Information.ini to Aptio
      try:
            strAptioConfigPath=read_config(os.getcwd()+r'\config.ini','Aptio','ConfigFoldPath')      
            strSourceFileName=os.getcwd()+r'\CSVFile\Analyzer-Test-Codes.ini'
            strDesFileName=strAptioConfigPath+r'\Analyzer-Test-Codes.ini'
            CopyFile(strSourceFileName,strDesFileName)
            strSourceFileName=os.getcwd()+r'\CSVFile\Test-Information.ini'
            strDesFileName=strAptioConfigPath+r'\Test-Information.ini'
            CopyFile(strSourceFileName,strDesFileName)
            print('['+now.strftime('%Y-%m-%d %H:%M:%S')+']'+' '+'Copy .ini file to Aptio successful')
            WriteLogFile('Copy .ini file to Aptio successful')
      except:
            print('['+now.strftime('%Y-%m-%d %H:%M:%S')+']'+' '+'Copy .ini file to Aptio fail')
            WriteLogFile('Copy .ini file to Aptio fail')
                  
