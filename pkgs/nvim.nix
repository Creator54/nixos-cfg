{ config, pkgs, lib, ... }:

{
  home.packages = [ pkgs.ccls ];
  programs = {
    neovim = {
      enable = true;
      vimAlias = true;
      viAlias = true;
      coc = {
        enable = true;
        settings = {
          "suggest.noselect" = true;
          "suggest.enablePreview" = true;
          "suggest.enablePreselect" = false;
          "suggest.disableKind" = true;
          "languageserver" = {
            "ccls" = {
              "command" = "ccls";
              "filetypes" = ["c" "cc" "cpp" "c++" "objc" "objcpp"];
              "rootPatterns" = [".ccls" "compile_commands.json" ".git/" ".hg/"];
              "initializationOptions" = {
                "cache" = {
                  "directory" = "/tmp/ccls";
                };
              };
            };
          };
        };
      };
      extraConfig = ''
        call wilder#setup({
              \ 'modes': [':', '/', '?'],
              \ 'next_key': '<Tab>',
              \ 'previous_key': '<S-Tab>',
              \ 'accept_key': '<Down>',
              \ 'reject_key': '<Up>',
              \ })
        "quick-scppe config
        " Trigger a highlight only when pressing f and F.
        "let g:qs_highlight_on_keys = ['f', 'F']

        " enable whitespace highlight
        let g:better_whitespace_ctermcolor='red'
        let g:better_whitespace_enabled=1
        let g:strip_whitespace_on_save=1

        " Ctrl +a
        nnoremap <C-a>     :normal gg0vG$<CR>

        " Ctrl +c
        nnoremap <C-c>     :normal gg0vG$y<CR>

        " open a new tab
        nnoremap <C-n>     :tabnew<CR>

        " move to the previous/next tabpage.
        nnoremap <C-Tab> :tabn<CR>
        nnoremap <C-S-Tab> :tabp<CR>

       " .vimrc
        let g:auto_save = 1  " enable AutoSave on Vim startup

        " vim-fish
        syntax enable
        filetype plugin indent on
        " Set this to have long lines wrap inside comments.
        setlocal textwidth=79

        "for indentline
        let g:indentLine_char = '▏'

        " set the mapleader to space
        let mapleader = " "

        " make Vim mouse aware: i.e enable mouse pointing
        set mouse=a

        " Copy file contents directly to clipboard
        set clipboard=unnamedplus

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
        set termguicolors
        hi Normal guibg=#1E1E1E
        "colorscheme space-vim-dark
        let g:airline_theme='deus'

        set ts=2 sw=2

        " tab=2spaces
        " https://stackoverflow.com/questions/1878974/redefine-tab-as-4-spaces
        set tabstop=2
        set softtabstop=0 noexpandtab
        set shiftwidth=2
        set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab

        "set relativenumber
        set number
        set undofile

        "remove trailing spaces
        nnoremap <leader>t :%s/\s\+$//e <CR> :w <CR>

        " Call compile
        " Open the PDF from /tmp/
        function! Preview()
          :call Compile()<CR><CR>
          execute "! zathura %.pdf &"
        endfunction

        " [1] Get the extension of the file
        " [2] Apply appropriate compilation command
        " [3] Save PDF as /tmp/op.pdf
        function! Compile()
          let extension = expand('%:e')
          if extension == "ms"
            execute "! groff -ms % -T pdf > %.pdf"
          elseif extension == "tex"
            execute "! pandoc -f latex -t latex % -o %.pdf"
          elseif extension == "md"
            execute "! pandoc % -s -o %.pdf"
          endif
        endfunction

        " map \ + p to preview
        noremap <leader>v :call Preview()<CR><CR><CR>

        " map \ + q to compile
        noremap <leader>c :call Compile()<CR><CR>

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

        vim-pad = pkgs.vimUtils.buildVimPlugin {
          name = "vim-pad";
          src = pkgs.fetchFromGitHub {
            owner = "fmoralesc";
            repo = "vim-pad";
            rev = "2a39b6857ada72f1f81b12c85baf7f067cb90739";
            sha256 = "0v4zfqa3nw9wmkp2jfd9i804mv9d98pv85js4mxhban174ihhizn";
          };
        };

        vim-better-whitespace = pkgs.vimUtils.buildVimPlugin {
          name = "vim-better-whitespace";
          src = pkgs.fetchFromGitHub {
            owner = "ntpeters";
            repo = "vim-better-whitespace";
            rev = "1b22dc57a2751c7afbc6025a7da39b7c22db635d";
            sha256 = "sha256-OZ25no2pZQfyb1Yo00rE2XgKop+xutloRAoE8Lfqv4M=";
          };
        };
        quick-scope = pkgs.vimUtils.buildVimPlugin {
          name = "quick-scope";
          src = pkgs.fetchFromGitHub {
            owner = "unblevable";
            repo = "quick-scope";
            rev = "master";
            sha256 = "sha256-MfqxI8CXmVXn3ZAyZqCufgZ690GTuy6PMgKTPVBuNm4=";
          };
        };
        wilder = pkgs.vimUtils.buildVimPlugin {
          name = "wilder.nvim";
          src = pkgs.fetchFromGitHub {
            owner = "gelguy";
            repo = "wilder.nvim";
            rev = "master";
            sha256 = "sha256-jbLwoZLD6jL9QMIuUXiCbA4nP0Caw+iiHuCCGaxLZQU=";
          };
        };
        vim-auto-save = pkgs.vimUtils.buildVimPlugin {
          name = "vim-auto-save";
          src = pkgs.fetchFromGitHub {
            owner = "907th";
            repo = "vim-auto-save";
            rev = "master";
            sha256 = "sha256-sCUEGcIyJHs/Qqgl6246ZWcNokTR0h9+AA6SYzyMhtU=";
          };
        };
      in [
        vim-auto-save
        wilder
        quick-scope
        vim-better-whitespace
        vim-javascript
        vim-fish
        vim-pad #for taking notes in vim
        context-vim
        nnn-vim
        #sensible
        awesome-vim-colorschemes
        vim-airline #the bottom bar
        vim-airline-themes
        fugitive #usage :G log/remote, works like git log/remote
        supertab #for tab completion
        vim-signify #a better alternative to vim-git-gutter
        vim-nix
        colorizer #colors code in files
        vim-abolish #used for search and replace in files #https://github.com/tpope/vim-abolish

        indentLine
        indent-blankline-nvim
      ];
    };
  };
}
