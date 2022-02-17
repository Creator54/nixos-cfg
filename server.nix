{ pkgs, ... }:

{
  imports = [
    ./web.nix
    ./hardware-configuration.nix
  ];

  environment.systemPackages = [ pkgs.home-manager ];
  boot.cleanTmpDir = true;
  zramSwap.enable = true;

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
  };
  users.users.creator54 = {
    shell = pkgs.fish;
    group = "users";
    extraGroups = [ "wheel" ];
    isNormalUser = true;
    hashedPassword = "$1$DWB64kU7$qILCX4xO8DkGDAcvcqANc."; #generated via openssl passwd -1
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDUG+dQCoGoq1cHa6yYmx925i1GJqgFY/+NRh9mnecxzNiqm4BdsBz/wfn7WKJzGjQNKb5QX3QD72xJHXojziFhVA531rJoQavM93IKDI1vlng7v4mHnQVMQqT6l67zZDEraVs2/V3Rz+5YYo2ecvRhY4i5evzR8t2h89jWVYjUHcgGQPwnHzFjLItI7rnaYS50QaeCgfpRMqjwosp/FDKZYHz+gCMTOH6l5wFkmRJBBWviwVybwDC3Hpp88hS3DrC/HrFrOpzhFzCIs18RxefEEp0EDAIf5pS5gbHgIfkuX4SQTIWA2ZOeHTMDQrOx12EsqSccFxB0eczdtu/MoOBh webserver"
    ];
  };
}
