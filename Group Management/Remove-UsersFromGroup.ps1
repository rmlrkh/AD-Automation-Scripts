# Remove-UsersFromGroup.ps1
Param (
    [string]$GroupName,
    [string[]]$UserNames
)

Import-Module ActiveDirectory

foreach ($UserName in $UserNames) {
    Remove-ADGroupMember -Identity $GroupName -Members $UserName -Confirm:$false
    Write-Host "Removed $UserName from $GroupName."
}
