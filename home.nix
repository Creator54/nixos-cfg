{ config, pkgs, lib, ... }:

{
  imports = [
    ./pkgs/general.nix 
    ./wm/wm-pkgs.nix #dwm default wm, if none specified dwm boots
  ];

  home = {
    username = "creator54";
    homeDirectory = "/home/creator54";
    stateVersion = "21.05"; #do not touch

    file = {
      ".config/gromit-mpx.ini".source = ./configs/gromit-mpx.ini;
      ".config/flameshot".source = ./configs/flameshot;
      ".config/fish".source = ./configs/fish;
      ".config/rofi".source = ./wm/wm-configs/rofi;
      ".config/gtk-3.0".source = ./configs/gtk-3.0;
      ".config/htop".source = ./configs/htop;
      ".icons".source = ./configs/icons;
      ".xinitrc".source = ./configs/xinitrc;
      ".Xresources".source = ./configs/Xresources;
    };
  };
}
