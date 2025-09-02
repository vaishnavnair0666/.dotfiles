{ config, pkgs, ... }:
let
    decryptedKey = builtins.readFile (builtins.toPath ./modules/secrets/github.ssh.enc);
    unstablePkgs = import inputs.unstable { inherit pkgs.system; };
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
    (unstablePkgs.quickshell)
  ];
  programs.bash.enable = true;
  # Example: enable zsh
  programs.zsh = {
    enable = true;
  };
  

  home.file.".config/hypr".source = ./config/hypr;
  xdg.configFile."hypr/autostart.conf".text = ''
    exec-once = quickshell
  '';

  home.stateVersion = "25.05";
}

