{ config, pkgs, lib, ... }:

let
  cfgPath = /home/creator54/.config/nixpkgs/configs;
in
{
  imports = [
    ./wm/dwm.nix
    ./wm/wm-pkgs.nix
    ./pkgs/general.nix
    ./pkgs/firefox.nix
  ];

  home = {
    username = "creator54";
    stateVersion = "22.05"; #do not touch
    homeDirectory = "/home/creator54";
    enableNixpkgsReleaseCheck = true;

    file = {
      ".config/gromit-mpx.ini".source                       = "${cfgPath}/gromit-mpx.ini";
      ".config/flameshot".source                            = "${cfgPath}/flameshot";
      ".config/fish".source                                 = "${cfgPath}/fish";
      ".config/xplr".source                                 = "${cfgPath}/xplr";
      ".config/mpv/scripts".source                          = "${cfgPath}/mpv/scripts";
      ".config/mpv/script-opts/youtube-quality.conf".source = "${cfgPath}/mpv/youtube-quality.conf";
      ".config/gtk-3.0".source                              = "${cfgPath}/gtk-3.0";
      ".config/htop".source                                 = "${cfgPath}/htop";
      ".icons".source                                       = "${cfgPath}/icons";
      ".xinitrc".source                                     = "${cfgPath}/xinitrc";
      ".Xresources".source                                  = "${cfgPath}/Xresources";
    };
  };
}
