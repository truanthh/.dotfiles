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
  home.file.".config/hypr" = {
    source = ./hypr;
    force = true;
  };

  home.file = {
    ".config/nvim".source = ./nvim/.config/nvim;
    ".config/waybar".source = ./waybar;
    ".config/foot".source = ./foot;
    ".wezterm.lua".source = ./wezterm/.wezterm.lua;
    ".local/share/fonts".source = ./fonts;
  };

  # ===== ПРОГРАММЫ С КОНФИГАМИ =====
  programs.git.settings = {
    enable = true;
    userName = "truanthh";
    userEmail = "aquapyr@gmail.com";
  };
}
