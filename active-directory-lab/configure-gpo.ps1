#Пример настройки GPO через PowerShell (блокировка панели управления)

Import-Module GroupPolicy

New-GPO -Name "DisableControlPanel" -Comment "Block Control Panel for Users"
Set-GPRegistryValue -Name "DisableControlPanel" -Key "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" -ValueName "NoControlPanel" -Type DWord -Value 1
New-GPLink -Name "DisableControlPanel" -Target "OU=Users,DC=corp,DC=local"
