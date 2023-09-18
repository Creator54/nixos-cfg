{ config, pkgs, lib, ... }:
let
  uc = (import ./userConfig.nix);
in
{
  home-manager.users.${uc.userName} = { pkgs, ... }: {
    imports = [
      ./pkgs/general.nix
      ./configs/symlinks.nix
    ];

    home = {
      username = "${uc.userName}";
      homeDirectory = "/home/${uc.userName}";
      stateVersion = "${uc.stateVersion}";
    };
  };
}
