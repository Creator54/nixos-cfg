{ config, pkgs, lib, ... }:

let
  awesome = /home/creator54/awesome;
in
{
  xsession.windowManager.awesome.enable = true;
  home.file.".config/awesome".source = if builtins.pathExists awesome then awesome else builtins.fetchTarball "https://github.com/creator54/awesome/tarball/new";
}
