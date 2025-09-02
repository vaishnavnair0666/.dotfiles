{ config, pkgs, lib, unstablePkgs,quickshell, ... }:
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
    (quickshell.packages.${pkgs.system}.default.withModules [
      pkgs.qt6.qtquickcontrols2
      pkgs.qt6.qtgraphicaleffects
    ]) 
  ];
  programs.bash.enable = true;
  # Example: enable zsh
  programs.zsh = {
    enable = true;
  };

  home.file.".config/hypr".source = ./config/hypr;

  home.activation.quickshell = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
  mkdir -p $HOME/.config/quickshell/default
  cp -r ${./config/quickshell/default}/* $HOME/.config/quickshell/default/
  chmod -R u+rw $HOME/.config/quickshell/default
'';


  home.stateVersion = "25.05";
}

