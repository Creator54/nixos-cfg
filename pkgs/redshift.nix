{ config, ... }:

{
  services.redshift = {
    enable = true;
    latitude = "12.9719";
    longitude = "77.5937";
    tray = true;
    provider = "manual";
    temperature = {
      night = 5500;
      day = 3700;
    };
    #settings.redshift = {
    #  brightness-day = "0.4";
    #  brightness-night = "0.9";
    #};
  };
}
