{ config, pkgs, lib, ... }:

{
  services.xserver.windowManager.dwm.enable = true;
  #nixpkgs.overlays = [
  #  (self: super: {
  #    dwm = super.dwm.overrideAttrs (oldAttrs: rec {
  #      patches = [
  #        (super.fetchpatch {
  #          url = "https://dwm.suckless.org/patches/statuspadding/dwm-statuspadding-20150524-c8e9479.diff";
  #          sha256 = "09p2k6n501ab12226rjqf2yc1aacixfpqxgixrg0py4635f0m0cp";
  #        })
  #        (super.fetchpatch {
  #          url = "https://dwm.suckless.org/patches/bottomstack/dwm-bottomstack-6.1.diff";
  #          sha256 = "16fh75zgm2v1bjp76x6awflmka4dl4nhmd81ybg1n1j6aczi4zq7";
  #        })
  #        (super.fetchpatch {
  #          url = "https://dwm.suckless.org/patches/cfacts/dwm-cfacts-20200913-61bb8b2.diff";
  #          sha256 = "0r27s9pifgwg24mswn0mhcd11ki13xik6wcy8g57syd22bpvnyjr";
  #        })
  #        (super.fetchpatch {
  #          url = "https://dwm.suckless.org/patches/dragmfact/dwm-dragmfact-6.2.diff";
  #          sha256 = "0y82vf008k3mrbn4syrzccwqkkh2v72wd79332yivgi2ib55xj7n";
  #        })
  #      ];
  #    });
  #  })
  #];
}
