{ config, pkgs, ... }:

{
  imports =
    [
      ./kernel/xanmod.nix #not including reverts kernel to one included in nixos revision
      ./sys/hardware.nix
      ./sys/services.nix
      ./sys/flatpak.nix
      ./sys/bt.nix
      ./sys/samba.nix
      ./sys/hosts.nix
      ./sys/resolved-hosts.nix
      ./sys/docker.nix
      ./sys/plymouth.nix
      #./sys/nvidia.nix
      #./sys/silent_boot.nix
      #./vm-configs/virt-manager.nix
      #./vm-configs/virtualbox.nix
    ];

  boot = {
    loader = {
      systemd-boot.enable = true;
      timeout = 0;
      efi.canTouchEfiVariables = true;
    };
    cleanTmpDir = true;
  };

  # networking
  networking = {
    networkmanager.enable = true;
    hostName = "CosPi";
    nameservers = ["8.8.4.4" "8.8.8.8" "1.1.1.1" "9.9.9.9"]; #without this will have to add nameserves to /etc/resolv.conf , internet fails without this on chroot, should be declared since not using dhcp
  };

  environment.systemPackages = [ pkgs.home-manager ];
  time.timeZone = "Asia/Kolkata";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_IN.UTF-8";
  console = {
    earlySetup = true;
    font = "${pkgs.terminus_font}/share/consolefonts/ter-v18n.psf.gz"; #setfont ter-132b
    packages = with pkgs; [ terminus_font ];
    keyMap = "us";
  };

  # useraccount & properties
  users = {
    users.creator54 = {
      isNormalUser = true;
      extraGroups = [ "power" "storage" "wheel" "audio" "video" "networkmanager" ];
      shell = pkgs.fish;
    };
  };

  security.allowSimultaneousMultithreading = true;

  #services.openssh = {
  #  enable = true;
  #  forwardX11 = true;
  #};

  # Maintainence
  nix = {
    autoOptimiseStore = true; #automatically detects files in the store that have identical contents and replaces with hard links.
    gc = {
      automatic = true; 				# runs nix-collect-garbage which removes old unrefrenced packages
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    trustedUsers = [ "root" "creator54" ]; #for cachix to work
  };

  time.hardwareClockInLocalTime = true;
  system.stateVersion = "21.05";
}

