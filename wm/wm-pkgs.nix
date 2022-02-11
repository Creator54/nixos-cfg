{ config, pkgs, libs, ... }:
{
  home.packages = with pkgs;[
    feh rofi
    networkmanagerapplet
    flameshot
    xorg.xbacklight
    xorg.xf86videointel
    xorg.xf86inputmouse
    xorg.xf86inputkeyboard
    xorg.xf86inputlibinput
    xorg.xf86inputsynaptics
  ];

  services = {
    betterlockscreen = {
      enable = true;
      arguments = [ "blur" ];
      inactiveInterval = 5;#minutes
    };
    udiskie = {
      enable = true;
      notify = true;
    };
  };
}
