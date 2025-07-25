{
  description = "Nixos config flake";

  inputs = {
    #nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";

   # home-manager = {
   #   url = "github:nix-community/home-manager/release-25-05";
   #   inputs.nixpkgs.follows = "nixpkgs";
   # };
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations.nixbox = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        ./hosts/nixbox/configuration.nix
        ./modules/default-modules.nix
      ];
    };

    nixosConfigurations.nixtop = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        ./hosts/nixtop/configuration.nix
        ./modules/default-modules.nix
        ./modules/env/sway.nix
      ];
    };

  };
}
