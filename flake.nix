{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";

    # home-manager = {
    #   url = "github:nix-community/home-manager";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };

  outputs = { self, nixpkgs, ... }:
  let
    lib = nixpkgs.lib;
  in  {
    nixosConfigurations = {

      default = lib.nixosSystem {

        system = "x86_64-linux";

        specialArgs = {inherit inputs;};

        modules = [
          ./configuration.nix
          # inputs.home-manager.nixosModules.default
        ];


      };
    };
  };
}
