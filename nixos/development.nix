{ config, pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
        jetbrains.clion
        jetbrains.idea-ultimate
        neovim
        git
        openssl
        vscode
    ];
}