
#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.2
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here
INSTALL_LABVIEW()
Func  INSTALL_LABVIEW()

     Run(@ScriptDir&"\Standard\setup.exe")
	Sleep(10000)
	_WinWaitActivate("NI LabVIEW Runtime 2014 SP1","&Next >>",30)

	ControlClick("NI LabVIEW Runtime 2014 SP1","<< &Back","Button2")

	_WinWaitActivate("NI LabVIEW Runtime 2014 SP1","&Next >>",30)

	Sleep(1000)
	ControlClick("NI LabVIEW Runtime 2014 SP1","<< &Back","Button2")

	_WinWaitActivate("NI LabVIEW Runtime 2014 SP1","R&estore Feature Defaults",5)
	ControlClick("NI LabVIEW Runtime 2014 SP1","&Next >>","Button4")
	_WinWaitActivate("NI LabVIEW Runtime 2014 SP1","Privacy Policy",20)
	ControlClick("NI LabVIEW Runtime 2014 SP1","&Next >>","Button8")
	ControlClick("NI LabVIEW Runtime 2014 SP1","&Next >>","Button2")
	_WinWaitActivate("NI LabVIEW Runtime 2014 SP1","I accept the License Agreement.",20)
	ControlClick("NI LabVIEW Runtime 2014 SP1","&Next >>","Button11")


    Send("{ENTER}")

	_WinWaitActivate("NI LabVIEW Runtime 2014 SP1","&Save File...",30)
	ControlClick("NI LabVIEW Runtime 2014 SP1","&Next >>","Button3")
	_WinWaitActivate("NI LabVIEW Runtime 2014 SP1","The NI LabVIEW Runtime 2014 SP1 installation is complete.",300)
	ControlClick("NI LabVIEW Runtime 2014 SP1","&Next >>","Button2")
	_WinWaitActivate("NI LabVIEW Runtime 2014 SP1","You must restart your computer to complete this operation.",300)
	Send("!a")



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