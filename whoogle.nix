{ config, pkgs, ... }:

let
  userConfig = (import ./userConfig.nix).userConfig;
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
        ports = [ "${userConfig.whoogle.port}:5000" ]; #server locahost : docker localhost
      };
    };
  };
  services.nginx.virtualHosts = {
    "search.${userConfig.hostName}" = {
      enableACME = true;
      forceSSL = true;
      locations."/".proxyPass = "http://localhost:${userConfig.whoogle.port}";
    };
  };
}
