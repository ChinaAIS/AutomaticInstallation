from time import sleep
import autoit
import os,sys

baseline = os.path.dirname(os.path.realpath(__file__)) + '\\CSV\\sslf_imp.txt'

print "__file__=%s" % baseline
autoit.win_activate('CentraLink')
autoit.send("{ESC 3}")
autoit.send("!S S D I")
sleep(0.2)
autoit.win_activate('CentraLink')
autoit.send("{space}")
autoit.send("{TAB}")
autoit.send(baseline)
sleep(0.5)
autoit.control_command( "CentraLink", "Button7", "Check")
sleep(10)
autoit.send("{ESC}")
