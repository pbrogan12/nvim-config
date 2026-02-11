{
  pkgs,
  config,
  ...
}: let
  sources = import ../../../npins;
  namu-nvim = pkgs.vimUtils.buildVimPlugin {
    pname = "namu.nvim";
    version = sources."namu.nvim".version;
    src = sources."namu.nvim".outPath;
  };
in {
  vim = {
    telescope = {
      enable = true;
      mappings.findFiles = "<leader><leader>";
    };

    autocomplete = {
      blink-cmp = {
        enable = true;
        setupOpts.cmdline.keymaps.preset = "default";
      };
    };

    git = {
      gitsigns.enable = true;
    };

    extraPlugins = with pkgs.vimPlugins; {
      # Navigation
      namu = {
        package = namu-nvim;
        setup = "require('namu').setup({})";
      };
      # Utils
      glance = {
        package = glance-nvim;
        setup = "require('glance').setup({
            mappings = {
                list = {['<CR>'] = require('glance').actions.jump_vsplit, }
            }

              })";
      };
      targets = {
        package = targets-vim;
      };

      snacks = {
        package = snacks-nvim;
      };

      # Testing
      neotest = {
        package = neotest;
        after = ["neotest-go" "neotest-python"];
      };
      neotestgo = {
        package = neotest-go;
      };
      neotestpython = {
        package = neotest-python;
      };
      # AI
      sidekick = {
        package = sidekick-nvim;
      };
      claudecode = {
        package = claudecode-nvim;
        setup = "require('claudecode').setup({})";
      };
      # Harness Runners
      overseer = {
        package = overseer-nvim;
        setup = ''          require("overseer").setup({
                                task_list = {
                                    keymaps = {
                                        ["j"] = "keymap.prev_task";
                                        ["k"] = "keymap.next_task";
                                        ["o"] = {
                                            "keymap.open",
                                            opts = {dir = "float"}
                                        }
                                    }
                                },
                                })
        '';
      };
      # Colorscheme
      vague = {
        package = vague-nvim;
      };
      melange = {
        package = melange-nvim;
      };
      # Pickers
      telescope-project = {
        package = telescope-project-nvim;
      };
      autosession = {
        package = auto-session;
        setup = ''          require("auto-session").setup({
                                          opts = {
                                              allowed_dirs = { "~/dev/*/*" },
                                          },

                              })'';
      };
    };
  };
}
