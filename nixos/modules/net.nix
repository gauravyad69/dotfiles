{
networking = {
    nameservers = [ "1.1.1.1" ];
    hostName = "nixos"; # Define your hostname.
    useDHCP = false;
    interfaces.wlan0.useDHCP = false; 
    defaultGateway = "192.168.101.1";
    interfaces.wlan0.ipv4.addresses = [ {
      address = "192.168.101.5";
      prefixLength = 24;
    } 
    ];
    wireless.iwd.enable = true;
    networkmanager = {
      enable = false;
    };
  };
}
