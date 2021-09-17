{ config, pkgs, lib, ... }:

{
  fonts.fontconfig.enable = true;
  home.packages = [
    (pkgs.nerdfonts.override { 
      fonts = [ 
        "SourceCodePro" "FiraCode" "DroidSansMono"
      ];
    })
  ];
}
