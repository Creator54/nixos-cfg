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
      recommendedTlsSettings = true;
      recommendedGzipSettings = true;
      recommendedOptimisation = true;
      recommendedProxySettings = true;
      virtualHosts = {
        "${host}" = {
          #enableACME = true;
          #forceSSL = true;
          root = "${path}/main/public";
          locations."/resume" = {
            root = "${path}";
            extraConfig = ''
              rewrite ^ /resume.pdf break;
              add_header Content-Disposition 'inline';
            '';
          };
        };
        "blog.${host}".root = "${path}/blog/_site/";
        "search.${host}".locations."/".proxyPass = "http://localhost:5000";
        "sharedby.${host}".locations."/".proxyPass = "http://localhost:8080";
      };
    };
  };
  systemd.services.nginx.serviceConfig.ProtectHome = "read-only";
}
