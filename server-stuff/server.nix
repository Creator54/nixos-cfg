{ pkgs, ... }:
let
  uc = (import ../userConfig.nix).userConfig;
  hm = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/release-${uc.stateVersion}.tar.gz";
in
{
  imports = [
    ./modules
    ../home.nix
    (import "${hm}/nixos")
    ./hardware-configuration.nix
  ];

  environment.systemPackages = with pkgs; [ cachix home-manager ];
  boot = {
    kernelPackages = pkgs.linuxPackages_zen;
    cleanTmpDir = true;
  };

  networking = {
    hostName = "${uc.serverHostName}";
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
      dates = "daily";
      options = "--delete-older-than 7d";
    };
    settings = {
      experimental-features = [ "nix-command" "flakes" ]; #enable flakes
      substituters = [
       "https://cache.nixos.org"
       "https://nixpkgs.cachix.org"
       "https://nix-community.cachix.org"
      ];
      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "nixpkgs.cachix.org-1:q91R6hxbwFvDqTSDKwDAV4T5PxqXGxswD8vhONFMeOE="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
      auto-optimise-store = true; #automatically detects files in the sto      re that have identical contents and replaces with hard links.
      trusted-users = [ "root" "${uc.userName}" ]; #for cachix to work
    };
  };

  nixpkgs.config.allowUnfree = true;

  users.users.${uc.userName} = {
    shell = pkgs.fish;
    group = "users";
    extraGroups = [ "wheel" ];
    isNormalUser = true;
    hashedPassword = uc.userPassword;
    openssh.authorizedKeys.keys = uc.sshKeys;
  };
  swapDevices = [ { device = "/swapfile"; size = 4096; } ];
  system.stateVersion = "${uc.stateVersion}";
}
