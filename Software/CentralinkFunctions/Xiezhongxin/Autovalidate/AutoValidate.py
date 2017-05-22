# encoding : utf-8        
import os,time  
import xlrd
from p_Func import Login
from p_Func import ImportCsvFile

#根据Autovalidate.xlsx文件生成NS相关的文件:sfn.csv,txt.csv,norm.csv,sslf_imp.txt
def GenerateNsCsvFile():
      #打开指定文件路径的excel文件  
      xlsfile = os.getcwd()+r'\doc\AutoValidate.xlsx'
      csvFilePath =os.getcwd()+r'\NS'
      #获得excel的book对象  
      book = xlrd.open_workbook(xlsfile)
      #通过sheet索引获得sheet对象  
      sheet=book.sheet_by_index(0)     
  
      #获取行数    
      nrows = sheet.nrows
      
      #创建sfn.csv,txt.csv,norm.csv,sslf_imp.txt
      sfnFile=open(csvFilePath+r'\sfn.csv','w')
      sfnFile.write('Table.Name,Description,DataType,Definition\n')
      sfnFile.close();

      txtFile=open(csvFilePath+r'\txt.csv','w')
      txtFile.write('Mnemonic,Class,Description,Table.Name,Text:E,StartDate,EndDate\n')
      txtFile.close();

      normFile=open(csvFilePath+r'\norm.csv','w')
      normFile.write('Id,Test.Name,EvaluationOrder,Sex,Species.Name,MinAge,MaxAge,AgeUnit.Name,LowLimit,HighLimit,Severity,Method.Instrument.Name,Eligible.Description,Comment.Mnemonic\n')
      normFile.close();

      sfnFile=open(csvFilePath+r'\sfn.csv','a')
      txtFile=open(csvFilePath+r'\txt.csv','a')
      normFile=open(csvFilePath+r'\norm.csv','a')

      for i in range(2,nrows):
            strTestName= sheet.cell_value(i,2)
            if strTestName<>'' :            
                  #1)生成Eligibal_Testname_NS Function 到sfn.csv文件.  
                  sfnFile.write('Sample,'+'Eligible_'+strTestName+'_NS'+',Logical,'+'\"'+'String strTestName;\n')
                  sfnFile.write('strTestName :='+'\""'+strTestName+'\""'+';\n')
                  sfnFile.write('If .GetRequest(strTestName).GetLISPreviousResult(0).ResultValue <> ? And (Matches(.GetRequest(strTestName).Result.Value,'+'\""'+'^[0-9.]+$'+'\""'+', No) Or Matches(.GetRequest(strTestName).Result.Value, '+'\""'+'[^0]'+'\""'+', No))  Then\n')              
                  sfnFile.write('   Return False;\n')
                  sfnFile.write('Endif;\n')
                  sfnFile.write('Return True;'+'\"'+'\n')
                   
                  #2)生成NS_Comment_Testname到txt.csv文件.
                  if sheet.cell_value(i,7)<>'':
                        NsLowValue='%.3f' %sheet.cell_value(i,7)  #sheet.cell_value(i,7)
                  if sheet.cell_value(i,8)<>'':
                        NsHighValue='%.3f' %sheet.cell_value(i,8) #sheet.cell_value(i,8)
                  if (sheet.cell_value(i,7)<>'') or (sheet.cell_value(i,8)<>''):
                        txtFile.write('NS_Comment_'+strTestName+',?,'+'NS_Comment_'+strTestName+',Request,'+'\"'+'{:\n') 
                        txtFile.write('String Message_LB, Message_UB;\n')
                        txtFile.write('Message_LB := '+'\""'+'<'+NsLowValue+'\""'+';\n')
                        txtFile.write('Message_UB := '+'\""'+'>'+NsHighValue+'\""'+';\n')
                        txtFile.write('If .NormSeverity < 0 Then\n')
                        txtFile.write('   Return Message_LB;\n')
                        txtFile.write('Else\n')
                        txtFile.write('   Return Message_UB;\n')
                        txtFile.write('Endif;\n')
                        txtFile.write('}\n')
                        txtFile.write('\"'+',?,?\n')
            
                  #3)生成norm.csv文件.
                  strId='%d' %i
                  normFile.write(strId+','+strTestName+',5,?,?,?,?,?,'+NsLowValue+','+NsHighValue+',5,?,'+'Eligible_'+strTestName+'_NS'+','+'NS_Comment_'+strTestName+'\n')
                  print (strTestName)  #+sheet.cell_value(i,8)
      sfnFile.close();
      txtFile.close();
      normFile.close();
      
      sslf_impFile=open(csvFilePath+r'\sslf_imp.txt','w')
      sslf_impFile.write('sfn.csv ?\n')
      sslf_impFile.write('txt.csv ?\n')
      sslf_impFile.write('norm.csv ?\n')
      sslf_impFile.close();

