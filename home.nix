{ config, pkgs, lib, ... }:

{
  imports = [
    ./wm/dwm.nix
    ./wm/wm-pkgs.nix
    ./pkgs/general.nix
    ./pkgs/firefox.nix
  ];

  home = {
    username = "creator54";
    homeDirectory = "/home/creator54";
    stateVersion = "22.05"; #do not touch

    file = {
      ".config/gromit-mpx.ini".source                       = ./configs/gromit-mpx.ini;
      ".config/flameshot".source                            = ./configs/flameshot;
      ".config/fish".source                                 = ./configs/fish;
      ".config/mpv/scripts".source                          = ./configs/mpv/scripts;
      ".config/mpv/script-opts/youtube-quality.conf".source = ./configs/mpv/youtube-quality.conf;
      ".config/gtk-3.0".source                              = ./configs/gtk-3.0;
      ".config/htop".source                                 = ./configs/htop;
      ".icons".source                                       = ./configs/icons;
      ".xinitrc".source                                     = ./configs/xinitrc;
      ".Xresources".source                                  = ./configs/Xresources;
    };
  };
}
