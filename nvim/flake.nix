{
	description = "Neovim config using nixvim";

	inputs = {
		nixvim.url = "github:nix-community/nixvim";
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
					./modules/plugins/ui.nix
					./modules/plugins/which-key.nix
					./modules/plugins/lsp.nix
					./modules/plugins/dashboard.nix
					./modules/plugins/testers.nix
					./modules/plugins/formatters.nix
					./modules/plugins/notify.nix
					./modules/plugins/cmp.nix


					./modules/keymaps.nix
			];

			programs.nixvim = {
				enable = true;
				nixpkgs.useGlobalPackages = true;

				globals.mapleader = " "; # <space> is leader
# Example starter config
					opts = {
						number = true;
						relativenumber = false;
						tabstop = 4;
						shiftwidth = 4;
					};
				extraPlugins = with pkgs.vimPlugins; [
					vim-dadbod
						vim-dadbod-ui
						vim-dadbod-completion
				];
			};
		};
	};
}

