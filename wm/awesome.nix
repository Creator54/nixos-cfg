{ config, pkgs, lib, ... }:

{
  xsession.windowManager.awesome.enable = true;
  home.file.".config/awesome".source = ./wm-configs/awesome;
}
