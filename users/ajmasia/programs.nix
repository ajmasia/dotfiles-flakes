{ pkgs, lib, builtins }:

let
  unstablePackages = import <unstable> { };
  HOME_PATH = builtins.getEnv "HOME";
in
with builtins; {
  home-manager = {
    enable = true;
  };

  bash = {
    enable = true;

    initExtra = ''
      # Init extra config
      export PATH="$HOME/.local/bin:$PATH"
    '';

    profileExtra = ''
      # Profile extra config
    '';

    historyIgnore = [ "ls" "cd" "exit" ];
    shellOptions = [ "histappend" "checkwinsize" "extglob" "globstar" "checkjobs" "autocd" ];

    # shellAliases = import ./programs/bash/alias.nix;
  };

  git = {
    enable = true;

    userEmail = "email@antoniomasia.com";
    userName = "Antonio José Masiá";

    extraConfig = {
      # TODO: Add github config to auth with token
      core = {
        excludesfile = "${HOME_PATH}/.gitignore";
      };

      init = {
        defaultBranch = "main";
      };

      ui = {
        color = true;
      };
    };

    ignores = [
      ".dir-locals.el"
      ".projectile"
      "TAGS"
      ".tern-project"
      "tsserver.log"
      "ti-.*.log"
      ".log"
    ];
  };

  bat = {
    enable = true;
  };

  alacritty = {
    enable = true;

    settings = {
      env = {
        WINIT_X11_SCALE_FACTOR = "1.05";
      };

      class = {
        instance = "Alacritty";
        general = "Alacritty";
      };

      font = {
        size = 12;

        normal = {
          family = "Hack Nerd Font";
        };
      };

      colors = {
        primary = {
          background = "#24283b";
          foreground = "0xa9b1d6";
        };

        selection = {
          background = "#444444";
          text = "#c5c8c6";
        };

        cursor = {
          cursor = "#d0d0d0";
          text = "#151515";
        };

        normal = {
          black = "0x32344a";
          blue = "0x7aa2f7";
          cyan = "0x449dab";
          green = "0x9ece6a";
          magenta = "0xad8ee6";
          red = "0xf7768e";
          white = "0x787c99";
          yellow = "0xe0af68";
        };

        bright = {
          black = "0x444b6a";
          blue = "0x7da6ff";
          cyan = "0xbb9af7";
          green = "0xb9f27c";
          magenta = "0xbb9af7";
          red = "0xff7a93";
          white = "0xacb0d0";
          yellow = "0xff9e64";
        };
      };

      window = {
        padding = { x = 8; y = 8; };
      };

      cursor = {
        blink_interval = 750;
        unfocused_hollow = false;

        style = {
          shape = "underline";
          blinking = "always";
        };
      };

      shell = {
        program = "/run/current-system/sw/bin/bash";
      };
    };
  };

  starship = {
    enable = true;
    enableBashIntegration = true;

    settings = {
      add_newline = false;
      line_break = {
        disabled = true;
      };

      aws = {
        disabled = true;
      };

      nix_shell = {
        impure_msg = "i";
        pure_msg = "p";
      };
    };
  };

  vim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      ale
      awesome-vim-colorschemes
      ctrlp
      emmet-vim
      fugitive
      nerdtree
      vim-airline
      vim-airline-themes
      vim-css-color
      vim-devicons
      vim-gitgutter
      vim-jsx-pretty
      vim-one
      vim-surround
    ];

    settings = {
      expandtab = true;
      number = true;
      relativenumber = true;
      tabstop = 2;
    };

    extraConfig = ''
      set smarttab
      set softtabstop=0
      set shiftwidth=2
      set autoindent
      set showcmd
      let b:ale_fixers = ['prettier', 'eslint']
      let g:ale_completion_enabled = 1
      set omnifunc=ale#completion#OmniFunc
      let g:ale_completion_autoimport = 1
      let g:airline_theme='fruit_punch'
      let g:airline_powerline_fonts = 1
      colorscheme OceanicNext
    '';
  };
}
