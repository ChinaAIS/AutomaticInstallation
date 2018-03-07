@Echo off
color 40

echo. ********************************************************************************
echo. * Batch File to backup CentraLink database every 4 hours to date_time folders  *
echo. *                        CentraLink Version 15                                 *
echo. *                                                                              * 
echo. *                  Siemens Healthcare Diagnostics                              *
echo. *                                                                              *
echo. *                            MARCH 2015                                        *
echo. ********************************************************************************

for /f "skip=1" %%d in ('wmic os get localdatetime') do if not defined mydate set mydate=%%d

set todaydate=%mydate:~0,8%
set todaytime=%mydate:~8,10%
set todayfolder=%todaydate%_%todaytime%

if not exist F:\BackupProgram\Quad-hourly\%todayfolder% md F:\BackupProgram\Quad-hourly\%todayfolder%
echo. > F:\BackupProgram\Quad-hourly\%todayfolder%\Centralink.inp

mkdir F:\BackupProgram\trash
robocopy F:\BackupProgram\Quad-hourly F:\BackupProgram\trash /move /S /MINAGE:1
rmdir /s /q F:\BackupProgram\trash

if not exist F:\BackupProgram\Centralink.st copy D:\Centralink\dbf\centralink.st F:\BackupProgram\CentraLink.st /y
call probkup online D:\Centralink\dbf\centralink F:\BackupProgram\Quad-hourly\%todayfolder%\centralink1 -com -verbose >>F:\BackupProgram\Quad-hourly\%todayfolder%\bckup%todayfolder%.log
