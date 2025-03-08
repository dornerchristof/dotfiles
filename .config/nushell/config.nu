$env.config.buffer_editor = 'code'
$env.config.show_banner = false

#Update and upgrade NixOS
alias nixupdate = sudo nixos-rebuild switch --flake ~/dotfiles/nixos
alias nixupgrade = nix flake update --flake ~/dotfiles/nixos/

#zoxide
source ~/.config/nushell/zoxide.nu