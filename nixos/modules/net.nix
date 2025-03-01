{
networking = {

    networkmanager = {
      enable = false;
      wifi.backend = "iwd";
    };
 

    #    enableIPv6=false;
    #nameservers = [ "1.1.1.1" ];
    hostName = "nixos"; # Define your hostname.
    #useDHCP = false;
    #interfaces.wlan0.useDHCP = false; 
    firewall.allowedTCPPorts = [9090 8080 4200 6969];
    #defaultGateway = "192.168.0.1";
    #interfaces.wlan0.ipv4.addresses = [ {
    # address = "192.168.0.8";
    #  prefixLength = 24;
    #} 
    #];
    wireless.iwd = {
      enable = true;
      settings = {
        General = {
          EnableNetworkConfiguration = true;
          AddressRandomizatoin = false;
        };

        Network = {
          EnableIPv6=false;
          RoutePriorityOffset = 300;
        };
        Settings = {
          AutoConnect = true;
        };
        IPv4 = {
          Gateway = "192.168.0.1";
          Address = "192.168.0.8";
          Netmask = "255.255.255.0";
        };
        IPv6 = {
            Enabled = false;
        };
      };
    };
 };
}
