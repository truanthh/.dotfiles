Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

Add-WindowsCapability -Online -Name OpenSSH.Client~~~~0.0.1.0

choco install git; 
choco install zig; 
choco install nodejs; 
choco install neovim; 
choco install ripgrep; 
choco install wezterm; 
choco install autohotkey;

Happy Auto Hotkey
Hide Top Bar
User Themes
