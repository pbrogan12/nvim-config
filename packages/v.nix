{
  pkgs,
  inputs,
}:
let
  nvim = import ./default.nix { inherit pkgs inputs; };
in
pkgs.writeShellApplication {
  name = "v";
  runtimeInputs = [ pkgs.neovide ];
  text = ''
    exec neovide --neovim-bin ${nvim}/bin/nvim "$@"
  '';
}
