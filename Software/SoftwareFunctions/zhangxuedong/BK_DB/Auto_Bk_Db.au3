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

FUN_AUTO_BACKUP_DB()
Func FUN_AUTO_BACKUP_DB ()

	FileCopy(".\CL_BAK.bat", "F:\CL_BAK.bat", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy(".\Robocopy.exe", "F:\Robocopy.exe", $FC_OVERWRITE + $FC_CREATEPATH)
	;FileCopy(".\CL_DB_BK.job","C:\WINDOWS\Tasks\CL_DB_BK.job", $FC_OVERWRITE + $FC_CREATEPATH)
	;FileCopy(".\CL_DB_BK.job","C:\WINDOWS\Tasks\CL_BK.job", $FC_OVERWRITE + $FC_CREATEPATH)
	Run('schtasks /create  /tn  "CL_DB_BK" /tr F:\CL_BAK.bat /sc daily /st 03:35:00 ')
EndFunc