# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./dellLaptop.nix
      ./hyprland.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Vienna";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_AT.UTF-8";
    LC_IDENTIFICATION = "de_AT.UTF-8";
    LC_MEASUREMENT = "de_AT.UTF-8";
    LC_MONETARY = "de_AT.UTF-8";
    LC_NAME = "de_AT.UTF-8";
    LC_NUMERIC = "de_AT.UTF-8";
    LC_PAPER = "de_AT.UTF-8";
    LC_TELEPHONE = "de_AT.UTF-8";
    LC_TIME = "de_AT.UTF-8";
  };

  fonts.packages = with pkgs; [
    nerdfonts
  ];

  # Configure console keymap
  console.keyMap = "us";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.chrisi = {
    isNormalUser = true;
    description = "chrisi";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
    shell = pkgs.zsh;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
     neovim
     kitty # Terminal
     dolphin # File System Explorer
     wofi # Program launcher
     firefox # Browser
     dunst # Notification Deamon
     xdg-desktop-portal-hyprland # Desktop Portal
     polkit-kde-agent # Authentication Agent
     qt5.qtwayland # QT Support
     qt6.qtwayland # QT Support
     git # Version Control
     oh-my-posh # Command Prompt
     pwvucontrol # Audio Control
     discord
     zoxide # Smart cd
     fzf # Command Line Fuzzy Finder
     cliphist # Clipboard history manager
     wl-clipboard # Clipboard util
     wl-clip-persist # Persistant clipboard
     hyprpaper #Wallpaper utility
	     hypridle # Idle deamon
	     hyprlock # Lock Screen
     vivaldi
     brave
     chromium
     bind #nslookup, etc..
  ];

	nix.settings.experimental-features = [ "nix-command" "flakes" ];
  programs.hyprland.enable = true;
  programs.zsh.enable = true;

  services.pipewire = {
     enable = true;
     alsa.enable = true;
     alsa.support32Bit = true;
     pulse.enable = true;
  };


  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

}
