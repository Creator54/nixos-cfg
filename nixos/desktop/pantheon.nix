{ config, pkgs, ... }:

{
  services = {
    xserver = {
      desktopManager = {
        pantheon.enable = true;
        # pantheon.extraWingpanelIndicators
        # pantheon.extraSwitchboardPlugs 
      };
      displayManager = {
        autoLogin.user = "creator54";
        #lightdm = {  #gets enabled by default
        #  enable = false;
        #  greeters.pantheon.enable = false;
        #};
      };
    };
    pantheon.apps.enable = false; 
  };
  # some apps still comes with the default setup so disabled here
  environment.pantheon.excludePackages = with pkgs; [ gnome3.geary epiphany ];
  environment.systemPackages = with pkgs; [ pantheon.elementary-code ];
}
