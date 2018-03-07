dim csvOrdeList
dim arrList
dim tmpCmd

csvOrderList = Wscript.Arguments.Item(0)
arrList = split(csvOrderList, ",")

set oWshShell = WScript.CreateObject("WScript.Shell")
set oFso = CreateObject("Scripting.FileSystemObject")
set stdOut = oFso.GetStandardStream(1)

' The list is passed in order so it must be reversed to move the first element to the top
for ii = UBound(arrList) To 0 Step -1
	tmpCmd = "..\library\libs\utils\nvspbind.exe /++ """ & arrList(ii) & """ ms_tcpip " & VBCRLF
	'stdOut.Write tmpCmd
	call oWshShell.Run(tmpCmd, 0, true)
next
