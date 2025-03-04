{ config, pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
        obsidian
        discord
        vscode
        kubectl
        kubernetes-helm
        openssl
        networkmanagerapplet
        zoom-us
        pavucontrol
        fastfetch
        jetbrains-toolbox
        eog
        stow
        wezterm
        librewolf
        chromium
    ];
}