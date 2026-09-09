{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos-btw"; # Define your hostname.

  # Configure network connections interactively with nmcli or nmtui.
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Moscow";

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver.xkb.layout = "us,ru";
  services.xserver.xkb.options = "grp:alt_shift_toggle,eurosign:e,caps:escape";

  virtualisation.docker.enable = true;

  hardware.nvidia = {
  modesetting.enable = true;          # Обязательно для Wayland
  powerManagement.enable = true;      # <-- Главный параметр для решения проблемы с черным экраном после сна
  powerManagement.finegrained = false; # Обычно оставляют false
  open = false;                       # Используйте проприетарный драйвер для стабильности
  nvidiaSettings = true;
  package = config.boot.kernelPackages.nvidiaPackages.stable; # Или production
};

  # Define a user account. Don't forget to set a password with ‘passwd’.
   users.users.truanthh = {
     isNormalUser = true;
     extraGroups = [ "wheel", "docker" ]; # Enable ‘sudo’ for the user.
     packages = with pkgs; [
       tree
     ];
   };

  programs.firefox.enable = true;
  programs.amnezia-vpn.enable = true;

  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
   environment.systemPackages = with pkgs; [
     stow
     git
     vim
     neovim
     wget
     wezterm
     curl
     ripgrep
     alsa-utils
     htop
     btop
     tree-sitter
     docker
     docker-compose
     gcc
     nodejs
     
     # ??
     devtoolbox
     # adwaita-qt6
     gnome-tweaks
     nix-tree
     fuzzel

     # Утилиты
     telegram-desktop
     amnezia-vpn
     amneziawg-tools
     amneziawg-go
  ]++(with pkgs.gnomeExtensions; [
       gnomeExtensions.hide-top-bar
       gnomeExtensions.happy-appy-hotkey
    ]);

  # ---------------- EXPERIMENTAL STUFF HERE  -------------------------------------------------------------------------
        programs.dconf.enable = true;

	programs.dconf.profiles.user.databases = [
	  {
	    lockAll = true; # предотвращает переопределение
	    settings = {
	     "org/gnome/desktop/input-sources" = {
		sources = [
		  (lib.gvariant.mkTuple [ "xkb" "us" ])
		  (lib.gvariant.mkTuple [ "xkb" "ru" ])
		];
		xkb-options = [ "grp:alt_shift_toggle" ];
	      };
            "org/gnome/desktop/interface".cursor-theme = "Adwaita";
		#    "org/gnome/shell" = {
		#      disable-user-extensions = false;
		#      enabled-extensions = [
		# "gnome-happy-appy-hotkey@jqno.github.com"  # UUID расширения
		# "hidetopbar@tuxor1337.gitlab.gnome.org"  # UUID расширения
		#      ];
		#    };

	    "org/gnome/shell/extensions/hide-top-bar" = {
              enabled = true;
	    };
	    "org/gnome/shell/extensions/happy-appy-hotkey" = {
	      enabled = true;
	      # Hotkey 1: Console (gnome-terminal)
	      app-hotkey-1 = "<Alt>1";
	      app-exec-1 = "gnome-terminal";

	      # Hotkey 2: Firefox
	      app-hotkey-2 = "<Alt>2";
	      app-exec-2 = "firefox";

	      # Hotkey 3: WezTerm
	      app-hotkey-3 = "<Alt>3";
	      app-exec-3 = "wezterm";
	    };

	    };
	  }
	];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "26.05"; # Did you read the comment?
}

