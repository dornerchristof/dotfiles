{ config, pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
        obsidian
        discord
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