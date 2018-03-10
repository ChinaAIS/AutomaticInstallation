from  Centralink_Function_install_rc import *
try:
    import xml.etree.cElementTree as ET
except ImportError:
    import xml.etree.ElementTree as ET

class myfrom_setup(Ui_MainWindow):
      def conifgWindow(self):
          _translate = QtCore.QCoreApplication.translate
          self.Page1_CheckBox =[]
          self.Page2_CheckBox =[]
          self.Page3_CheckBox =[]
          tree = ET.ElementTree(file="..\\config\\config.xml")
          root = tree.getroot()
          i = 0
          for child in root[0]:
              #print(child.attrib['name'])
              self.Page1_CheckBox.append(QtWidgets.QCheckBox(self.layoutWidget))
              self.Page1_CheckBox[i].setText(_translate("MainWindow",child.attrib['name']))
              self.verticalLayout.addWidget(self.Page1_CheckBox[i])
              i+=1

          i = 0
          for child in root[1]:
              #print(child.attrib['name'])
              self.Page2_CheckBox.append(QtWidgets.QCheckBox(self.layoutWidget))
              self.Page2_CheckBox[i].setText(_translate("MainWindow",child.attrib['name']))
              self.verticalLayout_2.addWidget(self.Page2_CheckBox[i])
              i+=1

          i = 0
          for child in root[2]:
              #print(child.attrib['name'])
              self.Page3_CheckBox.append(QtWidgets.QCheckBox(self.layoutWidget))
              self.Page3_CheckBox[i].setText(_translate("MainWindow",child.attrib['name']))
              self.verticalLayout_3.addWidget(self.Page3_CheckBox[i])
              i+=1

          for child in root.iter("function"):
              if(child.attrib["action"]=="True"):
                  #print(child.attrib["name"])
                  for temp_checkbox in self.Page1_CheckBox:
                      if temp_checkbox.text()==child.attrib["name"]:
                          temp_checkbox.setChecked(True)
                          temp_checkbox.setEnabled(False)
                  for temp_checkbox in self.Page2_CheckBox:
                      if temp_checkbox.text()==child.attrib["name"]:
                          temp_checkbox.setChecked(True)
                          temp_checkbox.setEnabled(False)
                  for temp_checkbox in self.Page3_CheckBox:
                      if temp_checkbox.text()==child.attrib["name"]:
                          temp_checkbox.setChecked(True)
                          temp_checkbox.setEnabled(False)


