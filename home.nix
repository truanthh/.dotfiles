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
    # profileExtra = ''
    #   if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
    #     exec hyprland
    #   fi
    # '';
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

  home.file = {
    ".config/nvim".source = ./nvim/.config/nvim;
    ".wezterm.lua".source = ./wezterm/.wezterm.lua;
    ".local/share/fonts".source = ./fonts;
    ".config/niri/config.kdl".source = ./config.kdl;
  };

  # ===== ПРОГРАММЫ С КОНФИГАМИ =====
  programs.git.settings = {
    enable = true;
    userName = "truanthh";
    userEmail = "aquapyr@gmail.com";
  };
}
