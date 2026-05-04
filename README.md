Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

choco install zig; 
choco install nodejs; 
choco install neovim; 
choco install ripgrep; 
choco install wezterm; 
choco install autohotkey;
