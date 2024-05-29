# Create-NewUser.ps1
Param (
    [string]$FirstName,
    [string]$LastName,
    [string]$OU = "OU=Users,DC=example,DC=com",
    [string]$DefaultPassword = "P@ssw0rd"
)

Import-Module ActiveDirectory

$UserPrincipalName = "$FirstName.$LastName@example.com"
$DisplayName = "$FirstName $LastName"
$SamAccountName = "$FirstName.$LastName"

New-ADUser -GivenName $FirstName `
           -Surname $LastName `
           -Name $DisplayName `
           -DisplayName $DisplayName `
           -UserPrincipalName $UserPrincipalName `
           -SamAccountName $SamAccountName `
           -Path $OU `
           -AccountPassword (ConvertTo-SecureString $DefaultPassword -AsPlainText -Force) `
           -Enabled $true `
           -PasswordNeverExpires $true

Write-Host "User $DisplayName created successfully."
