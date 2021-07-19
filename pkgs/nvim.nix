{ config, pkgs, lib, ... }:

{
  programs = {
    neovim = {
      enable = true;
      vimAlias = true;
      extraConfig = '' 
        colorscheme alduin
				set ts=2 sw=2
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
        fzf-vim = pkgs.vimUtils.buildVimPlugin {
          name = "fzf.vim";
          src = pkgs.fetchFromGitHub {
            owner = "junegunn";
            repo = "fzf.vim";
            rev = "e34f6c129d39b90db44df1107c8b7dfacfd18946";
            sha256 = "0rn0b48zxf46ak0a2dwbx4aas0fjiywhch0viffzhj5b61lvy218";
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
	      #alduin = pkgs.vimUtils.buildVimPlugin {
        #  name = "alduin";
        #  src = pkgs.fetchFromGitHub {
        #    owner = "AlessandroYorba";
        #    repo = "alduin";
        #    rev = "ec9107b060d80e4c4148bbf0f3396aba7c60464a";
        #    sha256 = "012hfj582x89dyrkjijxylcyfr3w3v62p8b5dg8hdjmgzw5i5lyl";
        #  };
        #};
	      #molokai = pkgs.vimUtils.buildVimPlugin {
        #  name = "molokai";
        #  src = pkgs.fetchFromGitHub {
        #    owner = "tomasr";
        #    repo = "molokai";
        #    rev = "c67bdfcdb31415aa0ade7f8c003261700a885476";
        #    sha256 = "1piszjr5kyw43ac1f0jh9z88g824xknshrkchbys9qxlz7pd831s";
        #  };
        #};
	      #dracula-theme = pkgs.vimUtils.buildVimPlugin {
        #  name = "vim";
        #  src = pkgs.fetchFromGitHub {
        #    owner = "dracula";
        #    repo = "vim";
        #    rev = "e7154372adc95d637ccd911c2f8601d9ff2eac1f";
        #    sha256 = "1li5q3151kjh8c6a7cdnmbydxhkjgqsa5nlv49dy6dnqc3b50m7s";
        #  };
        #};
				vim-colorschemes = pkgs.vimUtils.buildVimPlugin {
					name = "vim-colorschemes";
					src = pkgs.fetchFromGitHub {
						owner = "flazz";
						repo = "vim-colorschemes";
						rev = "fd8f122cef604330c96a6a6e434682dbdfb878c9";
						sha256 = "1cg8q7w0vgl73aw1b9zz0zh5vw5d2pm8pm54fhfzva4azg56f416";
					};
				};
      in

      [
				vim-colorschemes
        #molokai
	      #dracula-theme
	      #alduin
	      fzf-vim
        coc-nvim
	      coc-python
	      coc-html
        context-vim
  	    vim-elixir
		    vim-autoformat
        idris-vim
        sensible
        vim-airline
        The_NERD_tree # file system explorer
        fugitive 
				#vim-gitgutter # shows uncommited lines in git
        rust-vim
	      colorizer
	      vim-latex-live-preview
        vim-abolish
        command-t
        vim-go
      ];
    };
  };
}
