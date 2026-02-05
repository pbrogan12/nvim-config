_: {
  # Language-specific configurations
  # Enable languages and their associated LSP servers, formatters, etc.

  vim.languages = {
    enableFormat = true;
    enableTreesitter = true;
    enableExtraDiagnostics = true;

    # Core languages (always enabled)
    nix.enable = true;
    markdown.enable = true;

    # Languages based on your installed packages
    python = {
      enable = true;
      lsp.servers = ["ruff" "ty"];
    };
    go.enable = true;
    lua.enable = true;
    bash.enable = true;
    json.enable = true;
    yaml.enable = true;
    clang.enable = true;
  };
}
