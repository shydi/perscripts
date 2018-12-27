<#
.SYNOPSIS
Take user phone as input to return a user's AD Name and Department. 

.DESCRIPTION 
This script will take a user's phone number as a parameter and return the user's Name and Department.

.SYNTAX
.\PS-Test1.ps1 -phone xxx-xxx-xxxx

.PARAMETER phone
This will take a numeric value as input in order to pull user data from AD. 
#>
param(

    [Parameter(Mandatory=$true)]
    [string]$phone
)


$userExists = Get-ADUser -Filter ({telephoneNumber -eq $phone}) `
    -Properties SAMAccountName,Department,telephoneNumber | `
    Format-Table -Property @{l="Username";e="SAMAccountName"},Department,telephoneNumber -AutoSize -Wrap

$userExport = Get-ADUSer -Filter ({telephoneNumber -eq $phone}) `
-Properties SAMAccountName,Department,telephoneNumber `
| Select-Object @{l="Username";e="SAMAccountName"},Department,@{l="Telephone";e="telephoneNumber"}
#$currentUser = ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent())
#$testadmin = $currentUser.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

<#function CheckForAD {
    [cmdletbinding()]
    param(
        $admodule = (Get-Module -ListAvailable -Name ActiveDirectory)
    )
    if ($admodule)
    {
        Write-Host "AD is Installed"
    }
    else 
    {
        Install-Module ActiveDirectory
    }
}

if ($testadmin -eq "True")
{
    CheckForAD
}
else 
{
    Write-Host "Admin priviledges are needed. Please restart the application as an administrator"
}
#>

if ($null -eq $userExists)
{
    Write-Host "User does not exist"
}
else {
    $userExists 
    $userExport |Export-Csv -Path "Test.csv" -NoTypeInformation -Append
    Invoke-Item -Path .\Test.csv
}