{ config, pkgs, lib, ... }:

{
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    source-code-pro(nerdfonts.override {
      fonts = [
        "SourceCodePro" "FiraCode" "DroidSansMono"
      ];
    })
  ];
}
