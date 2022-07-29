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
      # Only allow PFS-enabled ciphers with AES256
      sslCiphers = "AES256+EECDH:AES256+EDH:!aNULL";

      virtualHosts = {
        "${host}" = {
          enableACME = true;
          forceSSL = true;
          root = "${path}/main/public";
          locations = {
            "/logs" = {
              root = "${path}";
              extraConfig = ''
                autoindex on;
              '';
            };
            "/blog".extraConfig = '' rewrite ^/(.*)$ https://blog.${host} redirect; '';
            "/blog/".extraConfig = '' rewrite ^/blog/(.*)$ https://blog.${host}/$1 redirect;'';
          };
        };
        "docs.${host}" = {
          enableACME = true;
          forceSSL = true;
          locations ={
            "/resume" = {
              root = "${path}";
              extraConfig = ''
                rewrite ^ /resume.pdf break;
                add_header Content-Disposition 'inline';
              '';
            };
            "/resume-01" = {
              root = "${path}";
              extraConfig = ''
                rewrite ^ /resume-01.pdf break;
                add_header Content-Disposition 'inline';
              '';
            };

          };
        };
        "blog.${host}" = {
          enableACME = true;
          forceSSL = true;
          root = "${path}/blog/_site/";
        };
      };
    };
  };

  security.acme = {
    acceptTerms = true;
    certs."${host}".webroot = "/var/lib/acme/acme-challenge";
    defaults.email = "hi.creator54@gmail.com";
  };

  systemd.services.nginx.serviceConfig.ProtectHome = "read-only";
}
