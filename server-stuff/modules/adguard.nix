{config, pkgs, ...}:
let
  userConfig = (import ../../userConfig.nix).userConfig;
in
{
  services = {
    nginx.virtualHosts."${userConfig.adguard.host}" = {
      forceSSL = true;
      enableACME = true;
      locations."/".proxyPass = "http://localhost:" + builtins.toString userConfig.adguard.port;
    };
    adguardhome = {
      enable = true;
      port = userConfig.adguard.port;
    };
  };
}
