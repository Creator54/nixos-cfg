{ pkgs, lib, ... }:
let
  dwm = pkgs.dwm.overrideAttrs (old: {
    src = pkgs.fetchFromGitHub {
      owner = "creator54";
      repo = "dwm";
      rev = "main";
      sha256 = "1m74m28abg0348brn6c1sj7zwdbxv5bd3997am80sn56s6ipvyds";
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
      sha256 = "0dj5nv5mjzixfddnzlngn12q4ia09szyq107cjmih9qh3dmmd5fq";
    };
  });
in
{
  home.packages = [ dwm dwmblocks ];
}
