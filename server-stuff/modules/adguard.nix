{config, pkgs, ...}:
let
  adguard = (import ../../userConfig.nix).web.adguard;
in
{
  services = {
    nginx.virtualHosts."${adguard.host}" = {
      forceSSL = true;
      enableACME = true;
      locations."/".proxyPass = "http://localhost:" + builtins.toString adguard.port;
    };
    adguardhome = {
      enable = true;
      port = adguard.port;
    };
  };
}
