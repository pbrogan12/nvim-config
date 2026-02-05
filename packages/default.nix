{
  pkgs,
  inputs,
}:
(inputs.nvf.lib.neovimConfiguration
  {
    pkgs = pkgs;
    modules = [
      inputs.self.homeModules.neovim
    ];
  }).neovim
