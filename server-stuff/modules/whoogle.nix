{ config, pkgs, ... }:
let
  whoogle = (import ../../userConfig.nix).userConfig.web.whoogle;
in
{
  virtualisation = {
    podman = {
      enable = true;
      dockerCompat = true;
    };
    oci-containers = {
      backend = "podman";
      containers.whoogle-search = {
        image = "benbusby/whoogle-search:latest";
        autoStart = true;
        ports = [ "${whoogle.port}:5000" ]; #server locahost : docker localhost
      };
    };
  };
  services.nginx.virtualHosts = {
    "${whoogle.host}" = {
      enableACME = true;
      forceSSL = true;
      locations."/".proxyPass = "http://localhost:${whoogle.port}";
    };
  };
}
