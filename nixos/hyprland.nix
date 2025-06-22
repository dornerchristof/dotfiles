{ config, pkgs, inputs, ... }:
{
  	programs.hyprland.enable = true;

	environment.systemPackages = with pkgs; [
		hyprpaper #Wallpaper utility
	    hypridle # Idle deamon
	    hyprlock # Lock Screen
		inputs.waybar.packages."${pkgs.system}".waybar
		nwg-look # Themes for gtk
		qt6ct
	];

	#Keyring
  	services.gnome.gnome-keyring.enable = true;
  	security.pam.services.login.enableGnomeKeyring = true;

	#Hyprlock & Hypridle
	programs.hyprlock.enable = true;
	security.pam.services.hyprlock = {};
	services.hypridle.enable = true;

	#Gdm display manager
	services.displayManager.gdm.enable = true;
	services.displayManager.gdm.wayland = true;

	#Not sure if I need this?
	services.xserver.enable = true;

	#Tells Electron-Apps (Discord, etc.) to use Wayland.
	environment.sessionVariables = rec {
		NIXOS_OZONE_WL=1;
		QT_QPA_PLATFORMTHEME="qt6ct";
	};
}
