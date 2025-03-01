{ pkgs, stateVersion, hostname, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./local-packages.nix
    ../../nixos/modules
  ];

  environment.systemPackages = [ pkgs.home-manager ];

  networking.hostName = hostname;
 nixpkgs.config.allowUnfree = true; 
 
#  services.xserver.displayManager.lightdm.enable=true;

  system.stateVersion = stateVersion;
}

