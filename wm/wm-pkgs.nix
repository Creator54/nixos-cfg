{ config, pkgs, libs, ... }:
{
  home.packages = with pkgs;[
    feh rofi betterlockscreen
    networkmanagerapplet dmenu
    flameshot
    xorg.xf86videointel
    xorg.xf86inputmouse
    xorg.xf86inputkeyboard
    xorg.xf86inputlibinput
    xorg.xf86inputsynaptics
    gnome.gnome-keyring gnome.libsecret
  ];

  services.udiskie = {
    enable = true;
    notify = true;
  };
}
