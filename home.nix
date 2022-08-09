{ config, pkgs, lib, ... }:
let
  userConfig = (import ./userConfig.nix).userConfig;
in
{
  imports = [
    ./pkgs/general.nix
  ];

  home = {
    username = "${userConfig.userName}";
    homeDirectory = "/home/${userConfig.userName}";
    stateVersion = "${userConfig.stateVersion}";

    file = {
      ".config/fish".source = ./configs/fish;
      ".config/htop".source = ./configs/htop;
      ".tmux.conf".source = ./configs/tmux.conf;
    };
  };
}
