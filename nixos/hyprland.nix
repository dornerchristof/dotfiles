{ config, pkgs, ... }:
{
	environment.systemPackages = with pkgs; [
		greetd
		qtgreet

	];

  services.gnome.gnome-keyring.enable = true;
  security.pam.services.login.enableGnomeKeyring = true;
security.pam.services.hyprlock = true;
programs.hyprlock.enable = true;
}
