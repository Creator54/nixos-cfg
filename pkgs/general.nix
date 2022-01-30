{ config, pkgs, lib, ... }:

{
  imports = [
    ./git.nix
    ./bat.nix
    ./nvim.nix
    ./fonts.nix
    ./mcfly.nix
  ];

  home.packages = with pkgs; [
    wget htop git github-cli nnn
    aria2 nodejs meld libclang gcc gnumake fzf file
    smartmontools glances jq
    eva unzip fd #faster find alternative
    progress lm_sensors duf gdu xclip
    nix-output-monitor
    dig ffmpeg pciutils nix-index #contains nix-locate
    entr imgp recode glow
    fff acpi axel python3 tree tmux
  ];
  nixpkgs.config.allowUnfree = true;
}
