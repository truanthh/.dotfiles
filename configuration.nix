{ config, lib, pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;

  imports = [ 
    ./hardware-configuration.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # ========== АППАРАТНОЕ ОБЕСПЕЧЕНИЕ ==========
  hardware.maccel = {
    enable = true;
    enableCli = true;
    parameters = {
      mode = "linear";
      sensMultiplier = 1.0;
      acceleration = 0.0;
      offset = 0.0;
      outputCap = 1.0;
    };
  };

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    open = false;
    nvidiaSettings = true;
    # Для Wayland
    forceFullCompositionPipeline = false;
  };

  networking.hostName = "nixos-btw";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Moscow";

  # services.getty.autologinUser = "truanthh";

  programs.niri = {
    enable = true;
  };

  services.xserver.enable = false;

  # Включаем GDM для входа
  services.displayManager.sddm.enable = false;
  services.displayManager.gdm.enable = true;

  # ========== ПРОГРАММЫ ==========
  programs.firefox.enable = true;

  # Звук через PipeWire
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
    pavucontrol
    pamixer
    playerctl
    wezterm
    nautilus         # Файловый менеджер (опционально)
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "26.05";
}
