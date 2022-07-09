{ config, pkgs, lib, ... }:

{
  nixpkgs.config.packageOverrides = pkgs: {
    nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
      inherit pkgs;
    };
  };

  programs = {
    firefox = {
      enable = true;
      extensions = with pkgs.nur.repos.rycee.firefox-addons; [
        stylus
        noscript
        wappalyzer
        darkreader
        sponsorblock
        ublock-origin
        https-everywhere
        facebook-container
        bypass-paywalls-clean
        return-youtube-dislikes
        multi-account-containers
        user-agent-string-switcher
        terms-of-service-didnt-read
        duckduckgo-privacy-essentials
      ];
      profiles.default = {
        id = 0;
        name = "Default";
        isDefault = true;
        #userChrome = builtins.readFile "/home/creator54/cascade/userChrome.css";
        userChrome = builtins.readFile "${builtins.fetchurl https://raw.githubusercontent.com/creator54/cascade/main/userChrome.css}";
        settings = { #about:config
          "browser.startup.homepage" = builtins.fetchurl https://raw.githubusercontent.com/Creator54/tilde/main/index.html;
          "browser.search.region" = "IN";
          "browser.search.isUS" = false;
          "browser.download.animateNotifications" = false;
          "security.dialog_enable_delay" = 0;
          "distribution.searchplugins.defaultLocale" = "en-IN";
          "general.useragent.locale" = "en-IN";
          "browser.bookmarks.showMobileBookmarks" = true;
          "ui.systemUsesDarkTheme" = 1;
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
          "svg.context-properties.content.enabled" = true;
          "layers.acceleration.force-enabled" = true;
          "gfx.webrender.all" = true;
        };
      };
    };
  };
}
