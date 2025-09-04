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
	      pkgs = import nixpkgs { inherit system; };
    in {
      # Home-Manager module exposing Neovim
      homeManagerModules.default = {
        imports = [
          nixvim.homeModules.nixvim
        ];

        programs.nixvim = {
          enable = true;
          globals.mapleader = " "; # <space> is leader
          # Example starter config
          opts = {
            number = true;
            relativenumber = true;
            tabstop = 4;
            shiftwidth = 4;
          };
extraPlugins = with pkgs.vimPlugins; [
    vim-dadbod
    vim-dadbod-ui
    vim-dadbod-completion
  ];
          #keymaps = [
           # {
              #action = "<cmd>Telescope find_files<cr>";
              #key = "<leader>ff";
              #options.desc = "Find files";
            #}
          #];
          plugins.mini = {
            enable = true;
            modules.icons = {
              mockDevIcons = true;
            };
			      modules.surround = { }; # editing quotes, tags, etc.
          };
          plugins = {
		   # Core UI
    lualine.enable = true;
    bufferline.enable = true;
    nvim-tree.enable = true;
    gitsigns.enable = true;
    comment.enable = true;
            telescope.enable = true;
            treesitter.enable = true;
			which-key = {
              enable = true;
			  settings.spec = [
                {
                  __unkeyed-1 = "<leader>f"; group = "file";
                }
                {
                  __unkeyed-1 = "<leader>ff"; 
				  __unkeyed-2 = "<cmd>Telescope find_files<cr>";
                  desc = "Find files";
                }
                {
                  __unkeyed-1 = "<leader>fg"; 
				  __unkeyed-2 = "<cmd>Telescope live_grep<cr>";
                  desc = "Live grep";
                }
                {
                  __unkeyed-1 = "<leader>fb"; 
				  __unkeyed-2 = "<cmd>Telescope buffers<cr>";
                  desc = "Buffers";
                }
                {
                  __unkeyed-1 = "<leader>fh"; 
				  __unkeyed-2 = "<cmd>Telescope help_tags<cr>";
                  desc = "Help tags";
                }
				 # UI toggles
        {
          __unkeyed-1 = "<leader>u"; group = "UI toggles";
        }
        {
          __unkeyed-1 = "<leader>un"; __unkeyed-2 = ":set number!<CR>";
          desc = "Toggle line numbers";
        }
        {
          __unkeyed-1 = "<leader>ur"; __unkeyed-2 = ":set relativenumber!<CR>";
          desc = "Toggle relative numbers";
        }
        {
          __unkeyed-1 = "<leader>uw"; __unkeyed-2 = ":set wrap!<CR>";
          desc = "Toggle word wrap";
        }
        {
          __unkeyed-1 = "<leader>us"; __unkeyed-2 = ":set spell!<CR>";
          desc = "Toggle spell check";
        }
              ];
    		  settings = {
      			# optional, but handy
      			window = {
        		border = "single";
      			};
      		  plugins = {
                spelling.enabled = true;
                };
              };
            };
            lsp = {
              enable = true;
              servers = {
                ts_ls.enable = true; # for JS/TS (needed for Svelte too)
                svelte.enable = true;
                jsonls.enable = true;
              };
            };

            cmp = {
              enable = true;
            };

	 # REST API testing
    rest.enable = true;

    # Formatting
    conform-nvim.enable = true;

    # UI niceties
    indent-blankline.enable = true;
    todo-comments.enable = true;
    fidget.enable = true;
          };
        };
      };
    };
}

