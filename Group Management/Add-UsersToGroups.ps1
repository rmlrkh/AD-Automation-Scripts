# Add-UsersToGroups.ps1
Param (
    [string]$GroupName,
    [string[]]$UserNames
)

Import-Module ActiveDirectory

foreach ($UserName in $UserNames) {
    Add-ADGroupMember -Identity $GroupName -Members $UserName
    Write-Host "Added $UserName to $GroupName."
}
