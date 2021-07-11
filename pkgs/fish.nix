{ config, pkgs, lib, ... }:

{
  programs.fish = {
    enable = true;
    shellAbbrs = {
      gu = "git pull origin $(git branch | sed 's/^* //')";
      gp = "git push origin $(git branch | sed 's/^* //')";
    };
    shellAliases = {
       # General
       d = "cd ~/dev";
       e = "$EDITOR";
       c = "cd ..";
       v = "bat";
       s = "nix search";
       r = "nix-env --uninstall";
       q = "nix-env -q";
       n = "nvidia-offload";
       
       # git aliases
       gi = "git init";
       gc = "git commit";
       gb = "git branch";
       gs = "git status";
       gr = "git remote";
       ga = "git add .";
       gl = "git log";
       gck = "git checkout";
       gx = "git reset --hard";
       #gu = "git pull origin $(git branch | sed 's/^* //')";
       #gp = "git push origin $(git branch | sed 's/^* //')";

       # Extras
       usage = "baobab";
       ftp = "ncftp";
       gallery = "gthumb";
       calc = "eva";
       clipboard = "copyq clipboard";
       ufetch = ".//.config/fish/scripts/ufetch";
       lectures = "cd /run/mount/data1/Lectures/Study";
       ytdl = "youtube-dl";
       sys = "cd /etc/nixos";
       poweshell = "pash";
       pdfviewer = "okular";
       copy = "rsync --info=progress2 -auvz";
       fget = "wget -r –level=0 -E –ignore-length -x -k -p -erobots=off -np -N";
       view_pic = "kitty +kitten icat";
    };
  };
}
