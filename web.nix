let
  host = "creator54.me";
  path = "/var/www";
in
{
  networking.firewall.allowedTCPPorts = [ 80 443 ];
  services = {
    nginx = {
      enable = true;
      statusPage = true;
      recommendedOptimisation = true;
      virtualHosts = {
        "${host}" = {
          #enableACME = true;
          #forceSSL = true;
          root = "${path}/${host}";
        };
        "blog.${host}" = {
          root = "${path}/blog";
        };
      };
    };
  };
  #systemd.services.nginx.serviceConfig.ProtectHome = "read-only";
}
