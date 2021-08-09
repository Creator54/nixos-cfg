{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot = {
    initrd.availableKernelModules = [ "xhci_pci" "ahci" "usb_storage" "sd_mod" "sr_mod" ];
    initrd.kernelModules = [ "i915" ];
    kernelModules = [ "kvm-intel" ];
    extraModulePackages = [ ];
    supportedFilesystems = [ "ntfs-3g" ];
    resumeDevice = "/dev/sda4";

    # https://discourse.nixos.org/t/thinkpad-t470s-power-management/8141
    extraModprobeConfig = lib.mkMerge [
      # idle audio card after one second
      "options snd_hda_intel power_save=1"
      # enable wifi power saving (keep uapsd off to maintain low latencies)
      "options iwlwifi power_save=1 uapsd_disable=1"
    ];

    # https://github.com/NixOS/nixpkgs/issues/18356
    blacklistedKernelModules = [ "nouveau" ];
    
    kernelParams = [
      "i915.enable_fbc=1"
      "i915.enable_psr=2"
      "intel_pstate=disable"
      "resume_offset=61440" #get it via sudo filefrag -v /swapfile | awk '{if($1=="0:"){print $4}}'
    ];
  };

  hardware = {
    cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    opengl.driSupport32Bit = true;
    opengl.extraPackages = with pkgs; [
      vaapiIntel
      vaapiVdpau
      libvdpau-va-gl
      intel-media-driver
    ];
    pulseaudio.enable = true;
    pulseaudio.support32Bit = true;
  };

  # Setting noatime in the fstab greatly improves filesystem performance.
  fileSystems."/" =
    { device = "/dev/sda4";
      fsType = "ext4";
      options = [ "noatime" ];
    };

  fileSystems."/boot" =
    { device = "/dev/sda1";
      fsType = "vfat";
    };

  fileSystems."/home" =
    { device = "/dev/sda5";
      fsType = "ext4";
    };

 # fileSystems."/run/mount/data" =
 #   { device = "/dev/sda6";
 #     fsType = "ntfs";
 #     options = [ "rw" "uid=1000" "gid=100"]; #1000 is $USER uid
 #   };
  fileSystems."/run/mount/data1" =
    { device = "/dev/sda7";
      fsType = "ext4";
    };

  zramSwap = {
    enable = true;
    algorithm = "zstd";
    #memoryMax = 3072;
    memoryPercent = 50;
    numDevices = 1;
    priority = 5;
  };
    
  swapDevices = [ { device = "/swapfile"; size = 4096; } ];
}
