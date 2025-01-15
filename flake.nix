{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
     android-nixpkgs = {
      url = "github:tadfisher/android-nixpkgs";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      android-nixpkgs,
      ...
    }:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in
    {
      nixosConfigurations = {
        nixos = lib.nixosSystem {
          inherit system;
          #specialArgs = {inherit inputs;};
          modules = [ ./configuration.nix ];
        };
      };

      homeConfigurations = {
        mrhell = home-manager.lib.homeManagerConfiguration {
          #specialArgs = {inherit inputs;};
          inherit pkgs;
          modules = [ ./home.nix
           {
              imports = [ android-nixpkgs.hmModule ];
              android-sdk.enable = true;
              android-sdk.path = "/home/mrhell/.android/sdk";
              android-sdk.packages = sdk: with sdk; [
                build-tools-34-0-0
                cmdline-tools-latest
                platforms-android-34
                sources-android-34
              ];
            } 

	 ];
        };
      };

    };
}
