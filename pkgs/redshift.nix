{ config, ... }:

{
  services.redshift = {
    enable = true;
    latitude = "25.5941";
    longitude = "85.1356";
    tray = true;
    #provider = "manual";
    temperature = {
      night = 5501;
      day = 3501;
    };
    settings.redshift = {
      brightness-day = "0.4";
      brightness-night = "0.9";
    };
  };
}
