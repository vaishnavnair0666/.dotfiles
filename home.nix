{ config, pkgs, ... }:
let
    decryptedKey = builtins.readFile (builtins.toPath ./modules/secrets/github.ssh.enc);
in
{
  home.username = "vaish";
  home.homeDirectory = "/home/vaish";

  home.packages = with pkgs; [
    neovim
    alacritty
    btop
    fastfetch
    firefox
    wl-clipboard
  ];
  programs.bash.enable = true;
  # Example: enable zsh
  programs.zsh = {
    enable = true;
  };

  home.stateVersion = "25.05";
}

