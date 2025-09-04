{...}:
{
	programs.nixvim.plugins = {
		lualine.enable = true;
		bufferline = {
			enable = true;
			settings = {
				options = {
					mode = "buffers"; # or "tabs"
						diagnostics = "nvim_lsp"; # show LSP errors/warnings in bufferline
						separator_style = "slant"; # "slant", "thick", "thin"
						show_buffer_close_icons = true;
					show_close_icon = false;
					always_show_bufferline = true;
				};
			};
		};
		neo-tree = {
			enable = true;
			settings = {
				close_if_last_window = true; # auto close when it's the last window
					popup_border_style = "rounded";
				enable_git_status = true;
				enable_diagnostics = true;
				window = {
					width = 30;
					mappings = {
# Custom keymaps inside Neo-tree
						"<cr>"= "open";
						"o" = "open";
						"s" = "open_split";
						"v" = "open_vsplit";
						"t" = "open_tabnew";
						"q" = "close_window";
					};
				};
				filesystem = {
					filtered_items = {
						visible = false;
						hide_dotfiles = true;
						hide_gitignored = true;
					};
					follow_current_file = {
						enabled = true;
					};
				};
			};
		};
		gitsigns.enable = true;
		comment.enable = true;
		telescope.enable = true;
		treesitter = {
			enable = true;
			settings.ensureInstalled = [ "nix" "lua" "javascript" "typescript" "svelte" "json" ];
		};	
# UI niceties
		indent-blankline.enable = true;
		todo-comments.enable = true;
		fidget.enable = true;
	};
}
