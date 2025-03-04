{

	description = "Main Flake";

	inputs = {
		nixpkgs.url = "nixpkgs/nixos-unstable";
		waybar.url = "github:Alexays/Waybar/master";
	};

	outputs = { self, nixpkgs, waybar, ... }@inputs : {
		nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
				system="x86_64-linux";
				specialArgs = { inherit inputs; };
				modules = [ ./configuration.nix ];
		};
	};
}