{ pkgs, lib, ... }:
let
  dwm = pkgs.dwm.overrideAttrs (old: {
    src = builtins.fetchTarball https://github.com/creator54/dwm/tarball/main;
    nativeBuildInputs = with pkgs; [ #writing once works for both currently, sort of bug and feature
      xorg.libX11.dev
      xorg.libXft
      imlib2
      xorg.libXinerama
    ];
  });
  dwmblocks = pkgs.dwmblocks.overrideAttrs (old: {
    src = builtins.fetchTarball https://github.com/creator54/dwmblocks/tarball/master;
  });
in
{
  home.packages = [ dwm dwmblocks ];
}
