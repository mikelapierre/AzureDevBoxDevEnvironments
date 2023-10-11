Write-Host "Installing Chocolatey..."
Set-ExecutionPolicy Bypass -Scope Process -Force
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072 # TLS 1.2
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
Write-Host "Chocolatey Installed"

Write-Host "Installing Packages..."
choco install vscode -y
choco install 7zip -y
choco install pwsh -y
choco install notepadplusplus -y
choco install adobereader -y
choco install kubernetes-cli -y
choco install kubernetes-helm -y
choco install terraform -y
choco install docker-desktop -y

Write-Host "Install Azure Developers Tools..."
choco install microsoftazurestorageexplorer -y
choco install azure-data-studio -y
choco install azcopy10 -y
choco install azure-cli -y
Write-Host "Azure Developers tools installed"

Write-Host "Install Git..."
choco install git -y

Write-Host "Refresh Environment Variable - Path"
RefreshEnv.cmd

Write-Host "All Packages Installed"
try {
    # Clone Application from azure
    Write-Host "Install wsl to run docker linux container"
    wsl --install -d ubuntu
}
catch {
    exit -1
}