let
  config = (import ./userConfig.nix).userConfig; #if issues read sudo journalctl -u nginx
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
        "${config.hostName}" = {
          enableACME = true;
          forceSSL = true;
          root = "${config.hostSrc}";
          locations = {
            "/logs" = {
              root = "${config.path}";
              extraConfig = ''
                autoindex on;
              '';
            };
            "/blog".extraConfig = '' rewrite ^/(.*)$ https://blog.${config.hostName} redirect; '';
            "/blog/".extraConfig = '' rewrite ^/blog/(.*)$ https://blog.${config.hostName}/$1 redirect;'';
          };
        };
        "docs.${config.hostName}" = {
          enableACME = true;
          forceSSL = true;
          locations ={
            "/resume" = {
              root = "${config.path}";
              extraConfig = ''
                rewrite ^ /resume.pdf break;
                add_header Content-Disposition 'inline';
              '';
            };
          };
        };
        "blog.${config.hostName}" = {
          enableACME = true;
          forceSSL = true;
          root = "${config.blogSrc}";
        };
        "test.${config.hostName}" = {
          enableACME = true;
          forceSSL = true;
          locations."/".proxyPass = "http://localhost:8080";
        };
      };
    };
  };

  security.acme = {
    acceptTerms = true;
    certs."${config.hostName}".webroot = "/var/lib/acme/acme-challenge";
    defaults.email = "${config.userEmail}";
  };

  systemd.services.nginx.serviceConfig.ProtectHome = "read-only";
}
