{ config, pkgs, libs, ... }:
{
  home.packages = with pkgs;[
    feh betterlockscreen
    networkmanagerapplet dmenu
    flameshot
    xorg.xbacklight
    xorg.xf86videointel
    xorg.xf86inputmouse
    xorg.xf86inputkeyboard
    xorg.xf86inputlibinput
    xorg.xf86inputsynaptics
  ];

  programs.rofi = {
    enable = true;
    configPath = "$(pwd)/wm-configs/rofi/config.rasi";
  };

  services = {
    udiskie = {
      enable = true;
      notify = true;
    };
  };
}
