{ config, pkgs, lib, ... }:

let
  unstableTarball = fetchTarball https://releases.nixos.org/nixpkgs/nixpkgs-21.05pre286178.ff13163e3fd/nixexprs.tar.xz;
in
{
  imports = [ 
    ./nvim.nix
    ./fish.nix
#    ./kitty.nix
  ];

  nixpkgs.config = {
    packageOverrides = pkgs: {
      unstable = import unstableTarball {
        config = config.nixpkgs.config;
      };
    };
  };

  home.packages = with pkgs; [
    wget htop feh nox git github-cli nnn
    obs-studio rofi bat aria2 nodejs meld
    gnumake fzf mpv vlc tdesktop ncftp
    capitaine-cursors kitty fortune 
    bibata-extra-cursors
    papirus-maia-icon-theme
    colorpicker
    feh
    adapta-gtk-theme #dark theme
    fira-code
    fira-code-symbols
    cascadia-code
    source-code-pro
    twemoji-color-font
    unstable.firefox
    xorg.xf86videointel
    xorg.xf86inputmouse
    xorg.xf86inputkeyboard
    xorg.xf86inputlibinput
    xorg.xf86inputsynaptics
  ];
  programs = {
    #home-manager.enable = true;
    firefox = {
      profiles.default = {
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
    git = {
      enable = true;
      userName = "creator54";
      userEmail = "hi.creator54@gmail.com";
    };
  };
}
