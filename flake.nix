{
  description = "Nixos config flake";

  inputs = {
    #nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations.nixbox = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        ./hosts/nixbox/configuration.nix
        ./modules/locals.nix
        ./modules/programs.nix
        ./modules/users.nix
      ];
    };

    nixosConfigurations.nixtop = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        ./hosts/nixtop/configuration.nix
        ./modules/locals.nix
        ./modules/programs.nix
        ./modules/users.nix
      ];
    };
  };
}
