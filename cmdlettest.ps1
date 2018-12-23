function test-message
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
