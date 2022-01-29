{ config, ... }:

{ programs.mpv = {
    enable = true;
    config = {
      hwdec="auto-safe";
      vo="gpu";
      profile="gpu-hq";
      force-window = true;
      fs="yes";
      ontop = "yes";
      osc = "no";
      ytdl-format="bestvideo[height<=?480]+bestaudio/best";
    };
  };
}
