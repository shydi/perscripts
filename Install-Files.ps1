<# This is a basic install script that will download and install various necesarry programs and modules #>

<# Programs Needed:
    VSCode: https://aka.ms/win32-x64-user-stable
    OpenVPN: https://swupdate.openvpn.org/community/releases/openvpn-install-2.4.6-I602.exe
    Git: https://github.com/git-for-windows/git/releases/download/v2.20.1.windows.1/Git-2.20.1-64-bit.exe
#>

[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12


function Install-Git
{
    [CmdletBinding()]
    param()
    Invoke-WebRequest -Uri https://github.com/git-for-windows/git/releases/download/v2.20.1.windows.1/Git-2.20.1-64-bit.exe -OutFile C:\Users\sgrell3\Downloads\git_install.exe
    Start-Process -FilePath C:\Users\sgrell3\Downloads\git_install.exe -ArgumentList "/s"
}

function Install-OpenVPN
{
    Invoke-WebRequest -Uri https://swupdate.openvpn.org/community/releases/openvpn-install-2.4.6-I602.exe -OutFile C:\Users\sgrell3\Downloads\openvpn_install.exe
    Start-Process -FilePath C:\Users\sgrell3\Downloads\openvpn_install.exe -ArgumentList "/S"
}

function Install-VSCode 
{
    Invoke-WebRequest -Uri https://aka.ms/win32-x64-user-stable -OutFile C:\Users\sgrell3\Downloads\vscode_install.exe
    Start-Process -FilePath C:\Users\sgrell3\Downloads\vscode_install.exe -ArgumentList "/S"
}

Install-Git