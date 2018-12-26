<#  
.SYNOPSIS
This script is for the sake of building a number of VMs from a VHD.
Specifically, this will be used to build multiple iperf VMs for bandwidth testing.
.DESCRIPTION
Build-VM uses basic user input to specify the path of the base VHD and the number of VMs to make.
It then runs a basic New-VM cmdlet with preset VM specs to build a Hyper-V VM. 
This script can be paired with the Set-VMSpecs script to set the specs according to user input. 
.PARAMETER VMs
This accepts an integer value as a parameter to determine the number of VMs to create. 
The default value is 10 if no value is passed.
.PARAMETER vhd
This accepts a string as a parameter to determine the path of the base VHD. An error will be thrown if nothing is passed.
.EXAMPLE
Build-VM.ps1 -VMs 10 VHD C:\Users\Admin\Documents\example.vhd
This example builds 10 VMs based on the 'example' base VHD file. 
#>

param
    (   
    [int]$VMs = 10,
    [string]$vhd = $(throw "Please enter a path for the base VHD")
    )

$VMBaseSpecs = @{
    MemoryStartupBytes = 1GB
    VHDPath = $vhd
    Path = "C:\VMs"
    SwitchName = "MgmtSwitch"
}

for ($i=1;$i -le $VMs; $i++)
{   
    New-VM -Name "iPerfVM[$i]" @VMBaseSpecs
}   

Test Update test test