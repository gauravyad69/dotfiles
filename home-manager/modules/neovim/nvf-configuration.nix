{
  programs.nvf = {
    enable = true;
    
    settings.vim = {
      globals.mapleader = ''\'';
      viAlias = false;
      vimAlias = true;
      
      dashboard.startify.enable = true;
      telescope.enable = true;
      autocomplete.nvim-cmp.enable = true;
      statusline.lualine.enable=true; 

      lsp = {
        enable = true;
      };
      
      theme = {
        enable = true;
        name = "gruvbox";
        style = "dark";
       };
      languages = {
        enableLSP = true;
        enableFormat = true;
        enableTreesitter = true;

        kotlin.enable = true;
        lua.enable = true;
        nix.enable = true;
        python.enable = true;
      };
    };
    #statusline.lualine.enable = true;
    #    vim.telescope.enable = true;
    
  };
}
