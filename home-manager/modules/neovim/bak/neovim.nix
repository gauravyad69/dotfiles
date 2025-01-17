{ pkgs, ... }:
let
    toLua = str: "lua << EOF\n${str}\nEOF\n";
    toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
in
{ programs.neovim = {
    enable=true;
    viAlias = true;
    vimdiffAlias = true;
    vimAlias = true;
    withNodeJs = true;
    
    plugins = with pkgs.vimPlugins; [
      yankring
      vim-nix
      
      telescope-fzf-native-nvim
      nvim-cmp
      cmp_luasnip
      cmp-nvim-lsp

      luasnip
      friendly-snippets

      neodev-nvim
      #lualine-nvim
      nvim-web-devicons
      {
        plugin = mason-nvim;
        config = toLua "require(\"mason\").setup()";
      }
      {
       plugin = lualine-nvim;
       config = toLuaFile ./plugin/lualine.lua;
      }
      {
        plugin = nvim-lspconfig;
        config = toLuaFile ./plugin/lsp.lua;
      }

      {
        plugin = comment-nvim;
        config = toLua "require(\"Comment\").setup()";
      }

      {
        plugin = gruvbox-nvim;
        config = "colorscheme gruvbox";
      }
      {
        plugin = neovim-fuzzy;
        config = "nnoremap <C-p> :FuzzyOpen<CR>";
      }
      { plugin = vim-startify;
        config = "let g:startify_change_to_vcs_root = 0";
       }
      {
        plugin = (nvim-treesitter.withPlugins (p: [
          p.tree-sitter-nix
          p.tree-sitter-vim
          p.tree-sitter-bash
          p.tree-sitter-lua
          p.tree-sitter-python
          p.tree-sitter-json
          p.tree-sitter-kotlin
        ]));
        config = toLuaFile ./plugin/treesitter.lua;
      }


     ];

     
    extraPackages = with pkgs; [

      xclip
      wl-clipboard

      lua-language-server
      python311Packages.python-lsp-server
      nixd
      angular-language-server
      
    ];

    
 
    extraLuaConfig = ''
      ${builtins.readFile ./options.lua}
    '';
  };
}
