@Echo off
color 30
echo. *****************************************************************
echo. *  Batch File to backup CentraLink database to dated folders    *
echo. *                   CentraLink Version 16                       *
echo. *                      CLIENT PROGRAM                           * 
echo. *              Siemens Healthcare Diagnostics                   *
echo. *                                                               *
echo. *                        JULY 2016                              *
echo. *****************************************************************

echo. **************************************************************************
echo. Modify the IPaddress below to match the client IP which will store backups
set MAP=\\192.168.1.201
echo. **************************************************************************

echo. **************************************************************************
echo. OPTIONAL: For Buttons folder, set the option below to 1, 
echo. otherwise leave it as 0
set ButFoldUse=0
echo. **************************************************************************

for /f "skip=1" %%d in ('wmic os get localdatetime') do if not defined mydate set mydate=%%d
set todayfolder=%mydate:~0,8%

xcopy F:\BackupProgram\%todayfolder% %MAP%\backup\%todayfolder% /E /I /D /Y
xcopy F:\BackupProgram\Centralink.st %MAP%\backup  /Y

if not exist %MAP%\backup\CustomFiles md %MAP%\backup\CustomFiles
xcopy F:\BackupProgram\CustomFiles %MAP%\backup\CustomFiles /y

if %ButFoldUse%==1 (
	if not exist %MAP%\backup\CustomFiles\Buttons (
		md %MAP%\backup\CustomFiles\Buttons
	)
	xcopy F:\BackupProgram\CustomFiles\Buttons %MAP%\backup\CustomFiles\Buttons /y
)

if exist %MAP%\backup\%todayfolder% (
	mkdir %MAP%\backup\trash
	robocopy %MAP%\backup %MAP%\backup\trash /move /XF centralink.st /XD %MAP%\backup\CustomFiles /XD %MAP%\backup\CustomFiles\Buttons /S /MINAGE:4
	rmdir /s /q %MAP%\backup\trash
)





