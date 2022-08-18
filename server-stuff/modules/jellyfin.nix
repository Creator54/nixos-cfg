{config, pkgs, ...}:
let
  jellyfin = (import ../../userConfig.nix).userConfig.web.jellyfin;
in
{
  services = {
    nginx.virtualHosts."${jellyfin.host}" = {
      http2 = true; # http2 can more performant for streaming: https://blog.cloudflare.com/introducing-http2/
      forceSSL = true;
      enableACME = true;
      locations."/".proxyPass = "http://localhost:" + builtins.toString jellyfin.port;
    };
    jellyfin = {
      enable = true;
      user = jellyfin.user;
    };
  };
}
