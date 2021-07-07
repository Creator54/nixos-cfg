{ config, pkgs, lib, ... }:

{
  programs.fish = {
    loginShellInit = "Welcome";
    interactiveShellInit = "Welcome";
  };
}
