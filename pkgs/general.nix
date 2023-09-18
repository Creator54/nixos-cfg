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
    wget htop github-cli nnn starship
    aria2 nodejs libclang gcc gnumake fzf
    smartmontools glances jq direnv
    eva unzip fd #faster find alternative
    progress lm_sensors duf gdu xclip
    nix-output-monitor
    dig ffmpeg pciutils nix-index #contains nix-locate
    entr imgp recode glow
    fff acpi axel python3 tree tmux
  ];
  nixpkgs.config.allowUnfree = true;
}
