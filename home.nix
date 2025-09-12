{ config, pkgs, lib, unstablePkgs, quickshell, ... }:
let
decryptedKey = builtins.readFile (builtins.toPath ./modules/secrets/github.ssh.enc);
in
{
	home.username = "vaish";
	home.homeDirectory = "/home/vaish";

	home.packages = with pkgs; [
		alacritty
			btop
			fastfetch
			firefox
			wl-clipboard
# If/when you need extra QML modules, use withModules with a LIST, e.g.:
# (quickshell.packages.${pkgs.system}.default.withModules [
#   pkgs.qt6.qtimageformats
# ])
			(quickshell.packages.${pkgs.system}.default)
  ];
  programs.bash.enable = true;
  programs.bash= {
    bashrcExtra = ''
    eval "$(direnv hook bash)"
    '';
  };
  # Example: enable zsh
  programs.zsh = {
    enable = true;
    initContent = ''
      eval "$(direnv hook zsh)"
    '';
  };

  home.file.".config/hypr".source = ./config/hypr;

  home.file.".config/quickshell/default".source = ./config/quickshell/default;
  home.file.".config/quickshell/default".recursive = true;

#hello
  home.stateVersion = "25.05";
}

