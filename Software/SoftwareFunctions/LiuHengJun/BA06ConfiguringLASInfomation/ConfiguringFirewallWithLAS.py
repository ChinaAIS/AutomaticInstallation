import os

import autoit

batPath = os.path.abspath('.') + '\Soure\ConfiguringFirewallWithLAS.bat'
autoit.send("#r")
autoit.win_wait_active("Run")
autoit.send(batPath)
autoit.control_click("Run", "OK")