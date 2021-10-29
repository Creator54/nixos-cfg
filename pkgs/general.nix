{ config, pkgs, lib, ... }:

{
  imports = [
    ./git.nix
    ./bat.nix
    ./nvim.nix
    #./htop.nix
    ./kitty.nix
    ./fonts.nix
    ./mcfly.nix
    ./zathura.nix
  ];

  home.packages = with pkgs; [
    wget htop git github-cli nnn
    aria2 nodejs meld libclang gcc
    gnumake fzf mpv vlc tdesktop ncftp
    capitaine-cursors kitty fortune file
    w3m gnome.nautilus qtcreator vscode
    colorpicker smartmontools glances jq
    youtube-dl ueberzug eva tree qbittorrent
    unzip picom cmus conky fd #faster find alternative
    inkscape obs-studio okular
    speedtest-cli electron progress
    anydesk lm_sensors screenkey
    efibootmgr duf gdu xclip
    jupyter zathura clipit nix-output-monitor
    dig ffmpeg pciutils nix-index #contains nix-locate
    entr
  ];
  nixpkgs.config.allowUnfree = true;
}
