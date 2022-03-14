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
          enableACME = true;
          forceSSL = true;
          root = "${path}/main/public";
          locations = {
            "/blog".extraConfig = '' rewrite ^/(.*)$ https://blog.${host} redirect; '';
            "/blog/".extraConfig = '' rewrite ^/blog/(.*)$ https://blog.${host}/$1 redirect;'';
          };
        };
        "documents.${host}" = {
          enableACME = true;
          forceSSL = true;
          locations."/resume" = {
            root = "${path}";
            extraConfig = ''
              rewrite ^ /resume.pdf break;
              add_header Content-Disposition 'inline';
            '';
          };
        };
        "blog.${host}" = {
          enableACME = true;
          forceSSL = true;
          root = "${path}/blog/_site/";
        };
        "search.${host}" = {
          enableACME = true;
          forceSSL = true;
          locations."/".proxyPass = "http://localhost:5000";
        };
        "sharedby.${host}" = {
          enableACME = true;
          forceSSL = true;
          locations."/".proxyPass = "http://localhost:8080";
        };
      };
    };
  };

  security.acme = {
    acceptTerms = true;
    certs."${host}".webroot = "/var/lib/acme/acme-challenge";
    email = "hi.creator54@gmail.com";
  };

  systemd.services.nginx.serviceConfig.ProtectHome = "read-only";
}
