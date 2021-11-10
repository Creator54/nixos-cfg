{ config, ... }:

{ programs.mpv = {
    enable = true;
    config = {
      hwdec="auto-safe";
      vo="gpu";
      profile="gpu-hq";
      force-window = true;
    };
  };
}
