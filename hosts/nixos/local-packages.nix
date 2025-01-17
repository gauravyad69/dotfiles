{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    git
    gh
    git-credential-manager
    ntfs3g

  ];
}
