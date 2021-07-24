{ config, pkgs, lib, ... }:

{
  imports = [
    ./git.nix
    ./nvim.nix
  ];

  home.packages = with pkgs; [
    wget htop feh nox git github-cli nnn
    rofi feh aria2 nodejs meld libclang gcc
    gnumake fzf mpv vlc tdesktop ncftp
    capitaine-cursors kitty fortune file 
    bibata-extra-cursors w3m gnome.nautilus
    papirus-maia-icon-theme qtcreator vscode
    colorpicker smartmontools glances jq 
    youtube-dl adapta-gtk-theme #dark theme
    fira-code gnome-latex ueberzug eva
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

  nixpkgs.config.allowUnfree = true; 
}
