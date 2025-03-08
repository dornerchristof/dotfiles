{ config, pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
        obsidian
        webcord 
        networkmanagerapplet
        zoom-us
        pavucontrol
        fastfetch
        eog
        stow
        wezterm
        librewolf
        chromium
    ];
}