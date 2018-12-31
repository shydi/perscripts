<#
.SYNOPSIS
Adds a computer to an Active Directory OU (Orginazational Unit)

.PARAMETER OU
This paramter will have OUs as the preset values. 


.DESCRIPTION
This script takes inputs for the username and OU and place place the user in the designated OU. 


.EXAMPLE
OU-AddUser -OU XYZ -User flast -Verbose
#>

param(
    [string]$hostname = $env:COMPUTERNAME,
    [Parameter(Mandatory=$true)]
    [ValidateSet("OU1","OU2","OU3")]
    [string]$OU
)

[string]$oupath = "LDAP://OU=$ou,OU=Workstations,DC=ctisl,dc=gtri,dc=org" 
$testpath = [adsi]::Exists($oupath)

if ($testpath -eq $true)
{
    Get-ADComputer $hostname | Move-ADObject -TargetPath "$oupath,OU=Workstations,DC=ctisl,dc=gtri,dc=org"
}
else 
{
    Write-Host "$OU OU does not exist."
}