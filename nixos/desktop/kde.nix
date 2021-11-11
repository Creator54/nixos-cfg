{ config, pkgs, lib, ... }:

{
  services = {
    xserver = {
      displayManager = {
        defaultSession = "plasma5";
	sddm.enable = true;
      };
      desktopManager.plasma5.enable = true;
    };
  };
}

