{ config, pkgs, lib, ... }:

{
  programs.mcfly = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
    enableZshIntegration = true;
    fuzzySearchFactor = 5;#https://github.com/cantino/mcfly#fuzzy-searching
  };
}
