let
  host = "creator54.me";
  path = /home/creator54/website-stuff;
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
          root = "${path}/main/public";
        };
        "blog.${host}" = {
          root = "${path}/blog";
        };
        "sharedby.${host}" = {
          root = "${path}/sharedby";
          locations."/".extraConfig = ''
            autoindex on;
            autoindex_exact_size off;
            autoindex_localtime on;
          '';#creating an index.html here will makeit render as default page here
        };
      };
    };
  };
  systemd.services.nginx.serviceConfig.ProtectHome = "read-only";
}
