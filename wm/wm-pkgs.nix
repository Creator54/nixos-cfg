{ config, pkgs, libs, ... }:
{
  home.packages = with pkgs;[
    feh rofi betterlockscreen
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
    udiskie = {
      enable = true;
      notify = true;
    };
  };
}
