# 基础功能实现类#
import autoit
try:
    import xml.etree.cElementTree as ET
except ImportError:
    import xml.etree.ElementTree as ET

class BaseFunction(object):
    #基础功能曹函数实现
    def __init__(self,myWindow):
        for listchild in myWindow.Page2_CheckBox:
            listchild.clicked.connect(lambda:self.myCheckBox(myWindow))
        myWindow.Page2_Button_install.clicked.connect(lambda:self.myAutoit(myWindow))


    def myCheckBox(self,myWindow):
        for listchild in myWindow.Page2_CheckBox:
            #print(listchild.actions())
            if listchild.isChecked():
                if listchild.checkState() == False:
                   myWindow.Page2_Text.append(listchild.text()+ " is unChecked")
            if listchild.checkState() == False:
                if listchild.isChecked():
                   myWindow.Page2_Text.append(listchild.text()+ " is Checked")


    def myAutoit(self,myWindow):
        myWindow.Page2_Text.append("Start")
        try:
            with open("C:\\config\\Base.ini", "r") as f:
                for listchild in myWindow.Page2_CheckBox:
                    myWindow.Page2_Text.append("***************************"+ listchild.text()+"*****************************")
                    flag = False
                    if listchild.checkState() and listchild.isEnabled():
                             for temp_line in f:
                                 if "END" in temp_line and flag:
                                     tree = ET.ElementTree(file="C:\\config\\config.xml")
                                     root = tree.getroot()
                                     for temp_function in root[1].iter("function"):
                                         if str(listchild.text()) == temp_function.attrib['name']:
                                             listchild.setEnabled(False)
                                             temp_function.attrib['action']="True"
                                     tree.write("C:\\config\\config.xml")
                                     flag = False
                                     break
                                 if str(listchild.text()).strip() in temp_line and temp_line[0]=="[":
                                     flag = True
                                 if flag:
                                     if temp_line[0]!="[":
                                         myWindow.Page2_Text.append(temp_line.strip())
                                         exec(temp_line.strip())
        except :
            myWindow.Page2_Text.append(listchild.text() + "  Function install unSuccessfull")