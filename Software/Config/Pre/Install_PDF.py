from time import sleep
import autoit

iFlag = 0
repairVisible = "0"
autoit.run(r"C:\config\tools\setup.exe")
hWnd = autoit.win_wait_active("[TITLE:Adobe Reader 9.4.0 - Setup; CLASS:MsiDialogCloseClass]")
autoit.send("n")
sleep(0.5)
try:
    repairVisible = autoit.control_command("Adobe Reader 9.4.0 - Setup", "Re&pair", "IsVisible")
except:
    repairVisible = "0"

if repairVisible == "0":
    autoit.send("i")
    while iFlag == 0:
        try:
            iFlag = autoit.control_command("Adobe Reader 9.4.0 - Setup", "&Finish", "IsVisible")
        except:
            iFlag = 0
            sleep(1)
    autoit.send("f")
else:
    autoit.send("c")
    sleep(0.5)
    autoit.send("y")
    sleep(0.5)
    autoit.send("f")
