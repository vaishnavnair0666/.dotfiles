{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  # Packages you need for Neovim + LSPs
  buildInputs = [
    pkgs.neovim
    pkgs.nodejs
    pkgs.python310
    pkgs.ripgrep
    pkgs.git

    # Nix-packaged language servers
    pkgs.typescript-language-server
    pkgs.pythonPackages.pyright
    pkgs.html-languageserver
    pkgs.css-languageserver
    pkgs.json-languageserver
    pkgs.rust-analyzer
    pkgs.lua-language-server
  ];

  shellHook = ''
    # Point Neovim to your Kickstart template inside your dotfiles repo
    export XDG_CONFIG_HOME=$PWD/nvimConfigs/nix-nvim
    echo "Neovim config locked to $XDG_CONFIG_HOME"

    # Optional: warn if LSPs are missing
    for lsp in typescript-language-server pyright; do
      if ! command -v $lsp >/dev/null 2>&1; then
        echo "⚠️  $lsp not found in nix environment!"
      fi
    done
  '';
}

