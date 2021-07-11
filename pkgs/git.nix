{ config, pkgs, lib, ... }:

{
  programs.git = {
    enable = true;
    userName = "creator54";
    userEmail = "hi.creator54@gmail.com";
    aliases = { # Usage git i/c/b/r
      i = "init";
      c = "commit";
      b = "branch";
      r = "remote";
      a = "add .";
      l = "log";
      ck = "checkout";
      x = "reset --hard";
      u = "pull origin $(git branch | sed 's/^* //')";
      p = "push origin $(git branch | sed 's/^* //')";
    };
  };
}
