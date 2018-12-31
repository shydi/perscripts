<#function test-message
{
    [CmdletBinding()]
    param(
        [int]$a,
        [int]$b
        )

    Write-Host "Value A: $a `nValue B: $B"
    Write-Host "`nCombined value: $a + $b"
    Write-Host "`nThis is a test message"
    Write-Verbose "`nThis is a verbose message"

}

#test-message

for ($i=1;$i -le 10; $i++)
{   
    Write-Host "Value: ($i)"    
} 
#>

#$testex = Get-ADUser -Filter ({telephoneNumber -eq "78148"}) -Properties Department,TelephoneNumber,SAMAccountName `
#|Select-Object Department,@{l="Phone Number";e="telephoneNumber"},@{l="Username";e="SAMAccountName"}

param(
    [parameter(Mandatory=$true)]
    [string]$ou = $(throw "Please enter an OU")
)

$oupath = "LDAP://OU=$ou,OU=Workstations,DC=ctisl,dc=gtri,dc=org"
$outest = [adsi]::Exists($oupath)

if ($outest -eq $true){
    Write-Host "$ou OU exists."
}
else {
    Write-Host "$ou OU does not exist."    
}
