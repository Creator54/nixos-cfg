{ pkgs, lib, ... }:
let
  localDwm = /home/creator54/dwm;
  localDwmBlocks = /home/creator54/dwmblocks;
  dwm = pkgs.dwm.overrideAttrs (old: {
    src = if builtins.pathExists localDwm then localDwm else builtins.fetchTarball https://github.com/creator54/dwm/tarball/main;
    nativeBuildInputs = with pkgs; [ #writing once works for both currently, sort of bug and feature
      xorg.libX11.dev
      xorg.libXft
      imlib2
      xorg.libXinerama
    ];
  });
  dwmblocks = pkgs.dwmblocks.overrideAttrs (old: {
    src = if builtins.pathExists localDwmBlocks then localDwmBlocks else builtins.fetchTarball https://github.com/creator54/dwmblocks/tarball/master;
  });
in
{
  home.packages = [ dwm dwmblocks ];
}
