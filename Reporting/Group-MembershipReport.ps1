# Get-GroupMembershipReport.ps1
Param (
    [string]$GroupName
)

Import-Module ActiveDirectory

$GroupMembers = Get-ADGroupMember -Identity $GroupName

$GroupMembers | Select-Object Name, SamAccountName | Export-Csv -Path "$GroupName-MembershipReport.csv" -NoTypeInformation

Write-Host "Group membership report for $GroupName generated: $GroupName-MembershipReport.csv"
