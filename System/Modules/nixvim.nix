{ pkgs, lib, ... }:
let
  nixvim = import (builtins.fetchGit {
    url = "https://github.com/nix-community/nixvim";
    # If you are not running an unstable channel of nixpkgs, select the corresponding branch of nixvim.
    # ref = "nixos-23.11";
  });
in
{
  imports = [
    # For home-manager
    #nixvim.homeManagerModules.nixvim
    # For NixOS
    nixvim.nixosModules.nixvim
    # For nix-darwin
    #nixvim.nixDarwinModules.nixvim
  ];

  programs.nixvim = {
    enable = true;
    /*highlight = {
    Comment.fg = "#ff00ff";
    Comment.bg = "#000000";
    Comment.underline = true;
    Comment.bold = true;
    };*/
    clipboard.providers = {
    wl-copy.enable = true;
    };
    colorschemes.dracula.enable = true;
    plugins = {
    nix.enable = true;
    treesitter.enable = true;
    bufferline = {
      enable = true;
      alwaysShowBufferline = true;
      numbers = "ordinal"; 
    };

    luasnip.enable = true;
    lsp = {
      enable = true;
       
      servers = {
        tsserver.enable = true;
	 astro.enable = true;
	 bashls.enable = true;
	 biome.enable = true;
	 ccls.enable = true;
	 clangd.enable = true;
	 clojure-lsp.enable = true;
	 cmake.enable = true;
	 csharp-ls.enable = true;
	 cssls.enable = true;
	 dartls.enable = true;
	 denols.enable = true;
	 digestif.enable = true;
	 efm.enable = true;
	 elixirls.enable = true;
	 elmls.enable = true;
	 emmet_ls.enable = true;
	 eslint.enable = true;
	 fsautocomplete.enable = true;
	 futhark-lsp.enable = true;
	 gdscript.enable = true;
	 gopls.enable = true;
	 hls.enable = true;
	 html.enable = true;
	 intelephense.enable = true;
	 java-language-server.enable = true;
	 jsonls.enable = true;
	 julials.enable = true;
	 kotlin-language-server.enable = true;
	 leanls.enable = true;
	 ltex.enable = true;
	 metals.enable = true;
	 nil_ls.enable = true;
	 nixd.enable = true;
	 prismals.enable = true;
	 pylsp.enable = true;
	 pyright.enable = true;
	 ruff-lsp.enable = true;
	
        lua-ls = {
          enable = true;
          settings.telemetry.enable = false;
        };
        rust-analyzer = {
          enable = true;
          installCargo = true;
	  installRustc = true;
        };
      };
    };

};
};
}
