{ config, lib, pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;

  imports = [ 
    ./hardware-configuration.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # ========== АППАРАТНОЕ ОБЕСПЕЧЕНИЕ ==========
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

  # ========== KDE PLASMA ВМЕСТО NIRI ==========
  
  # Включаем SDDM (он уже используется для KDE)
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };

  # Автовход в KDE
  services.displayManager = {
    autoLogin = {
      enable = true;
      user = "truanthh";
    };
    defaultSession = "plasma";
  };

  # Включаем KDE Plasma
  services.desktopManager.plasma6.enable = true;
  
  # Опционально: включаем набор приложений KDE
  # services.xserver.desktopManager.plasma5.enable = true; # если нужен X11

  # Включаем KDE Connect для синхронизации с телефоном
  programs.kdeconnect.enable = true;

  # ========== ОСТАЛЬНЫЕ ПРОГРАММЫ ==========
  programs.firefox.enable = true;
  programs.amnezia-vpn.enable = true;

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
    # Терминалы (оставляем для выбора)
    alacritty
    wezterm
    konsole  # родной терминал KDE

    # Лаунчер (можно оставить fuzzel или использовать krunner)
    fuzzel

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
    
    # KDE-специфичные пакеты (опционально)
    kdePackages.kate        # редактор
    kdePackages.gwenview    # просмотрщик изображений
    kdePackages.okular      # просмотр PDF
    kdePackages.dolphin     # файловый менеджер (уже есть в plasma6)
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "26.05";
}
