{ config, pkgs, lib, ... }:

#let
#  unstableTarball = fetchTarball https://releases.nixos.org/nixpkgs/nixpkgs-21.05pre286178.ff13163e3fd/nixexprs.tar.xz;
#in
{
 # nixpkgs.config = {
 #   packageOverrides = pkgs: {
 #     unstable = import unstableTarball {
 #       config = config.nixpkgs.config;
 #     };
 #   };
 # };

  home.packages = with pkgs; [
    wget htop feh nox git github-cli nnn
    kitty obs-studio rofi bat aria2 nodejs
    gnumake fzf mpv vlc tdesktop
    capitaine-cursors
    bibata-extra-cursors
    papirus-maia-icon-theme
    meld
    colorpicker
    feh
    adapta-gtk-theme #dark theme
    fira-code
    fira-code-symbols
    cascadia-code
    source-code-pro
    twemoji-color-font
    #unstable.firefox
    xorg.xf86videointel
    xorg.xf86inputmouse
    xorg.xf86inputkeyboard
    xorg.xf86inputlibinput
    xorg.xf86inputsynaptics
  ];
}
