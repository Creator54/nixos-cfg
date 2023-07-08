{ config, ... }:

{
  virtualisation.docker = {
    enable = true;
    enableOnBoot = false;
    rootless = { 
      enable = true;
      setSocketVariable = true;
    };
  };
  users.users.creator54.extraGroups = ["docker"];
}
