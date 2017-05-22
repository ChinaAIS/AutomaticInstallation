# encoding : utf-8       
import os,time
import autoit


def Login():
    """
      Login CentraLink 
    """
    autoit.send("^{esc}")
    autoit.send("c c")
    autoit.send("{Enter}")
    #time.sleep(2)
    autoit.win_wait_active("[Class:ProFrame]", 3)
    #time.sleep(1)
    #autoit.send("^{esc}")
    autoit.control_click("[Class:ProFrame]", "Button1")
    #time.sleep(1)
    autoit.win_wait_active("[Title:Information]", 3)
    autoit.send("{ESC}")
    autoit.win_wait_active("[Title: CentraLink - Login]", 3)    
    time.sleep(1)
    #autoit.control_click("[Class:#32770]", "Button1")
    autoit.control_send("[Class:ProFrame]", "Edit4", "Advia")
    autoit.control_send("[CLass:ProFrame]", "Edit2", "1Advia")   
    autoit.control_click("[Class:ProFrame]", "Button2")
    #time.sleep(1)
    autoit.win_wait_active("[CLASS:#32770]", 3)
    autoit.control_click("[Class:#32770]", "Button1")
    #time.sleep(1)
    autoit.win_wait_active("[CLASS:#32770]", 3)
    autoit.control_click("[Class:#32770]", "Button1")
    
def ImportCsvFile(CsvFilename=''):
    """
      import csv file to Centralink Database
    """
    autoit.win_wait_active("[CLASS:ProMainWin]", 3)
    time.sleep(6)
    autoit.send("!S S D I")
    #autoit.win_wait_active("[Title: Import", 3)    
    time.sleep(2)
    autoit.send("!U")
    autoit.send("{TAB}")
    time.sleep(1)
    autoit.send(CsvFilename)
    autoit.send("{TAB 7}")
    autoit.send("{Enter}")
    time.sleep(10)
    autoit.send("{esc}")
    
def Logout():
    time.sleep(1)
    autoit.send("!S x")
    autoit.control_click("[Class:#32770]", "Button1")

    
