{ config, pkgs, lib, unstablePkgs, quickshell, nvf, ... }:
let
    decryptedKey = builtins.readFile (builtins.toPath ./modules/secrets/github.ssh.enc);
in
{
  home.username = "vaish";
  home.homeDirectory = "/home/vaish";
  imports = [
    nvf.homeManagerModules.nvf
  ];

  programs.nvf = {
    enable = true;
    enableManpages = true;

    # Example: Add plugins, LSPs, config
    settings = {
      vim.opt.number = true; # line numbers
      vim.opt.relativenumber = true;
    };

    plugins = {
      telescope.enable = true;
      treesitter.enable = true;
      lsp.enable = true;
    };

    # Example LSP configuration
    languageServers = {
      svelte.enable = true;
      tsserver.enable = true;
      pyright.enable = true;
    };
};


  home.packages = with pkgs; [
    neovim
    alacritty
    btop
    fastfetch
    firefox
    wl-clipboard
    (quickshell.packages.${pkgs.system}.default.withModules [
    ]) 
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

  home.activation.quickshell = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
  mkdir -p $HOME/.config/quickshell/default
  cp -r ${./config/quickshell/default}/* $HOME/.config/quickshell/default/
  chmod -R u+rw $HOME/.config/quickshell/default
'';

#hello
  home.stateVersion = "25.05";
}

