# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'CentraLinkFunction.ui'
#
# Created: Sun May 08 21:00:34 2016
#      by: PyQt4 UI code generator 4.11.2
#
# WARNING! All changes made in this file will be lost!
import os,sys
from PyQt4 import QtCore, QtGui
from AutoValidate import *
from p_Func import *


try:
    _fromUtf8 = QtCore.QString.fromUtf8
except AttributeError:
    def _fromUtf8(s):
        return s

try:
    _encoding = QtGui.QApplication.UnicodeUTF8
    def _translate(context, text, disambig):
        return QtGui.QApplication.translate(context, text, disambig, _encoding)
except AttributeError:
    def _translate(context, text, disambig):
        return QtGui.QApplication.translate(context, text, disambig)

class Ui_Dialog(object):
    def setupUi(self, Dialog):
        Dialog.setObjectName(_fromUtf8("Dialog"))
        Dialog.resize(524, 492)
        self.groupBox = QtGui.QGroupBox(Dialog)
        self.groupBox.setGeometry(QtCore.QRect(10, 4, 501, 440))
        self.groupBox.setObjectName(_fromUtf8("groupBox"))
        self.tabWidget = QtGui.QTabWidget(self.groupBox)
        self.tabWidget.setGeometry(QtCore.QRect(6, 17, 491, 420))
        self.tabWidget.setObjectName(_fromUtf8("tabWidget"))
        self.tab = QtGui.QWidget()
        self.tab.setObjectName(_fromUtf8("tab"))
        self.tabWidget.addTab(self.tab, _fromUtf8(""))
        self.widget = QtGui.QWidget()
        self.widget.setObjectName(_fromUtf8("widget"))
        self.tabWidget.addTab(self.widget, _fromUtf8(""))
        self.tab_3 = QtGui.QWidget()
        self.tab_3.setObjectName(_fromUtf8("tab_3"))
        self.checkBox = QtGui.QCheckBox(self.tab_3)
        self.checkBox.setGeometry(QtCore.QRect(20, 20, 251, 18))
        self.checkBox.setObjectName(_fromUtf8("checkBox"))
        self.checkBox_2 = QtGui.QCheckBox(self.tab_3)
        self.checkBox_2.setGeometry(QtCore.QRect(20, 60, 191, 18))
        self.checkBox_2.setObjectName(_fromUtf8("checkBox_2"))
        self.checkBox_3 = QtGui.QCheckBox(self.tab_3)
        self.checkBox_3.setGeometry(QtCore.QRect(21, 99, 71, 18))
        self.checkBox_3.setObjectName(_fromUtf8("checkBox_3"))
        self.checkBox_4 = QtGui.QCheckBox(self.tab_3)
        self.checkBox_4.setGeometry(QtCore.QRect(74, 22, 91, 20))
        self.checkBox_4.setObjectName(_fromUtf8("checkBox_4"))
        self.checkBox_5 = QtGui.QCheckBox(self.tab_3)
        self.checkBox_5.setGeometry(QtCore.QRect(75, 60, 91, 20))
        self.checkBox_5.setObjectName(_fromUtf8("checkBox_5"))
        self.tabWidget.addTab(self.tab_3, _fromUtf8(""))
        self.pushButton = QtGui.QPushButton(Dialog)
        self.pushButton.setGeometry(QtCore.QRect(403, 457, 75, 23))
        self.pushButton.setObjectName(_fromUtf8("pushButton"))

        self.retranslateUi(Dialog)
        self.tabWidget.setCurrentIndex(2)
        self.pushButton.clicked.connect(self.ImportCsv)
        QtCore.QMetaObject.connectSlotsByName(Dialog)

    def retranslateUi(self, Dialog):
        Dialog.setWindowTitle(_translate("Dialog", "Dialog", None))
        self.groupBox.setTitle(_translate("Dialog", "CentraLink Function", None))
        self.tabWidget.setTabText(self.tabWidget.indexOf(self.tab), _translate("Dialog", "Basic Function", None))
        self.tabWidget.setTabText(self.tabWidget.indexOf(self.widget), _translate("Dialog", "Advanced Function", None))
        self.checkBox.setText(_translate("Dialog", "NS (                                       )", None))
        self.checkBox_2.setText(_translate("Dialog", "DS  (                                      )", None))
        self.checkBox_3.setText(_translate("Dialog", "LS ", None))
        self.checkBox_4.setText(_translate("Dialog", "Generate CSV ", None))
        self.checkBox_5.setText(_translate("Dialog", "Generate CSV ", None))
        self.tabWidget.setTabText(self.tabWidget.indexOf(self.tab_3), _translate("Dialog", "AutoValidate", None))
        self.pushButton.setText(_translate("Dialog", "Installation", None))

    def ImportCsv(self, Dialog):
        if self.checkBox_4.isChecked():
            try:
                GenerateNsCsvFile()
            except:
                print('Generate AutoValidate NsCsv Fail')
            print('Generate AutoValidate NsCsv Successful')
        if self.checkBox_5.isChecked():
            try:
                GenerateDsCsvFile()
            except:
                print('Generate AutoValidate DsCsv Fail') 
            print('Generate AutoValidate DsCsv Successful')
        bLogin=False    
        if self.checkBox.isChecked():
            Login()
            bLogin=True
            NsCsvFile = os.getcwd()+r'\NS\sslf_imp.txt'
            try:
                ImportCsvFile(NsCsvFile)
            except:
                print('Import AutoValidate NsCsv Fail')
            print('Import AutoValidate NsCsv Successful')
        if self.checkBox_2.isChecked():
            if not bLogin:
                Login()
                bLogin=True
            DsCsvFile = os.getcwd()+r'\DS\sslf_imp.txt'
            try:
                ImportCsvFile(DsCsvFile)
            except:
                print('Import AutoValidate DsCsv Fail')
            print('Import AutoValidate DsCsv Successful')
        if self.checkBox_3.isChecked():    
            if not bLogin:
                Login()
                bLogin=True
            LsCsvFile = os.getcwd()+r'\LS\sslf_imp.txt'
            ImportCsvFile(LsCsvFile)
            print('Import AutoValidate LsCsv Successful')
        if bLogin:
            Logout()
            
        #time.sleep(3)
        #os._exit(0)

if __name__=='__main__':
    app=QtGui.QApplication(sys.argv)
    Form=QtGui.QWidget()
    ui=Ui_Dialog()
    ui.setupUi(Form)
    Form.show()
    sys.exit(app.exec_())
