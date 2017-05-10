from time import sleep
import autoit
import py2exe as py2exe

iFlag = "0"
autoit.run("npp.6.9.2.Installer.exe")
autoit.win_wait_active("Installer Language")
autoit.control_command("Installer Language", "Button1", "Check")
autoit.win_wait_active("Notepad++ v6.9.2 Setup")
autoit.control_command("Notepad++ v6.9.2 Setup", "&Next >", "Check")
sleep(0.5)
autoit.control_command("Notepad++ v6.9.2 Setup", "I &Agree", "Check")
sleep(0.5)
autoit.control_command("Notepad++ v6.9.2 Setup", "&Next >", "Check")
sleep(0.5)
autoit.control_command("Notepad++ v6.9.2 Setup", "&Next >", "Check")
sleep(0.5)
autoit.control_command("Notepad++ v6.9.2 Setup", "&Install", "Check")

while iFlag == "0":
    try:
        iFlag = autoit.control_command("Notepad++ v6.9.2 Setup", "&Finish", "IsVisible")
    except:
        iFlag = "0"
        sleep(1)
autoit.control_command("Notepad++ v6.9.2 Setup", "Button4", "UnCheck")
autoit.control_command("Notepad++ v6.9.2 Setup", "&Finish", "Check")

