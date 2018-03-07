const READ_ONLY = 1
dim strSrcDir
dim strOutFilePath
strSrcDir = Wscript.Arguments.Item(0)
strOutFilePath = Wscript.Arguments.Item(1)

set oWshShell = WScript.CreateObject("WScript.Shell")
set oFso = CreateObject("Scripting.FileSystemObject")
set stdOut = oFso.GetStandardStream(1)

return = oWshShell.Run("cmd.exe /C dir " & strSrcDir & " /ad /b /o:n > " & strOutFilePath, 0, true)
set fh = oFso.OpenTextFile(strOutFilePath, READ_ONLY)

do until fh.AtEndOfStream
    strLine = fh.ReadLine
	'stdOut.Write strLine & ", "
	stdOut.Write strLine
	if not fh.AtEndOfStream then stdOut.Write ", "
loop
fh.Close


