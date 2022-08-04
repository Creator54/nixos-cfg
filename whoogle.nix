{ config, pkgs, ... }:

let
  host = "creator54.me";
  serverPort = "8050";
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
        ports = [ "${serverPort}:5000" ]; #server locahost : docker localhost
      };
    };
  };
  services.nginx.virtualHosts = {
    "search.${host}" = {
      enableACME = true;
      forceSSL = true;
      locations."/".proxyPass = "http://localhost:${serverPort}";
    };
  };
}
