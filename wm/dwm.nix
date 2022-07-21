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
      rev = "d2c93aaa1f49e36d62586ac067340bf4b026b115";
      sha256 = "0y7gd9gdivzszlqxfpbklcs17lbn0vipk8cfb8kgxs6xgqdl0fkv";
    };
  });
in
{
  home.packages = [ dwm dwmblocks ];
}
