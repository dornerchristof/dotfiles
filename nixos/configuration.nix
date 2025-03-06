
{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./dellLaptop.nix
      ./hyprland.nix
      ./software.nix
      ./development.nix
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
    #nerdfonts
  ] ++ builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);

  # Configure console keymap
  console.keyMap = "neoqwertz";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.chrisi = {
    isNormalUser = true;
    description = "chrisi";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
    shell = pkgs.nushell;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
     wofi # Program launcher
     rofi-wayland
     dunst # Notification Deamon
     xdg-desktop-portal-hyprland # Desktop Portal
     kdePackages.polkit-kde-agent-1 # Authentication Agent
     qt5.qtwayland # QT Support
     qt6.qtwayland # QT Support
     oh-my-posh # Command Prompt
     pwvucontrol # Audio Control
     zoxide # Smart cd
     fzf # Command Line Fuzzy Finder
     cliphist # Clipboard history manager
     wl-clipboard # Clipboard util
     wl-clip-persist # Persistant clipboard
     bind #nslookup, etc..
     nushell
  ];
  

  programs.thunar.enable = true;

	nix.settings.experimental-features = [ "nix-command" "flakes" ];

  programs.zsh.enable = true;
  
  #Automount usb-drives, sd-cards,....
  services.devmon.enable = true;
  services.gvfs.enable = true; 
  services.udisks2.enable = true;

  #Bluetooth
  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot
  services.blueman.enable = true;

  services.pipewire = {
     enable = true;
     alsa.enable = true;
     alsa.support32Bit = true;
     pulse.enable = true;
  };

  services = {
    syncthing = {
        enable = true;
        user = "chrisi";
        dataDir = "/home/chrisi/vaults";    # Default folder for new synced folders
        configDir = "/home/chrisi/.config/syncthing";   # Folder for Syncthing's settings and keys
    };
  };

  #Disabeling rpfilter so that all traffic can be routed through a wireguard tunnel.
  #See https://nixos.wiki/wiki/WireGuard#Client_setup
  networking.firewall.checkReversePath = false; 

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

}
