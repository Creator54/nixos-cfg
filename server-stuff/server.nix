{ pkgs, ... }:
let
  userConfig = (import ../userConfig.nix).userConfig;
in
{
  imports = [
    ./modules
    ./hardware-configuration.nix
  ];

  environment.systemPackages = with pkgs; [ home-manager  cachix ];
  boot.cleanTmpDir = true;

  networking = {
    hostName = "${userConfig.serverHostName}";
    nameservers = ["8.8.4.4" "8.8.8.8" "1.1.1.1" "9.9.9.9"];
    firewall.enable = true;
  };

  services = {
    openssh = {
      enable = true;
      passwordAuthentication = false;
      permitRootLogin = "no";
    };
    journald.extraConfig = "SystemMaxUse=100M";
  };

  nix = {
    gc = {
      automatic = true;                 # runs nix-collect-garbage which removes old unrefrenced packages
      dates = "weekly";
      options = "--delete-older-than 7d";
    };

    settings = {
      auto-optimise-store = true; #automatically detects files in the store that have identical contents and replaces with hard links.
      trusted-users = [ "root" "${userConfig.userName}" ]; #for cachix to work
    };
  };

  nixpkgs.config.allowUnfree = true;

  users.users.${userConfig.userName} = {
    shell = pkgs.fish;
    group = "users";
    extraGroups = [ "wheel" ];
    isNormalUser = true;
    hashedPassword = userConfig.userPassword;
    openssh.authorizedKeys.keys = userConfig.sshKeys;
  };
  zramSwap = {
    enable = true;
    algorithm = "zstd";
    #memoryMax = 3072;
    memoryPercent = 50;
    numDevices = 1;
    priority = 5; #matters only when using multiple swap devices
  };
  swapDevices = [ { device = "/swapfile"; size = 4096; } ];
  system.stateVersion = "${userConfig.stateVersion}";
}
