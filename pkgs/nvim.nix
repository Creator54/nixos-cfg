{ config, pkgs, lib, ... }:

{
  programs = {
    neovim = {
      enable = true;
      vimAlias = true;
      extraConfig = ''
        " 
        let g:airline_theme='deus'
        
        let g:javascript_plugin_jsdoc = 1
				let g:javascript_plugin_ngdoc = 1
				let g:javascript_plugin_flow = 1
				augroup javascript_folding
				  au!
    			au FileType javascript setlocal foldmethod=syntax
				augroup END

        let g:cpp_no_function_highlight = 1
        let g:cpp_attributes_highlight = 1
        let g:cpp_member_highlight = 1
        let g:cpp_simple_highlight = 1

        let g:clang_library_path='r0h2irmx6dk447dpszd9j7zw306rbqnq-clang-8.0.1-lib/lib/libclang.so'
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
        
				fzf.vim = pkgs.vimUtils.buildVimPlugin {
          name = "fzf.vim";
          src = pkgs.fetchFromGitHub {
            owner = "junegunn";
            repo = "fzf.vim";
            rev = "e34f6c129d39b90db44df1107c8b7dfacfd18946";
            sha256 = "0rn0b48zxf46ak0a2dwbx4aas0fjiywhch0viffzhj5b61lvy218";
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

      in

      [
	      #fzf.vim
        coc-nvim
	      coc-python
				coc-java
				coc-lua
	      coc-html
				coc-css
        vim-javascript
        vim-cpp-modern
        clang_complete
        context-vim
		    #vim-autoformat #needs external program that can format code
        #sensible
        vim-airline #the bottom bar
				vim-airline-themes
        #The_NERD_tree # file system explorer
        fugitive 
        #vim-gitgutter # shows uncommited lines in git
        rust-vim
				vim-nix
	      colorizer
	      vim-latex-live-preview
        vim-abolish
        command-t
      ];
    };
  };
}
