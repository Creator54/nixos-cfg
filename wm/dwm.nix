{ pkgs, lib, ... }:
let
  dwm = pkgs.dwm.overrideAttrs (old: {
    version = "6.2";
    src = pkgs.fetchFromGitHub {
      owner = "creator54";
      repo = "dwm";
      rev = "b1";
      sha256 = "sha256-uvl9o9GmWA1QVSel0VbZfTX+j9SBGZsXIgO8pZCo5NQ=";
    };
    nativeBuildInputs = with pkgs; [ #writing once works for both currently, sort of bug and feature
      xorg.libX11.dev
      xorg.libXft
      imlib2
      xorg.libXinerama
    ];
  });
  dwmblocks = pkgs.dwmblocks.overrideAttrs (old: {
    src = pkgs.fetchFromGitHub {
      owner = "creator54";
      repo = "dwmblocks";
      rev = "master";
      sha256 = "sha256-ezpAG37d6P4mWo6heeMGdtETNKNzXdcx/frv2F5q73g=";
    };
  });
in
{
  home.packages = [ dwm dwmblocks ];
}
