let
  #if issues read sudo journalctl -u nginx
  userConfig = (import ../../userConfig.nix).userConfig;
in
{
  networking.firewall.allowedTCPPorts = [ 80 443 ];
  services = {
    nginx = {
      enable = true;
      user = "${userConfig.userName}";
      enableReload = true;
      statusPage = true;
      recommendedTlsSettings = true;
      recommendedGzipSettings = true;
      recommendedOptimisation = true;
      recommendedProxySettings = true;
      # Only allow PFS-enabled ciphers with AES256
      sslCiphers = "AES256+EECDH:AES256+EDH:!aNULL";

      virtualHosts = {
        "${userConfig.hostName}" = {
          enableACME = true;
          forceSSL = true;
          root = "${userConfig.hostSrc}";
          locations = {
            "/blog".extraConfig = '' rewrite ^/(.*)$ https://blog.${userConfig.hostName} redirect; '';
            "/blog/".extraConfig = '' rewrite ^/blog/(.*)$ https://blog.${userConfig.hostName}/$1 redirect;'';
          };
        };
        "docs.${userConfig.hostName}" = {
          enableACME = true;
          forceSSL = true;
          locations ={
            "/resume" = {
              root = "${userConfig.path}";
              extraConfig = ''
                rewrite ^ /resume.pdf break;
                add_header Content-Disposition 'inline';
              '';
            };
          };
        };
        "blog.${userConfig.hostName}" = {
          enableACME = true;
          forceSSL = true;
          root = "${userConfig.blogSrc}";
        };
        "test.${userConfig.hostName}" = {
          enableACME = true;
          forceSSL = true;
          locations."/".proxyPass = "http://localhost:8080";
        };
      };
    };
  };

  security.acme = {
    acceptTerms = true;
    certs."${userConfig.hostName}".webroot = "/var/lib/acme/acme-challenge";
    defaults.email = "${userConfig.userEmail}";
  };

  systemd.services.nginx.serviceConfig.ProtectHome = "read-only";
}
