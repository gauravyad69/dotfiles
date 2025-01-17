{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    # Packages in each category are sorted alphabetically

    # Desktop apps
    imv
    mpv
    #obs-studio
    #obsidian
    #prismlauncher-unwrapped

    gitkraken
    telegram-desktop
    vesktop
    vlc    
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
    # Coding stuff
    nodejs
    python311
    android-tools
    android-studio
    code-cursor
    go
    julia
    python311Packages.pip
    php
    luarocks
  

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
