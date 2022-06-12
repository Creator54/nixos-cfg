{ config, pkgs, libs, ... }:
let
  dmenu = pkgs.dmenu.overrideAttrs (old: { #custom name also works + prev instead of old works
    version = "5.0";
    src = pkgs.fetchFromGitHub {
      owner = "creator54";
      repo = "dmenu";
      rev = "main";
      sha256 = "1d99kp8msdnbh4rwbccgw0z1nq7lcvr0s4ddm5djsrmhd2g1hkv7";
    };
  });
in
{
  home.packages = with pkgs;[
    feh rofi dmenu betterlockscreen libnotify
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
    dunst.enable = true;
  };
}
