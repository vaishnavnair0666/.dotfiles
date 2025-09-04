{ config, pkgs, lib, unstablePkgs, quickshell, ... }:
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
  
  programs.neovim = {
    enable = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAluas = true;

    extraLuaConfig = ''
      -- lua code

      ${builtins.readFile ./configs/nvim/options.lua}

      ''

    plugins = [
	pkgs.vimPlugins.nvim-lspconfig
	pkgs.vimPlugins.comment-nvim

	pkgs.vimPlugins.gruvbox-nvim

	pkgs.vimPlugins.neodev-nvim

	pkgs.vimPlugins.nvim-cmp

	pkgs.vimPlugins.nvim-cmp;

	pkgs.vimPlugins.telescope-nvim;

	pkgs.vimPlugins.telescope-fzf-native-nvim

	pkgs.vimPlugins.cmp_luasnip

	pkgs.vimPlugins.cmp-nvim-lsp

	pkgs.vimPlugins.luasnip

	pkgs.vimPlugins.friendly-snippets

	pkgs.vimPlugins.lualine-nvim

	pkgs.vimPlugins.nvim-web-devicons
	(pkgs.vimPlugins.nvim-treesitter.withPlugins (p: [
	  p.tree-sitter-nix
	  p.tree-sitter-vim
	  p.tree-sitter-bash
	  p.tree-sitter-lua
	  p.tree-sitter-python
	  p.tree-sitter-json
	  ];)
        );

	pkgs.vimPlugins.vim-nix
    ];
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

