{ config, pkgs, lib, ... }:

let
  unstableTarball = fetchTarball https://releases.nixos.org/nixpkgs/nixpkgs-21.05pre286178.ff13163e3fd/nixexprs.tar.xz;
in

{
  imports = [
    ./packages.nix
    ./fish.nix
  ];

  nixpkgs.config = {
    packageOverrides = pkgs: {
      unstable = import unstableTarball {
        config = config.nixpkgs.config;
      };
    };
  };
  #home.packages = with pkgs; [ unstable.firefox ];
  programs = {
    #home-manager.enable = true;
    firefox = {
      enable = true;
      profiles.creator54 = {
        userChrome = builtins.readFile firefox-configs/chrome/userChrome.css;
        settings = {
          "browser.startup.homepage" = "https:creator54.github.io";
          "browser.search.region" = "IN";                      
          "browser.search.isUS" = false;                       
          "distribution.searchplugins.defaultLocale" = "en-IN";
          "general.useragent.locale" = "en-IN";                
          "browser.bookmarks.showMobileBookmarks" = true;      
        };
      };
    };
    neovim = {
      enable = true;
      vimAlias = true;
      #extraConfig = '' colorscheme gruvbox '';
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

      in
      [
        fzf-vim
        coc-nvim
        context-vim
	vim-elixir
        idris-vim
        sensible
        vim-airline
        The_NERD_tree # file system explorer
        fugitive vim-gitgutter # git 
        rust-vim
        #YouCompleteMe
	colorizer
        vim-abolish
        command-t
        vim-go
      ];
    };
    git = {
      enable = true;
      userName = "creator54";
      userEmail = "hi.creator54@gmail.com";
    };
  };

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "creator54";
  home.homeDirectory = "/home/creator54";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.03";
}
