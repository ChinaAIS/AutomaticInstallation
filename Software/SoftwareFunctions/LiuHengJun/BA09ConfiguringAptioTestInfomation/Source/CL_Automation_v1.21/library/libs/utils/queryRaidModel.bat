@echo off

reg QUERY HKLM\SYSTEM\CurrentControlSet\Enum\PCI /s /f "LSI MegaRAID" | findstr /c:"LSI MegaRAID" >NUL
if %ERRORLEVEL% == 0 (
	echo LSI MegaRAID,hardware/install/installLSIMegaRaid,Enter the LSI MegaRAID software cd into the tray then close the tray.  Follow the instructions in bulletin TBD section TBD
	goto done
)

reg QUERY HKLM\SYSTEM\CurrentControlSet\Enum\PCI /s /f "LSI 3ware" | findstr /c:"LSI 3ware" >NUL
if %ERRORLEVEL% == 0 (
	echo LSI 3ware,hardware/install/installLSI3Ware,Enter the LSI 3Ware software cd into the tray then close the tray.  Follow the instructions in bulletin TBD section TBD
	goto done
)

echo RAID Controller NOT FOUND,noop,RAID software is NOT NEEDED for this server
goto done

:done
exit /b 0