#根据Autovalidate.xlsx文件生成DS相关的文件: sfn.csv,txt.csv,dnrm.csv,sslf_imp.txt
def GenerateDsCsvFile():
      #打开指定文件路径的excel文件  
      xlsfile = os.getcwd()+r'\doc\AutoValidate.xlsx'
      csvFilePath =os.getcwd()+r'\DS'
      #获得excel的book对象  
      book = xlrd.open_workbook(xlsfile)
      #通过sheet索引获得sheet对象  
      sheet=book.sheet_by_index(0)     
  
      #获取行数    
      nrows = sheet.nrows
      
      #创建sfn.csv,txt.csv,norm.csv,sslf_imp.txt
      sfnFile=open(csvFilePath+r'\sfn.csv','w')
      sfnFile.write('Table.Name,Description,DataType,Definition\n')
      sfnFile.close();

      txtFile=open(csvFilePath+r'\txt.csv','w')
      txtFile.write('Mnemonic,Class,Description,Table.Name,Text:E,StartDate,EndDate\n')
      txtFile.close();

      dnrmFile=open(csvFilePath+r'\dnrm.csv','w')
      dnrmFile.write('Id,Test.Name,EvaluationOrder,Species.Name,LimitIsAbsolute,Limit,Severity,DayLimit,Eligible.Description,Comment.Mnemonic\n')
      dnrmFile.close();

      sfnFile=open(csvFilePath+r'\sfn.csv','a')
      txtFile=open(csvFilePath+r'\txt.csv','a')
      dnrmFile=open(csvFilePath+r'\dnrm.csv','a')

      for i in range(2,nrows):
            strTestName= sheet.cell_value(i,2)
            if strTestName<>'' :
                  
                  #1)生成Eligibal_Testname_DS Function 到sfn.csv文件.
                  if sheet.cell_value(i,22)<>'':
                        LimitValue='%.2f' %sheet.cell_value(i,22)  
                        sfnFile.write('Sample,'+'Eligible_'+strTestName+'_DS'+',Logical,'+'\"'+'String strTestName;\n')
                        sfnFile.write('String strLISPreviousResult,strCurrentResult,strTestName;\n')
                        sfnFile.write('Fractional fLISPreviousResult,fCurrentResult,RESULT_VALUE_LIMIT;\n')
                        sfnFile.write('RESULT_VALUE_LIMIT :='+LimitValue+';\n') 
                        sfnFile.write('strTestName :='+'\""'+strTestName+'\""'+';\n')
                        sfnFile.write('strPreviousResult := .GetRequest(strTestName).GetPreviousLocalResult(0).ParsedValue;\n')
                        sfnFile.write('strCurrentResult := .GetRequest(strTestName).GetResult(0).Value;\n') 
                        sfnFile.write('If ? = strPreviousResult or ? = strCurrentResult Then\n')
                        sfnFile.write('    return False;\n')
                        sfnFile.write('Else\n')      
                        sfnFile.write('    fPreviousResult := StringToFractional(strPreviousResult);\n')
                        sfnFile.write('    fCurrentResult:= StringToFractional(strCurrentResult);\n')
                        sfnFile.write('If (fPreviousResult < RESULT_VALUE_LIMIT) Then\n')
                        sfnFile.write('        Return True;\n')
                        sfnFile.write('    Endif;\n')
                        sfnFile.write('Endif;\n')
                        sfnFile.write('Return False;'+'\"'+'\n')
                  #2)生成DS_Comment_Testname到txt.csv文件.
                  if sheet.cell_value(i,24)<>'':
                        DsValue='%.1f' %sheet.cell_value(i,24)  
                        txtFile.write('DS_Comment_'+strTestName+',?,'+'DS_Comment_'+strTestName+',Request,'+'\"'+'{:\n') 
                        txtFile.write('String Message_LB, Message_UB;\n')
                        txtFile.write('Message_LB := '+'\""'+'<'+DsValue+'%'+'\""'+';\n')
                        txtFile.write('Message_UB := '+'\""'+'>'+DsValue+'%'+'\""'+';\n')
                        txtFile.write('If .NormSeverity < 0 Then\n')
                        txtFile.write('   Return Message_LB;\n')
                        txtFile.write('Else\n')
                        txtFile.write('   Return Message_UB;\n')
                        txtFile.write('Endif;\n')
                        txtFile.write('}\n')
                        txtFile.write('\"'+',?,?\n')
                        
                  #5)生成dnrm.csv文件.
                  strId='%d' %i
                  DsValue='?'
                  DayLimit='?'
                  EligibleDesc='?'
                  if sheet.cell_value(i,24)<>'':
                        DsValue='%.0f' %sheet.cell_value(i,24)
                  if  (sheet.cell_value(i,23))<>'':
                        DayLimit='%.0f' %sheet.cell_value(i,23)
                  if sheet.cell_value(i,22)<>'':
                        EligibleDesc='Eligible_'+strTestName+'_DS'
                  dnrmFile.write(strId+','+strTestName+',5,?,no,'+DsValue+',5,'+DayLimit+','+EligibleDesc+','+'DS_Comment_'+strTestName+'\n')
                  print (strTestName)  #+sheet.cell_value(i,8)
      sfnFile.close();
      txtFile.close();
      dnrmFile.close();

      sslf_impFile=open(csvFilePath+r'\sslf_imp.txt','w')
      sslf_impFile.write('sfn.csv ?\n')
      sslf_impFile.write('txt.csv ?\n')
      sslf_impFile.write('dnrm.csv ?')
      sslf_impFile.close();
