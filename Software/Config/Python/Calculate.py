from __future__ import division
import sys
from math import *
from PyQt5.QtCore import *
from PyQt5.QtGui import *
from PyQt5.QtWidgets import *

class Form(QDialog):
    def __init__(self,parent=None):
        super(Form,self).__init__(parent)
        self.browser = QTextBrowser()
        self.lineedit = QLineEdit("Type an expression and press Enter")
        self.lineedit.selectAll()
        layout = QVBoxLayout()
        layout.addWidget(self.browser)
        layout.addWidget(self.lineedit)
        self.setLayout(layout)
        self.lineedit.setFocus()
        self.lineedit.returnPressed.connect(self.updateUi)
        self.setWindowTitle("Calculate")

    def updateUi(self):
        try:
            Text = self.lineedit.text()
            self.browser.append("%s = <b>Processor ID: %s</b>" %(Text,eval(Text)))
        except:
            self.browser.append("<font color=red>%s</font>" % Text)
app = QApplication(sys.argv)
form = Form()
form.show()
app.exec_()