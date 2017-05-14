
#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.2
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here
INSTALL_MACFC()
Func  INSTALL_MACFC()

     Run(@ScriptDir&"\McAfc\SetupVSE.EXE")

     _WinWaitActivate("McAfee VirusScan Enterprise Setup","This setup wizard installs McAfee VirusScan",30)
	 Sleep(1000)
     ControlClick("McAfee VirusScan Enterprise Setup","&Next >","Button1")
	 _WinWaitActivate("McAfee Licensing","McAfee End User License Agreement",30)
	 ControlClick("McAfee Licensing","","ComboBox1")
	 Send("P{ENTER}")
	 ControlClick("McAfee Licensing","","Button1")
	 ControlClick("McAfee Licensing","OK","Button3")
	 _WinWaitActivate("McAfee VirusScan Enterprise Setup","Select Setup Type",10)
	 ControlClick("McAfee VirusScan Enterprise Setup","&Next >","Button7")
	 _WinWaitActivate("McAfee VirusScan Enterprise Setup","Select Access Protection Level",10)
	 ControlClick("McAfee VirusScan Enterprise Setup","&Next >","Button5")
	  _WinWaitActivate("McAfee VirusScan Enterprise Setup","Ready to install",10)
	 ControlClick("McAfee VirusScan Enterprise Setup","&Install","Button1")
	  _WinWaitActivate("McAfee VirusScan Enterprise Setup","McAfee VirusScan Enterprise setup has completed successfully.",200)
	  ControlClick("McAfee VirusScan Enterprise Setup","&Finish","Button3")
      _WinWaitActivate("McAfee VirusScan Enterprise Setup","The network driver is installed but you must restart the computer in order to load it.  Distributed File Scanning,",20)
	  Send("{ENTER}")

    ;sdat6114
	;------
	;------
	;run("C:\Program Files (x86)\McAfee\VirusScan Enterprise\mcconsol.exe")
	;_WinWaitActivate("VirusScan Console","",10)
    ;Send("!o!n")
    ;_WinWaitActivate("VirusScan Console","Login",10)
    ;Send("clmcafee{ENTER}")
   ;;;;........

EndFunc
Func _WinWaitActivate($title,$text,$timeout=0)
    WinWait($title,$text,$timeout)
    If Not WinActive($title,$text) Then WinActivate($title,$text)
    WinWaitActive($title,$text,$timeout)
EndFunc

Func logFile($inputStr)
   $file = FileOpen(@ScriptDir & "\" & "log.txt", 1)

	; Check If file opened for reading OK
	If $file = -1 Then
		Exit(0)
	EndIf

   $inputStr = "[" & @MDAY & "." & @MON & ". " & @Hour & ":" & @Min & ":" & @SEC & "] " & $inputStr
   FileWriteLine($file, $inputStr)
   FileClose($file)
EndFunc