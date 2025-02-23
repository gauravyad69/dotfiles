{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;
  services.redshift={
    enable = true;
    longitude = 85.457041;
    latitude = 26.983082;
    duskTime = "18:01";
    dawnTime = "06:28";
  };

  #   services.printing = {
  #  enable = true;
  #   drivers = with pkgs; [ gutenprint  canon-cups-ufr2 splix ];

  #  };



  #    services.system-config-printer.enable = true;

  home.packages = with pkgs; [
    # Packages in each category are sorted alphabetically

    # Desktop apps
    imv
    mpv
    obs-studio
    obsidian
    #prismlauncher-unwrapped
    gparted
    gitkraken
    telegram-desktop
    vesktop
    vlc    
    postman
    figma-linux
    libreoffice-still

    # CLI utils
    fzy
    powertop
    bottom
    brightnessctl
    cliphist
    ffmpeg
    ffmpegthumbnailer
    fzf
    git-graph
    grimblast
    htop
    mediainfo
    microfetch
    playerctl
    ripgrep
    showmethekey
    silicon
    udisks
    ueberzugpp
    unzip
    w3m
    wget
    wl-clipboard
    wtype
    yt-dlp
    zip
    pipenv
    unrar






    # Coding stuff
    nodejs
    python311
    android-studio
    code-cursor
    go
    julia
    python311Packages.pip
    php
    luarocks
    jetbrains.idea-ultimate 
    jetbrains.webstorm
    # WM stuff
    libsForQt5.xwaylandvideobridge
    libnotify
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland

    # Other
    bemoji
    nix-prefetch-scripts

    #this is for neovim, lsp
    nil
    kotlin-language-server

  ];
}
