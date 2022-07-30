{ pkgs, ... }:

{
  imports = [
    ./web.nix
    ./nextcloud.nix
    ./hardware-configuration.nix
  ];

  environment.systemPackages = with pkgs; [ home-manager  cachix ];
  boot.cleanTmpDir = true;

  networking = {
    hostName = "server";
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

    autoOptimiseStore = true; #automatically detects files in the store that have identical contents and replaces with hard links.
    trustedUsers = [ "root" "creator54" ]; #for cachix to work
    #settings = {
    #  auto-optimise-store = true; #automatically detects files in the store that have identical contents and replaces with hard links.
    #  trusted-users = [ "root" "creator54" ]; #for cachix to work
    #};
  };

  users.users.creator54 = {
    shell = pkgs.fish;
    group = "users";
    extraGroups = [ "wheel" ];
    isNormalUser = true;
    hashedPassword = "$1$DWB64kU7$qILCX4xO8DkGDAcvcqANc."; #generated via openssl passwd -1
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDUG+dQCoGoq1cHa6yYmx925i1GJqgFY/+NRh9mnecxzNiqm4BdsBz/wfn7WKJzGjQNKb5QX3QD72xJHXojziFhVA531rJoQavM93IKDI1vlng7v4mHnQVMQqT6l67zZDEraVs2/V3Rz+5YYo2ecvRhY4i5evzR8t2h89jWVYjUHcgGQPwnHzFjLItI7rnaYS50QaeCgfpRMqjwosp/FDKZYHz+gCMTOH6l5wFkmRJBBWviwVybwDC3Hpp88hS3DrC/HrFrOpzhFzCIs18RxefEEp0EDAIf5pS5gbHgIfkuX4SQTIWA2ZOeHTMDQrOx12EsqSccFxB0eczdtu/MoOBh webserver"

      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDHSEw5zX0noyIHiLM3DuNsHaSKP/1wiwKJQWPBGzOgALwarc6HFW5kY1uzS6YFAyVtMG8jh3AsGdEV4V3p8rvFdyupxvC0lkFWI3eq2JI7AZRjSZyPmwUDo1OGDUCyK2nMg5O4vXOMWN5TG5z2CduOWkpKMRK7AF5jN5cIYhMmg9eYMjxAfppYPrfdOr8YRsadNJs8MtFwtwLn4jFpc781uw8zo9oyLZQ9knja0EgXrDSA6SGo+nQNMEbogU2xxVD18WfwoucHm+vw+DuBWQcMMHqXvfdv4KVatNBQt0V3XNdax0nRT2a6F4f/L6XAgUs2pQRgold7lN42RGiyBV6RZd/RAPvhdSU5kHcft7B1wCUvHivwH2DQlQs76H+52u456ruytkjaqpS7A6QHCAUdmP9RHuz85f9g/qQuVpmsW3u1pphTilt786UHGv1aEkxAI1AN/irK6DO7GAJEKkf1OuaEuKYIRzRkhRUSjEVYQb26v4v4O5ZPc5duWFUY8ZWinBTZ7SWcSeFE6gxuDx6UTVki/UKGyHJsU3sJl80ma9YoGYN0P4BfXVycUO4kgQGrSDbu6uXQ41vjiYXr/tLosSLtoXOwmO5K5nfFTCH/CCtWEgqKOn/8avZ4mV6UjIBlQE38GLu4Yq7622V4aCxCJpUC2IVteJRPabWmra4kQQ== hi.creator54@gmail.com"
    ];
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
  system.stateVersion = "22.05";
}
