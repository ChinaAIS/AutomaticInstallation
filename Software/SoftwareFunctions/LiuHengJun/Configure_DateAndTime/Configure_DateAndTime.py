from time import sleep
import autoit

autoit.send("#r")
autoit.win_wait_active("Run")
autoit.send(r"timedate.cpl {ENTER}")
autoit.win_wait_active("Date and Time Properties")
autoit.send("^{TAB}")
autoit.control_command("Date and Time Properties", "ComboBox1", "SelectString", 256, extra = "(GMT+08:00) Beijing, Chongqing, Hong Kong, Urumqi")
sleep(0.5)
autoit.send("^{TAB}")
sleep(0.5)
autoit.control_command("Date and Time Properties", 'Button1', "UnCheck")
sleep(0.5)
autoit.send("!A")
autoit.send("{Enter}")



