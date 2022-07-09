{ config, pkgs, lib, ... }:

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
    ./ani-cli.nix
    ./zathura.nix
    #./redshift.nix
  ];

  home.packages = with pkgs; [
    wget htop git github-cli nnn
    aria2 nodejs meld libclang gcc
    gnumake fzf vlc tdesktop ncftp
    capitaine-cursors kitty fortune file
    w3m gnome.nautilus qtcreator
    colorpicker smartmontools glances jq
    youtube-dl eva ueberzug tree qbittorrent
    unzip picom cmus conky fd #faster find alternative
    inkscape okular gromit-mpx pup
    speedtest-cli electron progress
    anydesk lm_sensors screenkey
    efibootmgr duf gdu xclip direnv
    jupyter zathura clipit nix-output-monitor
    dig ffmpeg pciutils nix-index #contains nix-locate
    entr googler imgp recode glow
    papirus-maia-icon-theme fff acpi sxiv axel python39 groff #for ms macros to pdf
    pandoc texlive.combined.scheme-small #for converting .md files to pdf
    ddgr nodePackages.peerflix bluetooth_battery ytfzf
    (kodi.withPackages (p: with p; [ inputstream-adaptive pvr-iptvsimple inputstreamhelper ])) #kodi with jiotv, last is for drm
  ];
  nixpkgs.config.allowUnfree = true;
}
