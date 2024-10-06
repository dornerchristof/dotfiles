{ config, pkgs, ... }:
{
	environment.systemPackages = with pkgs; [
		hyprpaper #Wallpaper utility
	    hypridle # Idle deamon
	    hyprlock # Lock Screen
	];

	#Keyring
  	services.gnome.gnome-keyring.enable = true;
  	security.pam.services.login.enableGnomeKeyring = true;

	#Hyprlock & Hypridle
	programs.hyprlock.enable = true;
	security.pam.services.hyprlock = {};
	services.hypridle.enable = true;

	#Gdm display manager
	services.xserver.displayManager.gdm.enable = true;
	services.xserver.displayManager.gdm.wayland = true;

	#Waybar
	programs.waybar.enable = true;

	#Not sure if I need this?
	services.xserver.enable = true;

	#Tells Electron-Apps (Discord, etc.) to use Wayland.
	environment.sessionVariables = rec {
		NIXOS_OZONE_WL=1;
	};
}
