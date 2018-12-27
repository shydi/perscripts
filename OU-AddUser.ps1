<#
.SYNOPSIS
Adds a user to an Active Directory OU (Orginazational Unit)

.PARAMETER OU
This paramter will have OUs as the preset values. 


.DESCRIPTION
This script takes inputs for the username and OU and place place the user in the designated OU. 


.EXAMPLE
OU-AddUser -OU XYZ -User flast -Verbose
#>

param(
    [string]$user,
    [string]$OU = ("OU1","OU2","OU3")
)

Write-Host "OU: $OU `nUser: $user"