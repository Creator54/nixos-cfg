{ config, pkgs, lib, ... }:

{
  imports = [
    ./pkgs/general.nix
    ./wm/wm-pkgs.nix
    ./wm/awesome.nix
  ];

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "creator54";
  home.homeDirectory = "/home/creator54";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.03";
}
