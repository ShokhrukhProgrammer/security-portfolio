#Создание пользователей в домене

Import-Module ActiveDirectory

$users = @(
@{Name="Alice Admin";Username="alice.admin";Password="P@ssw0rd1";Group="Domain Admins"},
@{Name="Bob User";Username="bob.user";Password="P@ssw0rd2";Group="Domain Users"}
)

foreach ($u in $users) {
$securePass = ConvertTo-SecureString $u.Password -AsPlainText -Force
New-ADUser -Name $u.Name -AccountPassword $securePass -Enabled $true -SamAccountName $u.Username
Add-ADGroupMember -Identity $u.Group -Members $u.Username
}
