{ config, pkgs, ... }:
let
  whoogle = (import ../../userConfig.nix).web.whoogle;
in
{
  virtualisation = {
    oci-containers = {
      backend = "docker";
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
