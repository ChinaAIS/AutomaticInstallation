try:
    import xml.etree.cElementTree as ET
except ImportError:
    import xml.etree.ElementTree as ET

class config_XML(object):
    def __init__(self):
        try:
           tree = ET.ElementTree(file="C:\\config\\config.xml")
        except:
            with open("C:\\config\\config.xml","w") as f:
                f.write("<config>\n")
                f.write(" "* 4 + "<environment>\n" )
                f.write(" "* 6 + "<function name='NotePad'>")
                f.write(" "* 6 + "</function>\n")
                f.write(" "* 4 + "</environment>\n")
                f.write(" "* 4 + "<base>\n" )
                f.write(" "* 4 + "</base>\n")
                f.write(" "* 4 + "<advanced>\n" )
                f.write(" "* 6 + "<function name='ThCG'>")
                f.write(" "* 6 + "</function>\n")
                f.write(" "* 4 + "</advanced>\n")
                f.write("</config>\n")
