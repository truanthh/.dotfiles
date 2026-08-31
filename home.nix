{ config, pkgs, ... }:

{
  home.username = "truanthh";
  home.homeDirectory = "/home/truanthh";

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

    alsa-utils #sound
    vim
    neovim
    wezterm
    git
    htop
    btop
    wget
    curl
    nix-tree
    pavucontrol
    pamixer
    playerctl
    picom
    xclip
  ];

  # ===== КОНФИГИ ИЗ DOTFILES =====
  home.file = {
    # Neovim
    ".config/nvim".source = ./nvim/.config/nvim;

    # Wezterm
    "/home/truanthh/.wezterm.lua".source = ./wezterm/.wezterm.lua;

    # Шрифты (копируем в системную папку)
    ".local/share/fonts".source = ./fonts;
  };

  # ===== ПРОГРАММЫ С КОНФИГАМИ =====
  programs.git.settings = {
    enable = true;
    userName = "truanthh";
    userEmail = "aquapyr@gmail.com";
  };

  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "docker" "kubectl" ];
      theme = "robbyrussell";
    };
  };

  # ===== СИСТЕМНЫЕ НАСТРОЙКИ =====
  # i3 конфиг — можно вынести в отдельный файл или оставить в system конфиге
  # Я рекомендую оставить управление i3 в configuration.nix

  home.stateVersion = "26.05";
}
