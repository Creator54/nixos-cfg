{ config, pkgs, modulesPath, ... }:

{
  boot = {
    kernelPackages = pkgs.linuxPackages_zen;
  };
}
