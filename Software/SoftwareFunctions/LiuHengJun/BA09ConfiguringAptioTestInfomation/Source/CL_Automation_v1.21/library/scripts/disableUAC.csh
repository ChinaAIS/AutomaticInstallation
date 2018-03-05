//////////////////////////////////////////////////////////////////////////
// Script:  disableUAC.csh
// Purpose: Spawn the UAC applet so the user can disable UAC 
// Notes:   A reboot is required after the setting has been completed
// Version: 1.0 Initial Release
//////////////////////////////////////////////////////////////////////////

sendMessage \n
sendMessage Disable the User Account Control settings
sendMessage Within the UAC Settings applet slide the button to "Never notify"
sendMessage Select "OK" when completed\n\n
os/controlPanel/startUACSettingsApplet

sendMessage \n\n
sendMessage Disabling the UAC has completed
sendMessage The changes performed in this script require a reboot
sendMessage The system will be restarted after the "Enter" key is selected
pause
os/administrative/reboot

