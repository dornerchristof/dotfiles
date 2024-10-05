{ config, pkgs, ... }:
{
	environment.systemPackages = with pkgs; [
		
	];

  	services.gnome.gnome-keyring.enable = true;
  	security.pam.services.login.enableGnomeKeyring = true;
	security.pam.services.hyprlock = {};
	programs.hyprlock.enable = true;
	services.hypridle.enable = true;
	services.xserver.displayManager.gdm.enable = true;
services.xserver.displayManager.gdm.wayland = true;
programs.waybar.enable = true;
services.xserver.enable = true;
environment.sessionVariables = rec {
NIXOS_OZONE_WL=1;

};
}
