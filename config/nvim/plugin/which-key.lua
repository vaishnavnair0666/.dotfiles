require("which-key").setup {
  plugins = {
    marks = true,
    registers = true,
    spelling = {
      enabled = true,
      suggestions = 20,
    },
  },
  window = {
    border = "rounded",
    position = "bottom",
    margin = { 1, 0, 1, 0 },
    padding = { 1, 2, 1, 2 },
  },
}

-- Example keymaps
local wk = require("which-key")
wk.register({
  ["<leader>f"] = { name = "+file" },
  ["<leader>g"] = { name = "+git" },
  ["<leader>l"] = { name = "+lsp" },
  ["<leader>t"] = { name = "+telescope" },
}, { prefix = "<leader>" })

