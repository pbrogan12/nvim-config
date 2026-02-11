{
  pkgs,
  config,
  ...
}: {
  # Language-specific configurations
  # Enable languages and their associated LSP servers, formatters, etc.

  vim.keymaps = [
    {
      key = "<leader>oo";
      mode = "n";
      silent = true;
      action = ":OverseerOpen left<cr>";
    }
    {
      key = "J";
      mode = "n";
      silent = true;
      action = ":Gitsigns prev_hunk<cr>";
    }
    {
      key = "K";
      mode = "n";
      silent = true;
      action = ":Gitsigns next_hunk<cr>";
    }
    {
      key = "<leader>hu";
      mode = "n";
      silent = true;
      action = ":Gitsigns reset_hunk<cr>";
    }
    {
      key = "q";
      mode = "n";
      silent = true;
      action = ":hide<cr>";
    }
    {
      key = "<leader>v";
      mode = "n";
      silent = true;
      action = ":vsplit<cr>";
    }
    {
      key = "gr";
      mode = "n";
      silent = true;
      action = ":Glance references<CR>";
    }
    {
      key = "gd";
      mode = "n";
      silent = true;
      action = ":Glance definitions<CR>";
    }
    {
      key = "<D-l>";
      mode = ["n" "v"];
      silent = true;
      action = "<C-\\><C-n>:ClaudeCode<CR>";
    }
    {
      key = "<leader>j";
      mode = "n";
      silent = true;
      action = "<cmd>lua Snacks.terminal.toggle('jjui')<CR>";
    }
    {
      key = "<leader>/";
      mode = "n";
      silent = true;
      action = "<cmd>Namu workspace<CR>";
    }
    {
      key = "<D-j>";
      mode = "n";
      silent = true;
      action = "<cmd>lua _cycle_prev_window()<CR>";
    }
    {
      key = "<D-k>";
      mode = "n";
      silent = true;
      action = "<cmd>lua _cycle_next_window()<CR>";
    }
    {
      key = "<D-f>";
      mode = ["n" "t"];
      silent = true;
      action = "<cmd>lua Snacks.terminal.toggle()<CR>";
    }
  ];
}
