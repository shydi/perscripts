<#
.SYNOPSIS
Adds a computer to an Active Directory OU (Orginazational Unit)

.PARAMETER OU
This paramter will have OUs as the preset values. This script will test for the OU entered to make sure it exists before moving the object
Otherwise, it will throw an error. 

.PARAMETER hostname
By default, it will pull the current machine's hostname. 
Otherwise, a separate hostname can be passed through the parameter. 

.DESCRIPTION
This script takes inputs for the username and OU and place place the user in the designated OU. 

.EXAMPLE
OU-AddUser -OU XYZ -Hostname localhost
#>

#Initialize hostname and OU parameters using a param() block
param(
    [string]$hostname = $env:COMPUTERNAME,
    [Parameter(Mandatory=$true)]
    [ValidateSet("OU1","OU2","OU3")] #Validates OU parameter with these 3 values; allows them to be selected from tabbing through
    [string]$OU
)

#The following block sets a variable to an LDAP path for the OU. Then sets another variable to receive data back from testing the OU path (returns true or false)
[string]$oupath = "LDAP://OU=$ou,OU=Workstations" 
$testpath = [adsi]::Exists($oupath)

#If $testpath is true, the object is moved to the requested OU. Otherwise, an error is thrown
if ($testpath -eq $true)
{
    Get-ADComputer $hostname | Move-ADObject -TargetPath "$ou,OU=Workstations"
}
else 
{
    Write-Host "$OU OU does not exist."
}