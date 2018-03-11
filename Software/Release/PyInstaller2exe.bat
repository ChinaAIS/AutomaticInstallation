@echo off

echo  *******************************************
echo.
echo  Automatic Installation Project Compiler
echo  Author: Dai Han Peng / China Automation Team
echo.
echo  *******************************************
rem pause

rem -w is for Window
rem -c is for Console
rem --paths=E:\Python36-32\Lib\site-packages\PyQt5\Qt\plugins is the plugins for search Qt lib
rem -p ..\UserInterface to add search paths for compiling

echo start compile

E:\Python36-32\Scripts\pyinstaller ^
-w ^
--noupx ^
--distpath=.  ^
--hidden-import=queue ^
--paths=E:\Python36-32\Lib\site-packages\PyQt5\Qt\plugins ^
-p ..\UserInterface ^
-F ..\UserInterface\Centralink_Start.py

echo end compile
pause