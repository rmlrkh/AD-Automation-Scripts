# Reset-UserPassword.ps1
Param (
    [string]$SamAccountName,
    [string]$NewPassword = "NewP@ssw0rd"
)

Import-Module ActiveDirectory

Set-ADAccountPassword -Identity $SamAccountName -NewPassword (ConvertTo-SecureString $NewPassword -AsPlainText -Force)
Set-ADUser -Identity $SamAccountName -ChangePasswordAtLogon $true

Write-Host "Password for $SamAccountName has been reset and user must change password at next logon."
