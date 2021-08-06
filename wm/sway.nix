{ config, pkgs, lib, ... }:

{
  wayland.windowManager.sway = {
    enable = true;
  };
}
