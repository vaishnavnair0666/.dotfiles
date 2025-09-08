{ pkgs, ... }:

{
 programs.nixvim = {
    enable = true;

    plugins.luasnip.enable = true;

    # Friendly snippets via vimPlugins
    extraPlugins = with pkgs.vimPlugins; [
      friendly-snippets
    ];

    extraConfigLua = ''
      local luasnip = require("luasnip")

      -- Load VSCode-style snippets from installed plugins
      require("luasnip.loaders.from_vscode").lazy_load()

      -- Optional: load your own snippets
      require("luasnip.loaders.from_vscode").lazy_load({
        paths = { vim.fn.stdpath("config") .. "/LuaSnip/" }
      })

      -- Optional: keymaps for navigating snippets
      vim.keymap.set({"i","s"}, "<Tab>", function()
        if luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        else
          vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, true, true), "n", false)
        end
      end, { silent = true })

      vim.keymap.set({"i","s"}, "<S-Tab>", function()
        if luasnip.jumpable(-1) then luasnip.jump(-1) end
      end, { silent = true })
    '';
  };
}
