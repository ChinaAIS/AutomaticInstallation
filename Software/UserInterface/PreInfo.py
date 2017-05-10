#基础功能页面信息显示类#
import wmi
import platform

from PyQt5.QtGui import QBrush
from PyQt5.QtGui import QPalette
from PyQt5.QtGui import QPixmap


class PreinfoFunction(object):
  def __init__(self,myWindows):
    try:
        w = wmi.WMI()
        for processor in w.Win32_Processor():
            myWindows.HardWare_info.append("<font color=red>processor.DeviceID: </font><font color=blue><b>%s</b></font>\n" % processor.DeviceID)
            myWindows.HardWare_info.append("<font color=red>Process Name: </font><font color=blue><b>%s</b></font>\n" % processor.Name.strip())
        totalMemSize = 0
        for memModule in w.Win32_PhysicalMemory():
           totalMemSize += int(memModule.Capacity)
        myWindows.HardWare_info.append("<font color=red>Memory Capacity: </font><font color=blue><b>%.2fMB</b></font>\n" %((totalMemSize + 1048575) / 1048576) )
        myWindows.HardWare_info.append('<font color=green>硬盘信息：</font>')
        for disk in w.Win32_LogicalDisk(DriveType=3):
            temp = disk.Caption + " %0.2f%% free" % (100.0 * int(disk.FreeSpace) / int(disk.Size))
            myWindows.HardWare_info.append("   "+temp)
        myWindows.HardWare_info.append('<font color=green>显示IP和MAC：</font>')
        for interface in w.Win32_NetworkAdapterConfiguration(IPEnabled=1):
            myWindows.HardWare_info.append(".  <font color=red>网卡驱动信息： </font><font color=blue><b>%s</b></font>\n" % interface.Description)
            myWindows.HardWare_info.append(".  <font color=red>网卡MAC地址： </font><font color=blue><b>%s</b></font>\n" % interface.MACAddress)
            myWindows.HardWare_info.append(".  <font color=red>IP地址： </font><font color=blue><b>%s</b></font>\n" % interface.IPAddress[0])
            try:
                myWindows.HardWare_info.append(".  <font color=red>外网IP接口： </font><font color=blue><b>%s</b></font>\n" % interface.IPAddress[1])
            except:
                pass
        myWindows.SoftWare_info.append("<font color=red>操作系统版本: </font><font color=blue><b>%s</b></font>\n" % platform.platform())
        myWindows.SoftWare_info.append("<font color=red>版本号/位: </font><font color=blue><b>%s</b></font>\n" % platform.version()+str(platform.architecture()))
        myWindows.SoftWare_info.append("<font color=red>计算机类型: </font><font color=blue><b>%s</b></font>\n" % platform.machine())
        myWindows.SoftWare_info.append("<font color=red>计算机的网络名称: </font><font color=blue><b>%s</b></font>\n" % platform.node())
        myWindows.SoftWare_info.append("<font color=red>计算机处理器信息: </font><font color=blue><b>%s</b></font>\n" % platform.processor())
        myWindows.SoftWare_info.append("<font color=red>操作系统类型: </font><font color=blue><b>%s</b></font>\n" % platform.system())
        myWindows.SoftWare_info.append( "<font color=red>Total : </font><font color=blue><b>%s</b></font>\n" % str(platform.uname()))
    except :
        raise SyntaxError("Preinfo Error")