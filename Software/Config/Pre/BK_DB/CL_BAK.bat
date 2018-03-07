@Echo off
color 30
echo. *******************************************************************
echo. * Batch File to backup CentraLink database to dated folders       *
echo. *                 CentraLink Version 14                           *
echo. *                                                                 * 
echo. *            Siemens Healthcare Diagnostics                       *
echo. *                                                                 *
echo. *                     MARCH 2013                                  *
echo. *******************************************************************

echo. *******************************************************************
echo. OPTIONAL: For Buttons folder, set the option below to 1, 
echo. otherwise leave it as 0
set ButFoldUse=0
echo. *******************************************************************

for /f "skip=1" %%d in ('wmic os get localdatetime') do if not defined mydate set mydate=%%d
set todayfolder=%mydate:~0,8%

if not exist F:\BackupProgram\%todayfolder% md F:\BackupProgram\%todayfolder%
echo. > F:\BackupProgram\%todayfolder%\Centralink.inp

mkdir F:\BackupProgram\trash
robocopy F:\BackupProgram F:\BackupProgram\trash /move /S /MINAGE:5
rmdir /s /q F:\BackupProgram\trash

if not exist F:\Backupprogram\CustomFiles md F:\BackupProgram\CustomFiles
if not exist F:\BackupProgram\CustomFiles\trame.par copy D:\Centralink\Dat\trame.par F:\BackupProgram\CustomFiles\trame.par /y
if not exist F:\BackupProgram\CustomFiles\sslf_qi.txt copy D:\Centralink\sslf_qi.txt F:\BackupProgram\CustomFiles\sslf_qi.txt /y
if not exist F:\BackupProgram\CustomFiles\ca15.ini copy D:\Centralink\bin\ca15.ini F:\BackupProgram\CustomFiles\ca15.ini /y
if not exist F:\BackupProgram\Centralink.st copy D:\Centralink\dbf\centralink.st F:\BackupProgram\CentraLink.st /y 

if %ButFoldUse%==1 (
	if not exist F:\BackupProgram\CustomFiles\Buttons (
		md F:\BackupProgram\CustomFiles\Buttons
	)
	copy D:\Centralink\Buttons F:\BackupProgram\CustomFiles\Buttons /y
)

call probkup online D:\Centralink\dbf\centralink F:\BackupProgram\%todayfolder%\centralink1 -com -verbose >> F:\BackupProgram\%todayfolder%\bckup%todayfolder%.log

