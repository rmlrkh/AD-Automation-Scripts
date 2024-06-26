# Active Directory Automation Scripts

## Overview
This collection of PowerShell scripts is designed to automate common IT tasks related to Active Directory. Whether you're managing user accounts, groups, or generating reports, these scripts will help streamline your workflows and save you time.

## Table of Contents

1. [Overview](#overview)
2. [Scripts](#scripts)
    - [User Management](#user-management)
        - [Create New User Accounts](#create-new-user-accounts)
        - [Disable Inactive User Accounts](#disable-inactive-user-accounts)
        - [Reset User Passwords](#reset-user-passwords)
    - [Group Management](#group-management)
        - [Add Users to Groups](#add-users-to-groups)
        - [Remove Users from Groups](#remove-users-from-groups)
    - [Reporting](#reporting)
        - [Generate Locked Out Users Report](#generate-locked-out-users-report)
        - [Generate Group Membership Report](#generate-group-membership-report)
    - [Backup and Restore](#backup-and-restore)
        - [Backup Active Directory Objects](#backup-active-directory-objects)
        - [Restore Active Directory Objects](#restore-active-directory-objects)
    - [Account Management](#account-management)
        - [Automated Account Unlocking](#automated-account-unlocking)
        - [User Profile Cleanup](#user-profile-cleanup)
3. [Usage](#usage)
4. [Prerequisites](#prerequisites)
    - [Installing the Active Directory Module](#installing-the-active-directory-module)
5. [License](#license)

## Scripts

### User Management
#### Create New User Accounts
**Script:** `Create-NewUser.ps1`

**Description:** Automates the creation of new user accounts in Active Directory.

**Usage:**
```
.\Create-NewUser.ps1 -FirstName "John" -LastName "Doe" -OU "OU=Users,DC=example,DC=com" -DefaultPassword "P@ssw0rd"
```

Parameters:

-FirstName: The first name of the new user.
-LastName: The last name of the new user.
-OU: The Organizational Unit where the user account will be created (default is OU=Users,DC=example,DC=com).
-DefaultPassword: The default password for the new account.


### Disable Inactive User Accounts
**Script:** `Disable-InactiveUsers.ps1`

Description: Identifies and disables user accounts that haven't been used for a specified number of days.

**Usage:**
```
.\Disable-InactiveUsers.ps1 -DaysInactive 90 -OU "OU=Users,DC=example,DC=com"
```

Parameters:

-DaysInactive: The number of days of inactivity before an account is disabled (default is 90 days).
-OU: The Organizational Unit to search for inactive accounts (default is OU=Users,DC=example,DC=com).


### Reset User Passwords
**Script:** `Reset-UserPassword.ps1`

Description: Resets a user's password and forces them to change it at next logon.

**Usage:**
```
.\Reset-UserPassword.ps1 -SamAccountName "johndoe" -NewPassword "NewP@ssw0rd"
```
Parameters:

-SamAccountName: The SAM account name (username) of the user whose password will be reset.
-NewPassword: The new password for the user account.

## Group Management
### Add Users to Groups
**Script:** `Add-UsersToGroup.ps1`

Description: Adds multiple users to a specified Active Directory group.

**Usage:**
```
.\Add-UsersToGroup.ps1 -GroupName "GroupName" -UserNames "user1", "user2"
```
Parameters:

-GroupName: The name of the group to which users will be added.
-UserNames: An array of usernames to add to the group.

### Remove Users from Groups
**Script:** `Remove-UsersFromGroup.ps1`

Description: Removes multiple users from a specified Active Directory group.

Parameters:

-GroupName: The name of the group from which users will be removed.
-UserNames: An array of usernames to remove from the group.

## Reporting
### Generate Locked Out Users Report
Script: `Get-LockedOutUsers.ps1`

Description: Generates a report of user accounts that are currently locked out.

**Usage:**
```
.\Get-LockedOutUsers.ps1
```
Output: A CSV file named LockedOutUsersReport.csv containing the names, SAM account names, and lockout status of the locked-out users.

### Generate Group Membership Report
**Script:** `Get-GroupMembershipReport.ps1`

Description: Generates a report of all members in a specified Active Directory group.

**Usage:**
```
.\Get-GroupMembershipReport.ps1 -GroupName "GroupName"
```
Parameters:

-GroupName: The name of the group for which the membership report will be generated.
Output: A CSV file named GroupName-MembershipReport.csv containing the names and SAM account names of the group members.

## Backup and Restore
### Backup Active Directory Objects
**Script:** `Backup-ADObjects.ps1`

Description: Backs up specified Active Directory objects to a file.

**Usage:**
```
.\Backup-ADObjects.ps1 -ObjectType "User" -BackupFilePath "C:\Backup\ADUsersBackup.ldf"
```

Parameters:

-ObjectType: The type of AD object to back up (e.g., "User", "Group").
-BackupFilePath: The file path where the backup will be stored.

### Restore Active Directory Objects
**Script:** `Restore-ADObjects.ps1`

Description: Restores Active Directory objects from a backup file.

**Usage:**
```
.\Restore-ADObjects.ps1 -BackupFilePath "C:\Backup\ADUsersBackup.ldf"
```

Parameters:

-BackupFilePath: The file path of the backup to restore.

## Account Management
### Automated Account Unlocking
**Script:** `Unlock-ADAccounts.ps1`

Description: Automates the process of unlocking user accounts in Active Directory.

**Usage:**
```
.\Unlock-ADAccounts.ps1 -SamAccountNames "user1", "user2"
```

Parameters:

-SamAccountNames: An array of SAM account names to unlock.

### User Profile Cleanup
**Script:** `Cleanup-UserProfiles.ps1`

Description: Cleans up user profiles on local machines to free up space.

Usage:
```
.\Cleanup-UserProfiles.ps1 -ComputerName "ComputerName" -DaysOld 30
```
Parameters:

-ComputerName: The name of the computer where profiles will be cleaned up.
-DaysOld: Profiles older than this number of days will be deleted.

## Usage
To use these scripts, follow these steps:

1. Launch PowerShell with administrative privileges.
2. Navigate to the directory where the script is located and run it with the appropriate parameters.

# Create a new user
```
.\Create-NewUser.ps1 -FirstName "John" -LastName "Doe" -OU "OU=Users,DC=example,DC=com" -DefaultPassword "P@ssw0rd"
```
# Disable inactive users
```
.\Disable-InactiveUsers.ps1 -DaysInactive 90 -OU "OU=Users,DC=example,DC=com"
```
# Reset a user password
```
.\Reset-UserPassword.ps1 -SamAccountName "johndoe" -NewPassword "NewP@ssw0rd"
```
# Add users to a group
```
.\Add-UsersToGroup.ps1 -GroupName "IT" -UserNames "user1", "user2"
```
# Remove users from group
```
.\Remove-UsersFromGroup.ps1 -GroupName "GroupName" -UserNames "user1", "user2"
```
# Backup AD objects
```
.\Backup-ADObjects.ps1 -ObjectType "User" -BackupFilePath "C:\Backup\ADUsersBackup.ldf"
```
# Restore AD objects
```
.\Restore-ADObjects.ps1 -BackupFilePath "C:\Backup\ADUsersBackup.ldf"
```
# Unlock AD accounts
```
.\Unlock-ADAccounts.ps1 -SamAccountNames "user1", "user2"
```
# Cleanup user profiles
```
.\Cleanup-UserProfiles.ps1 -ComputerName "ComputerName" -DaysOld 30
```
# Generate a locked-out users report
```
.\Get-LockedOutUsers.ps1
```
# Generate a group membership report
```
.\Get-GroupMembershipReport.ps1 -GroupName "IT"
```
## Prerequisites
To use these scripts, ensure you have the following:

**Active Directory module for Windows PowerShell:** This module must be installed and imported into your PowerShell session.

**Administrative Privileges:** You need to run PowerShell as an administrator to execute these scripts.

### Installing the Active Directory Module
If the Active Directory module is not installed, you can install it by running:

```Install-WindowsFeature -Name RSAT-AD-PowerShell```

## License
This repository is licensed under the MIT License. See the LICENSE file for more information.
