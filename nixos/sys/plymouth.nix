{ config, pkgs,... }:

{
  boot = {
    kernelParams = [ "quiet" ];
    consoleLogLevel = 0;
    plymouth = {
      enable = true;
      themePackages = with pkgs; [
        plymouth (breeze-plymouth.override {
        })
      ];
      theme = "breeze";
    };
  };
} 
