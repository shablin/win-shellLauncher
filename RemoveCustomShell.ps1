#requires -RunAsAdministrator


$username = ""


$sl = [wmiclass]"\\localhost\root\standardcimv2\embedded:WESL_UserSetting"
$user = Get-WmiObject Win32_UserAccount -Filter "LocalAccount=True AND Name=$username"
$userSID = $user.SID

$sl.RemoveCustomShell($userSID)