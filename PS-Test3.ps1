<#
.SYNOPSIS
Outputs user data based on a list of phone numbers

.DESCRIPTION 
This script will allow the user to select a path for a CSV containing user phone numbers. 
It will iterate each bit of data and output the results into a separate CSV file.

.SYNTAX
.\PS-Test1.ps1 -phone xxx-xxx-xxxx

.PARAMETER path
This will take a string as input to determine the path othe CSV file to import 
#>
param(
    [Parameter(Mandatory=$true)]
    [string]$path
)

$userData = @()
$phoneImport = Import-Csv -Path $path -Header "Numbers"

foreach ($line in $phoneImport)
{
    $n = $line.Numbers
    $userData += Get-ADUser -Filter ({telephoneNumber -eq $n}) -Properties Department, SAMAccountName, telephoneNumber `
    | Select-Object -Property @{l="Username";e="SAMAccountName"},Department,@{l="Phone Number";e="telephoneNumber"} 
}

$user = "shydi"
$pass = Read-Host -AsSecureString -Prompt  

$url = "https://api.github.com"
$endpoint = "/gists"
$token = "?access_token=cc2df3b7c19a236036de8eba845876a8efce5bd0"

$cred = New-Object System.Management.Automation.PSCredential($)

$fullurl = "$url$endpoint"
$gist = Invoke-RestMethod -Method Post -Uri $fullurl -Body $userData 
$gist
