#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.2
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here

#include <FileConstants.au3>
#include <MsgBoxConstants.au3>
#include <WinAPIFiles.au3>
#include <AutoItConstants.au3>


INSTALL_Aptio_client()
Func  INSTALL_Aptio_client()
	DriveMapAdd ( "K:", "\\192.168.1.200\D$" , 0 , "administrator" , "S1emens_!npeco" )
	;Run('net use \\192.168.1.200\d$ "S1emens_!npeco" /use:"administrator"')
	;\\192.168.1.200\d\FlexLab36-Client
    DirCopy("k:\FlexLab36-Client\", "F:\FlexLab36-Client\", $FC_OVERWRITE)
	FileCopy(".\Flexlab36.lnk", "C:\Users\SiemensService\Desktop\", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy(".\GUI.ini", "f:\FlexLab36-Client\Config\GUI\", $FC_OVERWRITE + $FC_CREATEPATH)
EndFunc

;DriveMapAdd