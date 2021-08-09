{ config, pkgs, lib, ... }:

# This creates a new 'nvidia-offload' program that runs the application passed to it on the GPU
# As per https://nixos.wiki/wiki/Nvidia

let
  nvidia-offload = pkgs.writeShellScriptBin "nvidia-offload" ''
    export __NV_PRIME_RENDER_OFFLOAD=1
    export __NV_PRIME_RENDER_OFFLOAD_PROVIDER=NVIDIA-G0
    export __GLX_VENDOR_LIBRARY_NAME=nvidia
    export __VK_LAYER_NV_optimus=NVIDIA_only
    exec -a "$0" "$@"
  '';
in
{
  services = {
    xserver = {
      enable = true;
      videoDrivers = lib.mkDefault [ "nvidia" ];
    };
  };
  hardware.nvidia = {
    prime = {
      offload.enable = lib.mkDefault true;
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };
    powerManagement.enable = true;
    modesetting.enable = true;
    nvidiaPersistenced = true;
  };
  environment.systemPackages = with pkgs; [
    # nvidia offload script
    nvidia-offload
  ];

  nixpkgs.config.allowUnfree = true;
}

# https://kevincox.ca/2020/12/04/nixos-config-switching/
# https://discourse.nixos.org/t/cant-use-nvidia-prime-with-laptop/6767/7
# https://github.com/NixOS/nixos-hardware/blob/master/common/gpu/nvidia.nix
