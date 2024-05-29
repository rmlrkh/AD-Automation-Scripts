# Disable-InactiveUsers.ps1
Param (
    [int]$DaysInactive = 90,
    [string]$OU = "OU=Users,DC=example,DC=com"
)

Import-Module ActiveDirectory

$Date = (Get-Date).AddDays(-$DaysInactive)
$Users = Get-ADUser -Filter {LastLogonDate -lt $Date -and Enabled -eq $true} -SearchBase $OU -Properties LastLogonDate

foreach ($User in $Users) {
    Disable-ADAccount -Identity $User.SamAccountName
    Write-Host "Disabled user: $($User.SamAccountName) - Last logon: $($User.LastLogonDate)"
}
