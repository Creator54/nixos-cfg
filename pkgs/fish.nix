{ config, pkgs, lib, ... }:

{
  programs.fish = {
    enable = true;
    functions = [
      {
        name = "mzish";
        src = pkgs.fetchFromGitHub {
          owner = "creator54";
          repo = "mzish";
          rev = "v2";
          sha256 = "3VkbPDDuX/PGFHNDOSmS0RPUgEdB0x7t7BDecc98rDQ=";
        };
      }
    ];
  };
}
