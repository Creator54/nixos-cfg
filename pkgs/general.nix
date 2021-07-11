{ config, pkgs, lib, ... }:

{
  imports = [
    ./git.nix
    ./bat.nix
    ./nvim.nix
    #./fish.nix
    ./firefox.nix
#    ./kitty.nix
  ];

  home.packages = with pkgs; [
    wget htop feh nox git github-cli nnn
    obs-studio rofi feh aria2 nodejs meld
    gnumake fzf mpv vlc tdesktop ncftp
    capitaine-cursors kitty fortune 
    bibata-extra-cursors w3m gnome.nautilus
    papirus-maia-icon-theme #qtcreator
    colorpicker
    adapta-gtk-theme #dark theme
    fira-code
    fira-code-symbols
    cascadia-code
    source-code-pro
    twemoji-color-font
    xorg.xf86videointel
    xorg.xf86inputmouse
    xorg.xf86inputkeyboard
    xorg.xf86inputlibinput
    xorg.xf86inputsynaptics
  ];
}
