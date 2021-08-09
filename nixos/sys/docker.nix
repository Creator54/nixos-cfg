{ config, pkgs, lib, ... }:

{
  #docker
  virtualisation.docker = {
    enable = true;
    extraOptions = "--config-file=${pkgs.writeText "daemon.json" (builtins.toJSON {
      graph ="/run/mount/data1/docker";
      storage-driver = "overlay";
    })}";
  };
  users.users.creator54.extraGroups = ["docker"];
  # https://stackoverflow.com/questions/24309526/how-to-change-the-docker-image-installation-directory
  # https://github.com/NixOS/nixpkgs/issues/68349

}
