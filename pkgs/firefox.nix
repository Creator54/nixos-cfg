{ config, pkgs, lib, ... }:

let
  unstableTarball = fetchTarball https://releases.nixos.org/nixpkgs/nixpkgs-21.05pre286178.ff13163e3fd/nixexprs.tar.xz;
in
{
  nixpkgs.config = {
    packageOverrides = pkgs: {
      unstable = import unstableTarball {
        config = config.nixpkgs.config;
      };
    };
  };

  home.packages = with pkgs; [
    unstable.firefox
  ];
  programs = {
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
  };
}
