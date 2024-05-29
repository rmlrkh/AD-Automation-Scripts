# Get-LockedOutUsers.ps1
Import-Module ActiveDirectory

$LockedOutUsers = Search-ADAccount -LockedOut -UsersOnly

$LockedOutUsers | Select-Object Name, SamAccountName, LockedOut | Export-Csv -Path "LockedOutUsersReport.csv" -NoTypeInformation

Write-Host "Locked out users report generated: LockedOutUsersReport.csv"
