{ pkgs, ... }:
let
  dwm = pkgs.dwm.overrideAttrs (old: {
    src = pkgs.fetchFromGitHub {
      owner = "creator54";
      repo = "dwm";
      rev = "main";
      sha256 = "1p55d8n5pvn71vlhxnkvq5jykky6xlnhv21y8q2kqqhgvm9k1ap0";
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
