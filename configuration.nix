{ config, pkgs, ... }:

{
  
   # ssh key (stored in repo, but should be encrypted)
  environment.etc."ssh/github".text = builtins.readFile ./modules/secrets/github.ssh.enc;
  environment.etc."ssh/github".mode = "0600";

  environment.etc."ssh/config".text = ''
    Host github.com
      IdentityFile /etc/ssh/github
      IdentitiesOnly yes
  '';

  imports = [
    ./hardware-configuration.nix
    ./modules/base.nix
    ./modules/users.nix
    ./modules/desktop.nix
    ./modules/audio.nix
    ./modules/bluetooth.nix
    ./modules/fonts.nix
    ./modules/portal.nix
  ];
}

