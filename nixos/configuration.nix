{ config, lib, pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;

  imports = [ 
    ./hardware-configuration.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # ========== АППАРАТНОЕ ОБЕСПЕЧЕНИЕ ==========
  # Убираем hardware.maccel — он не работает
  # hardware.maccel = { ... };

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    open = false;
    nvidiaSettings = true;
    forceFullCompositionPipeline = false;
  };

  networking.hostName = "nixos-btw";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Moscow";

  # ========== NIRI ==========
  programs.niri.enable = true;
  programs.amnezia-vpn.enable = true;

  # ===== SDDM с автовходом в Niri =====
  
  # Включаем SDDM с автовходом
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    
  };

  services.displayManager = {
    autoLogin = {
      enable = true;
      user = "truanthh";
    };
  };

  # Регистрируем Niri как сессию
  services.displayManager.sessionPackages = [ pkgs.niri ];
  services.displayManager.defaultSession = "niri";

  programs.firefox.enable = true;

  # SOUND
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  hardware.alsa.enablePersistence = true;

  # ========== ПОЛЬЗОВАТЕЛИ ==========
  users.users.truanthh = {
    isNormalUser = true;
    extraGroups = [ "wheel" "video" "audio" ];
    packages = with pkgs; [ tree ];
  };

  # ========== СИСТЕМНЫЕ ПАКЕТЫ ==========
  environment.systemPackages = with pkgs; [
    alacritty
    fuzzel
    waybar

    # Утилиты
    alsa-utils
    vim
    neovim
    wget
    curl
    git
    htop
    btop
    nix-tree
    ripgrep
    tree-sitter
    gcc
    docker
    docker-compose
    nodejs
    telegram-desktop
    amnezia-vpn
    amneziawg-tools
    amneziawg-go
    wezterm
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "26.05";
}
