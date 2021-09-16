{ config, pkgs, lib, ... }:

{
  #run this to add repo
  #flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
  services.flatpak.enable = true;
  xdg.portal.enable = true;
}
