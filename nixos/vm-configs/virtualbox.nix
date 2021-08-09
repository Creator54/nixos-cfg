{ config, pkgs, ... }:

{  
  users.extraGroups.vboxusers.members = [ "creator54" ];
  virtualisation.virtualbox.host.enable = true;
}
