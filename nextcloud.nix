{config, pkgs, ...}:

let
  nextcloudhost = "cloud.creator54.me";
  unstableTarball = fetchTarball https://releases.nixos.org/nixpkgs/nixpkgs-22.11pre395741.1a1bd86756c/nixexprs.tar.xz;
in
{
  nixpkgs.config = {
    allowUnfree = true;
    packageOverrides = pkgs: {
      unstable = import unstableTarball {
        config = config.nixpkgs.config;
      };
    };
  };

  services.nginx = {
  # Setup Nextcloud virtual host to listen on ports
    virtualHosts = {
      "${nextcloudhost}" = {
        ## Force HTTP redirect to HTTPS
        forceSSL = true;
        ## LetsEncrypt
        enableACME = true;
      };
    };
  };

  # Actual Nextcloud Config
  services.nextcloud = {
    enable = true;
    package = pkgs.unstable.nextcloud24;
    enableImagemagick = true;
    hostName = "${nextcloudhost}";
    # Enable built-in virtual host management
    # Takes care of somewhat complicated setup
    # See here: https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-apps/nextcloud.nix#L529

    # Use HTTPS for links
    https = true;

    # Auto-update Nextcloud Apps
    autoUpdateApps ={
      enable = true;
      # Set what time makes sense for you
      startAt = "05:00:00";
    };

    config = {
      # Further forces Nextcloud to use HTTPS
      overwriteProtocol = "https";

      # Nextcloud PostegreSQL database configuration, recommended over using SQLite
      dbtype = "pgsql";
      dbuser = "nextcloud";
      dbhost = "/run/postgresql"; # nextcloud will add /.s.PGSQL.5432 by itself
      dbname = "nextcloud";
      dbpassFile = "/var/nextcloud-db-pass";

      adminuser = "creator54";
      adminpassFile = "/var/nextcloud-admin-pass";
    };
  };

  # Enable PostgreSQL
  services.postgresql = {
    enable = true;

    # Ensure the database, user, and permissions always exist
    ensureDatabases = [ "nextcloud" ];
    ensureUsers = [
      {
        name = "nextcloud";
        ensurePermissions."DATABASE nextcloud" = "ALL PRIVILEGES";
      }
    ];
  };

  # Ensure that postgres is running before running the setup
  systemd.services."nextcloud-setup" = {
    requires = ["postgresql.service"];
    after = ["postgresql.service"];
  };
}
