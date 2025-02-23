{ pkgs, user, ... }: {
  programs.zsh.enable = true;
programs.steam.enable = true;

  programs.adb.enable = true;
  users = {
    defaultUserShell = pkgs.zsh;
    users.${user} = {
      isNormalUser = true;
      extraGroups = [ "wheel" "networkmanager" "adbusers" ];
    };
  };

  services.getty.autologinUser = user;
}
