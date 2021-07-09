{ config, pkgs, lib, ... }:

{
  programs.git = {
    enable = true;
    userName = "creator54";
    userEmail = "hi.creator54@gmail.com";
    aliases = {
      gi = "git init";
      gc = "git commit";
      gb = "git branch";
      gr = "git remote";
      ga = "git add .";
      gl = "git log";
      gck = "git checkout";
      gx = "git reset --hard";
      gu = "git pull origin $(git branch | sed 's/^* //')";
      gp = "git push origin $(git branch | sed 's/^* //')";
    };
  };
}
