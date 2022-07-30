{ config, pkgs, ... }:
{
  services = { #Gzip and Proxy optimisations needs to be disabled for this to work, also authentication with password always faile
    code-server = {
      enable = true;
      auth = "none";
      port = 5000;
      user = "creator54";
    };
    nginx = {
      virtualHosts = {
        "code.creator54.me" = {
          forceSSL = true;
          enableACME = true;
          extraConfig = ''
            proxy_set_header Upgrade $http_upgrade;
            proxy_set_header Connection upgrade;
            proxy_set_header Accept-Encoding gzip;
          '';
          locations."/".proxyPass = "http://localhost:5000";
        };
      };
    };
  };
}
