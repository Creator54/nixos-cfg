{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs.bat-extras; [ batgrep batman batwatch prettybat batdiff ];
  programs.bat = {
    enable = true;
    config = { 
      theme = "zenburn";
      style = "grid";
    };
  };
}
