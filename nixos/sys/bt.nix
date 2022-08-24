{ config, pkgs, lib, ... }:

{
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true; #doesnt work on false
    settings.General.Enable = "Source,Sink,Media,Socket";
  };
  services.blueman.enable = true;
  # currently need to
  # sudo rfkill unblock bluetooth;sudo systemctl restart bluetooth;
  # now connect via `headset` or bluetoothctl/blueman-applet
}

