{ config, pkgs, lib, ... }:

{
  imports = [
    ./pkgs/general.nix
  ];

  home = {
    username = "creator54";
    homeDirectory = "/home/creator54";
    stateVersion = "21.05"; #do not touch

    file = {
      ".config/fish".source = ./configs/fish;
      ".config/htop".source = ./configs/htop;
    };
  };
}
