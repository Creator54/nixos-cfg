{ config, pkgs, ... }:

  let
    unstableTarball = fetchTarball https://releases.nixos.org/nixpkgs/nixpkgs-21.05pre286178.ff13163e3fd/nixexprs.tar.xz;
  in
  {
    nixpkgs.config = {
      packageOverrides = pkgs: {
        unstable = import unstableTarball {
          config = config.nixpkgs.config;
        };
      };
    };

  environment.systemPackages = with pkgs; [
    wget vim htop feh nox git github-cli
    gnumake
    unstable.firefox
    kitty
    fortune
    capitaine-cursors
    bibata-extra-cursors
    papirus-maia-icon-theme
    adapta-gtk-theme #dark theme
    meld
    colorpicker
    nitrogen
    xorg.xf86videointel
    xorg.xf86inputmouse
    xorg.xf86inputkeyboard
    xorg.xf86inputlibinput
    xorg.xf86inputsynaptics
  ];
  
  # Some fonts
   fonts.fonts = with pkgs; [
     fira-code fira-code-symbols
     cascadia-code
     source-code-pro
     twemoji-color-font
   ];

  # Allow Properietry packages
  nixpkgs.config.allowUnfree = true;
}

# https://stackoverflow.com/questions/48831392/how-to-add-nixos-unstable-channel-declaratively-in-configuration-nix
# https://channels.nixos.org/

