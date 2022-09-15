{ config, pkgs, lib, ... }:
#let
#  unstable = import (builtins.fetchTarball https://github.com/nixos/nixpkgs/tarball/nixpkgs-unstable)
#  { config = config.nixpkgs.config; };
#in
#using unstable means regular updates, ie more data usage
{
  imports = [
    ./git.nix
    ./bat.nix
    ./mpv.nix
    ./nvim.nix
    #./htop.nix
    ./kitty.nix
    ./fonts.nix
    ./mcfly.nix
    ./zathura.nix
    ./redshift.nix
  ];

  services.kdeconnect = {
    enable = true;
    indicator = true;
  };

  home.packages = with pkgs; [
    vlang ani-cli bc zip
    wget htop github-cli nnn openssl xplr
    aria2 nodejs libclang gcc
    gnumake fzf vlc tdesktop ncftp
    capitaine-cursors fortune file gnome.nautilus
    colorpicker smartmontools jq
    yt-dlp eva ueberzug tree qbittorrent
    unzip picom cmus conky fd #faster find alternative
    gromit-mpx pup progress
    anydesk lm_sensors screenkey
    efibootmgr duf gdu xclip direnv clipit
    dig ffmpeg pciutils nix-index #contains nix-locate
    entr googler imgp recode glow
    papirus-maia-icon-theme fff acpi sxiv axel python39 groff #for ms macros to pdf
    pandoc texlive.combined.scheme-small #for converting .md files to pdf
    ddgr ytfzf
    #(kodi.withPackages (p: with p; [ inputstream-adaptive pvr-iptvsimple inputstreamhelper ])) #kodi with jiotv, last is for drm
  ];
  nixpkgs.config.allowUnfree = true;
}
