const READ_ONLY = 1
dim srcFilePath
dim oFso
dim output

set oWshShell = WScript.CreateObject("WScript.Shell")
set oFso = CreateObject("Scripting.FileSystemObject")
set stdOut = oFso.GetStandardStream(1)

srcFilePath = Wscript.Arguments.Item(0)
output = ""


if not (oFso.FileExists(srcFilePath)) then
	output = "Mapped drive data not defined for this configuration" & VBCRLF
else
	dim oRegex
	dim bFound
	set oRegex = new regexp
	set fh = oFso.OpenTextFile(srcFilePath, READ_ONLY)
	
	oRegex.Pattern = "\s+\w+:\s+\\\\\S+"
	oRegex.Global = true
	bFound = false

	output = output & "Drive       Network Path" & VBCRLF
	do until fh.AtEndOfStream
		line = fh.ReadLine
		set matchList = oRegex.Execute(line)
		for each match in matchList
			output = output & "  " & LTrim(match.Value) & VBCRLF
			bFound = true
		next
	loop
	fh.Close
	
	if not (bFound) then
		output = "Mapped drive data not defined for this configuration" & VBCRLF
	end if
end if

stdOut.Write output


