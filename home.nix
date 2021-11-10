{ config, pkgs, lib, ... }:

{
  imports = [
    ./pkgs/general.nix
    ./wm/wm-pkgs.nix
  ];

  home = {
    username = "creator54";
    homeDirectory = "/home/creator54";
    stateVersion = "21.05"; #do not touch

    file = {
      ".config/gromit-mpx.ini".source = ./configs/gromit-mpx.ini;
      ".config/fish".source = ./configs/fish;
      ".xinitrc".source = ./configs/xinitrc;
      ".Xresources".source = ./configs/Xresources;
    };
  };
}
