{ config, pkgs, ... }:

{

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;


  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Kolkata";

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  environment.systemPackages = with pkgs; [
    direnv
    brightnessctl
    git
    lazygit
    vim
    tmux
    wget
    curl
    tldr
    nh
    nix-output-monitor
    nvd
  ];

  system.stateVersion = "25.05";
}

