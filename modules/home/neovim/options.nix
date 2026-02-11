{
  pkgs,
  config,
  inputs,
  ...
}: {
  # General nvim options and settings
  # This is where you configure nvf's core options

  vim = {
    viAlias = true;
    vimAlias = true;

    spellcheck = {
      enable = true;
    };

    globals.mapleader = " ";

    luaConfigRC.windowCycling = ''
      function _cycle_next_window()
        local current_win = vim.fn.winnr()
        local end_win = vim.fn.winnr("$")

        -- If we're at a boundary, run the configured command
        if current_win == end_win then
          vim.fn.system('${config.vim.windowCycling.nextCmd}')
        else
          -- Navigate within Neovim
          local target_win = current_win+1
          vim.cmd(target_win .. ' wincmd w')
        end
      end

      function _cycle_prev_window()
        local current_win = vim.fn.winnr()
        local start_win = 1

        -- If we're at a boundary, run the configured command
        if current_win == start_win then
          vim.fn.system('${config.vim.windowCycling.prevCmd}')
        else
          -- Navigate within Neovim
          local target_win = current_win-1
          vim.cmd(target_win .. ' wincmd w')
        end
      end

      if vim.g.neovide then
          vim.keymap.set('n', '<D-s>', ':w<CR>') -- Save
          vim.keymap.set('v', '<D-c>', '"+y') -- Copy
          vim.keymap.set('n', '<D-v>', '"+P') -- Paste normal mode
          vim.keymap.set('v', '<D-v>', '"+P') -- Paste visual mode
          vim.keymap.set('c', '<D-v>', '<C-R>+') -- Paste command mode
          vim.keymap.set('i', '<D-v>', '<ESC>l"+Pli') -- Paste insert mode
      end

      vim.api.nvim_set_keymap("", '<D-v>', '+p<CR>', { noremap = true, silent = true})
      vim.api.nvim_set_keymap('!', '<D-v>', '<C-R>+', { noremap = true, silent = true})
      vim.api.nvim_set_keymap('t', '<D-v>', '<C-R>+', { noremap = true, silent = true})
      vim.api.nvim_set_keymap('v', '<D-v>', '<C-R>+', { noremap = true, silent = true})
    '';

    options = {
      laststatus = 3;
      scrolloff = 5;
      tabstop = 4;
      shiftwidth = 4;
      softtabstop = 4;
      smartcase = true;
      smartindent = true;
      smoothscroll = true;
    };

    formatter.conform-nvim.enable = true;

    diagnostics = {
      enable = true;
      config = {
        virtual_text = true;
      };
    };

    lsp = {
      enable = true;
      formatOnSave = true;
      lightbulb.enable = true;
      trouble.enable = true;
    };
  };
}
