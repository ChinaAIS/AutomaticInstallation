#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.2
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here

#RequireAdmin
Run(@ComSpec & " /c " & 'Netsh advfirewall set currentprofile state off', "", @SW_HIDE)
Run(@ComSpec & ' /c netsh -c interface ip set address "Local Area Connection" static 192.168.1.221 255.255.255.0 192.168.1.1 1',"",@SW_HIDE)

RegWrite("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters","KeepAliveTime","REG_DWORD",0X000493e0)
RegWrite("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters","KeepAliveInterval","REG_DWORD",0X000003e8)
RegWrite("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters","MaxDataRetries","REG_DWORD",0X00000005)
RegWrite("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters","TcpTimeWaitDelay","REG_DWORD",0X0000003c)

