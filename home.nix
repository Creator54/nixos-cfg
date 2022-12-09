{ config, pkgs, lib, ... }:

let
  user = "creator54";
  cfg = "/home/${user}/.config/nixpkgs/configs";
in
{
  imports = [
    ./wm/dwm.nix
    ./wm/wm-pkgs.nix
    ./pkgs/general.nix
    ./pkgs/firefox.nix
  ];

  home = {
    username = "${user}";
    stateVersion = "22.05"; #do not touch
    homeDirectory = "/home/${user}";
    enableNixpkgsReleaseCheck = true;

    file = {
      ".config/gromit-mpx.ini".source                       = "${cfg}/gromit-mpx.ini";
      ".config/flameshot".source                            = "${cfg}/flameshot";
      ".config/fish".source                                 = "${cfg}/fish";
      ".config/xplr".source                                 = "${cfg}/xplr";
      ".config/mpv/scripts".source                          = "${cfg}/mpv/scripts";
      ".config/mpv/script-opts/youtube-quality.conf".source = "${cfg}/mpv/youtube-quality.conf";
      ".config/gtk-3.0".source                              = "${cfg}/gtk-3.0";
      ".config/htop".source                                 = "${cfg}/htop";
      ".icons".source                                       = "${cfg}/icons";
      ".xinitrc".source                                     = "${cfg}/xinitrc";
      ".Xresources".source                                  = "${cfg}/Xresources";
    };
  };
}
