# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  #limit the number of generations to 3
  boot.loader.systemd-boot.configurationLimit = 3;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";


  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Enable zsh
  environment.shells = with pkgs; [zsh];
  users.defaultUserShell = pkgs.zsh;

  programs.zsh={
  enable = true;
  shellAliases={
      "ll" = "ls -l";
      "snrs" = "cd /home/mrhell/dotfiles/ && sudo nixos-rebuild switch --flake .";
      "hms" = "cd /home/mrhell/dotfiles/ && home-manager switch --flake .";
  };
  promptInit = "source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
     ohMyZsh = {
          enable = true;
#           plugins = [
#             "sudo"
#             "terraform"
#             "systemadmin"
#             "vi-mode"
#           ];
        };
  };


  #Enable adb and add it to the group so that it doesn't use sudo
  programs.adb.enable = true;

  #Enable bluetooth
  hardware.bluetooth.enable=true;
  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Kathmandu";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  programs.hyprland = {
    enable=true;
    xwayland.enable=true; 
};

 environment.sessionVariables = {
  #WLR_NO_HARDWARE_CURSORS = "1"; 
  #hint electron apps to use wayland
  NIXOS_OZONE_WL = "1";
 };

  hardware = {
	opengl.enable = true;
	nvidia.modesetting.enable = true;
  };


  # Enable CUPS to print documents.
  # Enable CUPS for printing
  services.printing = {
    enable = true;
    drivers = [ pkgs.cnijfilter2 ];
    browsing = true;
    listenAddresses = [ "*:631" ];
    defaultShared = true;
  };

  # Add USB support if connecting via USB
  services.udev.packages = [ pkgs.cnijfilter2 ];
  
  # Enable Avahi for printer discovery
  services.avahi = {
    enable = true;
    nssmdns = true;
  };

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.mrhell = {
    isNormalUser = true;
    description = "mrhell";
    extraGroups = [ "networkmanager" "wheel" "adbusers" ];
    packages = with pkgs; [
      kdePackages.kate
    #  thunderbird
    ];
  };

    nix.extraOptions = ''
        trusted-users = root mrhell
    '';



  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

##for hyprland
xdg.portal.enable = true;
xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-gtk];

  #Accept android licenses for android studio
  nixpkgs.config.android_sdk.accept_license = true;
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    htop
    #aria2
    #gparted
    #gcc
    git
    gh
    #gitkraken
    #rustup
    #docker
    #curl
    #nmap
    tmux
    neofetch
    #glances
    #noto-fonts
    #code-cursor
    #android-studio-full
    #gimp
    #vlc
    #vscode
    #jetbrains.idea-ultimate
    neovim
    #python3
    #ffmpeg
    #spotify
    #nodejs
    #canon-capt
    zsh-powerlevel10k
    waybar
    eww
    dunst
    libnotify
    swww
    kitty
    rofi-wayland
    (pkgs.waybar.overrideAttrs (oldAttrs:{mesonFlags=oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];}))
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

}
