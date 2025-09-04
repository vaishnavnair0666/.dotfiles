{
  description = "Neovim config using nixvim";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixvim.url = "github:nix-community/nixvim"; # <— nixvim module
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, nixvim, home-manager, ... }:
    let
      system = "x86_64-linux";
    in {
      # Home-Manager module exposing Neovim
      homeManagerModules.default = {
        imports = [
          nixvim.homeManagerModules.nixvim
        ];

        programs.nixvim = {
          enable = true;

          # Example starter config
          opts = {
            number = true;
            relativenumber = true;
            tabstop = 4;
            shiftwidth = 4;
          };

          keymaps = [
            {
              action = "<cmd>Telescope find_files<cr>";
              key = "<leader>ff";
              options.desc = "Find files";
            }
          ];

          plugins = {
            telescope.enable = true;
            treesitter.enable = true;

            lsp = {
              enable = true;
              servers = {
                tsserver.enable = true; # for JS/TS (needed for Svelte too)
                svelte.enable = true;
                jsonls.enable = true;
              };
            };

            cmp = {
              enable = true;
              sources = [ "nvim_lsp" "buffer" "path" ];
            };
          };
        };
      };
    };
}

