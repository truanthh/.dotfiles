{ config, pkgs, ... }:

{
  home.username = "truanthh";
  home.homeDirectory = "/home/truanthh";
  home.stateVersion = "26.05";

  programs.bash = {
    enable = true;
    shellAliases = {
      btw = "echo i use nixos btw";
    };
  };

  home.packages = with pkgs; [
    # GNOME расширения (если нужны - оставь, если нет - удали)
    gnome-shell-extensions
  ];

  home.file = {
    ".config/nvim".source = ../nvim/.config/nvim;
    ".wezterm.lua".source = ../wezterm/.wezterm.lua;
    ".local/share/fonts".source = ../fonts;
    # Убираем конфиг Niri (или закомментируй, если хочешь сохранить)
    # ".config/niri/config.kdl".source = ./config.kdl;
  };

  programs.git = {
    enable = true;
    userName = "truanthh";
    userEmail = "aquapyr@gmail.com";
  };
}
