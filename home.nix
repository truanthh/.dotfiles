{ config, pkgs, ... }:

{
  home.username = "truanthh";
  home.homeDirectory = "/home/truanthh";
  home.stateVersion = "26.05";

  programs.bash = {
    enable = true;
    shellAliases = {
      btw = "echo i use hyprland btw";
    };
    profileExtra = ''
      if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
        exec hyprland
      fi
    '';
  };

  # ===== ПАКЕТЫ ДЛЯ ПОЛЬЗОВАТЕЛЯ =====
  home.packages = with pkgs; [
    ripgrep
    tree-sitter
    gcc
    docker
    docker-compose
    nodejs
    telegram-desktop
    amnezia-vpn
    amneziawg-tools
    
    # GNOME расширения
    gnome-shell-extensions
  ];

  # ===== КОНФИГИ =====
  home.file = {
    ".config/nvim".source = ./nvim/.config/nvim;
    ".config/hypr".source = ./config/hypr;
    ".config/waybar".source = ./config/waybar;
    ".config/foot".source = ./config/foot;
    ".wezterm.lua".source = ./wezterm/.wezterm.lua;
    ".local/share/fonts".source = ./fonts;
  };

  # ===== ПРОГРАММЫ С КОНФИГАМИ =====
  programs.git = {
    enable = true;
    userName = "truanthh";
    userEmail = "aquapyr@gmail.com";
  };
}
