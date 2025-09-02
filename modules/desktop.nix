{ config, pkgs, ... }:

{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };

  environment.systemPackages = with pkgs; [
    xdg-desktop-portal-hyprland
    waybar
    libsForQt5.dolphin
    alacritty
    grim slurp swappy
    wl-clipboard cliphist
    spotify ## below are apps 
  ];
}

