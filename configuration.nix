{ config, lib, pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;

  imports = [ ./hardware-configuration.nix ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    open = false;
    nvidiaSettings = true;
    forceFullCompositionPipeline = true;
  };

  networking.hostName = "nixos-btw";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Moscow";

  services.xserver = {
    enable = true;
    mouse = {
      accelProfile = "flat";
      # Опционально: добавьте accelSpeed, если нужно отрегулировать общую скорость
      # accelSpeed = "0";
    };
    xkb.layout = "us,ru";
    xkb.options = "grp:alt_shift_toggle";


    videoDrivers = [ "nvidia" ];
    desktopManager.xterm.enable = false;

    deviceSection = ''
        Option "metamodes" "nvidia-auto-select +0+0 { ForceFullCompositionPipeline = On }"
        Option "TripleBuffer" "true"
    '';

    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [ i3status i3lock dmenu ];
    };
  };

  services.displayManager.sddm.enable = true;

  users.users.truanthh = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    packages = with pkgs; [ tree ];
  };

  programs.firefox.enable = true;

  hardware.alsa.enablePersistence = true;

  environment.systemPackages = with pkgs; [
    alsa-utils
    picom
    wezterm
    vim
    neovim
    wget
    curl
    git
    htop
    btop
    nix-tree
    pavucontrol   # Микшер
    pamixer       # Громкость в терминале
    playerctl     # Управление медиа
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "26.05";
}
