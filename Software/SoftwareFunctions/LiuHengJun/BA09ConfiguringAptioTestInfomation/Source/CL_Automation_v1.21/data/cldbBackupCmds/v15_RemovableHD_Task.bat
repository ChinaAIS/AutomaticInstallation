@Echo off
color 30
echo. ******************************************************************
echo. * Batch File to backup CentraLink database to dated folders      *
echo. *                         CentraLink Version 15                  *
echo. *                         Removable HD PROGRAM                   * 
echo. *                      Siemens Healthcare Diagnostics            *
echo. *                                                                *
echo. *                            MARCH 2015                          *
echo. ******************************************************************

echo. **************************************************************************
echo. Modify the drive letter below to match the Removable HardDrive
set   DRIVE=G
echo. **************************************************************************

echo. **************************************************************************
echo. OPTIONAL: For Buttons folder, set the option below to 1, 
echo. otherwise leave it as 0
set ButFoldUse=0
echo. **************************************************************************

for /f "skip=1" %%d in ('wmic os get localdatetime') do if not defined mydate set mydate=%%d
set todayfolder=%mydate:~0,8%


xcopy F:\BackupProgram\%todayfolder% %DRIVE%:\backup\%todayfolder% /E /I /D /Y
xcopy F:\BackupProgram\Centralink.st %DRIVE%:\backup /Y

if not exist %DRIVE%:\backup\CustomFiles md %DRIVE%:\backup\CustomFiles
xcopy F:\BackupProgram\CustomFiles %DRIVE%:\backup\CustomFiles /y

if %ButFoldUse%==1 (
	if not exist %DRIVE%:\backup\CustomFiles\Buttons (
		md %DRIVE%:\backup\CustomFiles\Buttons
	)
	xcopy F:\BackupProgram\CustomFiles\Buttons %DRIVE%:\backup\CustomFiles\Buttons /y
)

if exist %DRIVE%:\backup\%todayfolder% (
	mkdir %DRIVE%:\backup\trash
	robocopy %DRIVE%:\backup %DRIVE%:\backup\trash /move /XF centralink.st /XD %DRIVE%:\backup\CustomFiles /XD %DRIVE%:\backup\CustomFiles\Buttons /S /MINAGE:4
	rmdir /s /q %DRIVE%:\backup\trash
)

