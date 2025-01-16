{
networking = {
    nameservers = [ "1.1.1.1" ];
    hostName = "nixos"; # Define your hostname.
    wireless.iwd.enable = true;
    networkmanager = {
      enable = false;
    };
  };
}
