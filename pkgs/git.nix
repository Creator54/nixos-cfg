{ config, pkgs, lib, ... }:

{
  programs.git = {
    enable = true;
    userName = "creator54";
    userEmail = "hi.creator54@gmail.com";
  };
}
