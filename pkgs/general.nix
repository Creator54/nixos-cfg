{ config, pkgs, lib, ... }:

{
  imports = [
    ./git.nix
    ./nvim.nix
    ./bat.nix
  ];

  home.packages = with pkgs; [
    wget htop git github-cli nnn
    aria2 nodejs meld libclang gcc
    gnumake fzf mpv vlc tdesktop ncftp
    capitaine-cursors kitty fortune file 
    w3m gnome.nautilus qtcreator vscode
    colorpicker smartmontools glances jq 
    youtube-dl fira-code ueberzug eva tree qbittorrent
    fira-code-symbols unzip picom cmus conky
    cascadia-code inkscape obs-studio
    source-code-pro speedtest-cli electron
    twemoji-color-font anydesk lm_sensors screenkey
  ];

  nixpkgs.config.allowUnfree = true; 
}
