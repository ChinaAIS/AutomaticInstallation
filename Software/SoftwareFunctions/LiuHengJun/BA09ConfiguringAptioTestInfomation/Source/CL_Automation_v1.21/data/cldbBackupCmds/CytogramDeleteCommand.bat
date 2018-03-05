@echo off

REM Delete bitmap files (w*.bmp) sent from ADVIA120/2120/2120i that have a creation date from the previous day. Checks all FTProot subfolders (/s switch)
forfiles.exe /p C:\Inetpub\ftproot /s /m w*.bmp /d -1 /c "cmd /c del @file"

