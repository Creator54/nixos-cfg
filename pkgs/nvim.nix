{ config, pkgs, lib, ... }:

{
  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = https://github.com/creator54/neovim-nightly-overlay/archive/test.tar.gz;
    }))
  ];

  programs = {
    neovim = {
      enable = true;
      package = pkgs.neovim-nightly;
      vimAlias = true;
      extraConfig = ''
        " vim-fish
        syntax enable
        filetype plugin indent on
        " Set this to have long lines wrap inside comments.
        setlocal textwidth=79

        "for indentline
        let g:indentLine_char = '▏'

        " set the mapleader to space
        let mapleader = " "

        "Vim-pad : for taking notes while working on a file
        "Disable default
        let g:pad#set_mappings = 0
        "let g:pad#silent_on_mappings_fail = 1
        "more-info: https://github.com/fmoralesc/vim-pad/issues/67
        let g:pad#dir = '~/.local/share/nvim/vim-pad/'
        nnoremap <leader>p :Pad new<CR>

        " Start n³ in the current file's directory
        " Disable default mappings
        let g:nnn#set_default_mappings = 0
        nnoremap <leader>n :NnnPicker %:p:h<CR>
        " leaderkey is '\' leaderkey + n opens nnn in vim
        " Floating window (neovim latest and vim with patch 8.2.191)
        let g:nnn#layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Debug' } }

        colorscheme onedark
        "colorscheme space-vim-dark
        let g:airline_theme='deus'

        set ts=2 sw=2
        "set relativenumber
        set number
        set undofile

        "remove trailing spaces
        nnoremap <leader>t :%s/\s\+$//e <CR> :w <CR>
      '';
      plugins = with pkgs.vimPlugins;

      let

        context-vim = pkgs.vimUtils.buildVimPlugin {
          name = "context-vim";
          src = pkgs.fetchFromGitHub {
            owner = "wellle";
            repo = "context.vim";
            rev = "e38496f1eb5bb52b1022e5c1f694e9be61c3714c";
            sha256 = "1iy614py9qz4rwk9p4pr1ci0m1lvxil0xiv3ymqzhqrw5l55n346";
          };
        };

        vim-cpp-modern = pkgs.vimUtils.buildVimPlugin {
          name = "vim-cpp-modern";
          src = pkgs.fetchFromGitHub {
            owner = "bfrg";
            repo = "vim-cpp-modern";
            rev = "1a0d31ff541e115895b6357b203a0969835b3212";
            sha256 = "0vcz2dk8l5qfgsc8vf0m7s3i2gl8s0k8wfmn79c9zxr8w6zjrrvs";
          };
        };

        coc-nvim = pkgs.vimUtils.buildVimPlugin {
          name = "coc.nvim";
          src = pkgs.fetchFromGitHub {
            owner = "neoclide";
            repo = "coc.nvim";
            rev = "9d3c40bcb2304cda1697a0d898ce4d8b00e6e170";
            sha256 = "1hpw03cxb22cmrjgisb8hf7pxqb06c4nk1n4sixrjj132d36pmpp";
          };
        };
        vim-pad = pkgs.vimUtils.buildVimPlugin {
          name = "vim-pad";
          src = pkgs.fetchFromGitHub {
            owner = "fmoralesc";
            repo = "vim-pad";
            rev = "2a39b6857ada72f1f81b12c85baf7f067cb90739";
            sha256 = "0v4zfqa3nw9wmkp2jfd9i804mv9d98pv85js4mxhban174ihhizn";
          };
        };

      in

      [
        coc-nvim

        popup-nvim    #all 3 as per telescope-nvim
        plenary-nvim
        telescope-nvim

        vim-javascript
        vim-fish
        vim-pad #for taking notes in vim
        vim-cpp-modern
        clang_complete
        context-vim
        yats-vim
        nnn-vim
        #sensible
        awesome-vim-colorschemes
        vim-airline #the bottom bar
        vim-airline-themes
        fugitive
        rust-vim
        supertab #for tab completion
        vim-signify #a better alternative to vim-git-gutter
        vim-nix
        colorizer
        vim-latex-live-preview
        vim-abolish

        indentLine
        indent-blankline-nvim
      ];
    };
  };
}
