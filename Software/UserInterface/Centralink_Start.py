# -*- coding: utf-8 -*-
from PyQt5.QtGui import QColor
from PyQt5.QtGui import QIcon

__author__ = 'Lizhao1206@126.com'
# 程序入口#
import sys
from PyQt5.QtWidgets import QApplication , QMainWindow
from PreInfo import *
from PreFuntion import *
from Config_XML  import *
from initMyWindow import *
from BaseFunction import *
from AdvancedFunction import *

if __name__ == '__main__':
    app = QApplication(sys.argv)  #程序开始
    mainWindow = QMainWindow()    #创建空白窗体实例
    mainWindow.setWindowIcon(QIcon("c:/config/image/ICO.png"))

    myUI = myfrom_setup()  #创建初始化窗体类
    myUI.setupUi(mainWindow)      #初始化主窗体
    myUI.conifgWindow()         #动态初始化功能选项

    #Page1
    myPreInfo= PreinfoFunction(myUI)      #创建page1系统信息显示类
    myPrefunction = PreFunction(myUI)     #创建page1功能实现类
    #Page2
    myBaseFunction = BaseFunction(myUI)
    #Page3
    myAdvancedFunction = AdvancedFunction(myUI)

    configfile=config_XML()
    mainWindow.setWindowOpacity(0.8)
    mainWindow.statusBar().showMessage(mainWindow.tr("Centralink Autoinstall Toos V1.0"))
    mainWindow.show()               #显示主窗体

    sys.exit(app.exec_())