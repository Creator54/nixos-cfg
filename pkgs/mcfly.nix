{ config, pkgs, lib, ... }:

{
  programs.mcfly = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
    enableZshIntegration = true;
    enableFuzzySearch = true;
  };
}
