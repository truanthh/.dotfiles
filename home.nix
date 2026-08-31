{ config, pkgs, ... }:

{
  home.username = "truanthh";
  home.homeDirectory = "/home/truanthh";

  # ===== ПАКЕТЫ ДЛЯ ПОЛЬЗОВАТЕЛЯ =====
  home.packages = with pkgs; [
    alsa-utils
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
    ".config/nvim".source = ./nvim;

    # Wezterm
    ".config/wezterm".source = ./wezterm;

    # Шрифты (копируем в системную папку)
    ".local/share/fonts".source = ./fonts;
  };

  # ===== ПРОГРАММЫ С КОНФИГАМИ =====
  programs.git = {
    enable = true;
    userName = "truanthh";
    userEmail = "aquapyr@gmail.com";
  };

  programs.zsh = {
    enable = true;
    ohMyZsh = {
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
