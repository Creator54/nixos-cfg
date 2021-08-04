{ config, pkgs, lib, ... }:

{
  imports = [
    ./git.nix
    ./nvim.nix
    ./bat.nix
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
    fira-code ueberzug eva tree qbittorrent
    fira-code-symbols unzip picom cmus conky
    cascadia-code flameshot inkscape obs-studio
    source-code-pro speedtest-cli electron
    twemoji-color-font anydesk lm_sensors
    xorg.xf86videointel
    xorg.xf86inputmouse
    xorg.xf86inputkeyboard
    xorg.xf86inputlibinput
    xorg.xf86inputsynaptics
  ];

  nixpkgs.config.allowUnfree = true; 
}
