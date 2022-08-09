{ config, pkgs, ... }:
let
  userConfig = (import ./userConfig.nix).userConfig;
in
{
  services = { #Gzip and Proxy optimisations needs to be disabled for this to work, also authentication with password always faile
    code-server = {
      enable = true;
      auth = "none";
      port = userConfig.codeServer.port;
      user = "${userConfig.userName}";
    };
    nginx = {
      virtualHosts = {
        "${userConfig.codeServer.host}" = {
          forceSSL = true;
          enableACME = true;
          extraConfig = ''
            proxy_set_header Upgrade $http_upgrade;
            proxy_set_header Connection upgrade;
            proxy_set_header Accept-Encoding gzip;
          '';
          locations."/".proxyPass = "http://localhost:" + builtins.toString userConfig.codeServer.port;
        };
      };
    };
  };
}
