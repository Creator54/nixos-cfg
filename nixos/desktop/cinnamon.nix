{ config, pkgs, lib, ... }:

{
  services = {
    xserver = {
      displayManager = {
        defaultSession = "cinnamon";
	lightdm.enable = true;
      };
      desktopManager.cinnamon.enable = true;
    };
  };

  services.cinnamon.apps.enable = false;

  # exclude some default applications
  environment.cinnamon.excludePackages = with pkgs.cinnamon; [
    blueberry
  ];
}

