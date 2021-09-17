{ config, pkgs, lib, ... }:

{
  imports = [
    ./git.nix
    ./bat.nix
    ./nvim.nix
    ./htop.nix
    ./fonts.nix
    ./mcfly.nix
  ];

  home.packages = with pkgs; [
    wget htop git github-cli nnn
    aria2 nodejs meld libclang gcc
    gnumake fzf mpv vlc tdesktop ncftp
    capitaine-cursors kitty fortune file 
    w3m gnome.nautilus qtcreator vscode
    colorpicker smartmontools glances jq 
    youtube-dl ueberzug eva tree qbittorrent
    unzip picom cmus conky
    inkscape obs-studio okular
    speedtest-cli electron progress
    anydesk lm_sensors screenkey
    efibootmgr duf gdu xclip
  ];
  nixpkgs.config.allowUnfree = true; 
}
