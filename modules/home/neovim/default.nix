{
  self,
  inputs,
  lib,
  pkgs,
  config,
  ...
}:
inputs.nvf.lib.neovimConfiguration {
  # Main nvf configuration entry point
  # This file imports all nvim-related modules and sets up nvf

  inherit pkgs;

  imports = [
    ./options.nix
    ./langs.nix
    ./plugins.nix
    ./keymaps.nix
  ];

  options.vim.windowCycling = {
    nextCmd = lib.mkOption {
      type = lib.types.str;
      default = "aerospace focus dfs-next --boundaries-action wrap-around-the-workspace";
      description = "Command to run when cycling to the next window at boundary";
    };
    prevCmd = lib.mkOption {
      type = lib.types.str;
      default = "aerospace focus dfs-prev --boundaries-action wrap-around-the-workspace";
      description = "Command to run when cycling to the previous window at boundary";
    };
  };
}
