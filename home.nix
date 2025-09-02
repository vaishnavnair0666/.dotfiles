{ config, pkgs, unstablePkgs, ... }:
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
    unstablePkgs.quickshell
  ];
  programs.bash.enable = true;
  # Example: enable zsh
  programs.zsh = {
    enable = true;
  };
  

  home.file.".config/hypr".source = ./config/hypr;
  home.file.".config/quickshell".source = ./config/quickshell;
  home.stateVersion = "25.05";
}

