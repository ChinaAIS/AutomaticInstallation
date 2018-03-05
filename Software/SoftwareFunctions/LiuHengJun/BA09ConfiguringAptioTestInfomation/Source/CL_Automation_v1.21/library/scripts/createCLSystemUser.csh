//////////////////////////////////////////////////////////////////////////
// Script:  createCLSystemUser.csh
// Purpose: Creates the CentraLink SYSTEM user
// Notes:	None
// Version: 1.0 Initial Release
//////////////////////////////////////////////////////////////////////////

#include commonCLv16.inc

sendMessage \n\n
sendMessage Creating the CentraLink system user
sendMessage Enter the user name and password information to create the CentraLink system user
sendMessage $bulletinPrint for the user name and password to use when creating this user
usercredentials?
os/usersAndGroups/createUser $****USER_NAME**** $****USER_PASS**** 
os/usersAndGroups/addUserToGroup $****USER_NAME**** Administrators
os/usersAndGroups/removeUserFromGroup $****USER_NAME**** Users
os/usersAndGroups/setUserPasswordExpiration $****USER_NAME**** false
os/usersAndGroups/disableUserInteractiveLogon $****USER_NAME****
os/usersAndGroups/enableUserLogonAsAService $****USER_NAME****
sendMessage \n\n
sendMessage Creating the CentraLink system user has completed


