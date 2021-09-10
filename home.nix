{ config, pkgs, lib, ... }:

{
  imports = [
    ./pkgs/general.nix
    ./wm/wm-pkgs.nix
    ./wm/awesome.nix
  ];

  programs.home-manager.enable = true;

  home = {
    username = "creator54";
    homeDirectory = "/home/creator54";
    stateVersion = "21.05"; #do not touch
  };
}
