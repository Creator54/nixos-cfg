let
  config = (import ../../userConfig.nix).userConfig;
in
{
  imports = [
    (if config.docker.enable then ./docker.nix else ./place-holder.nix)
    (if config.web.enable then ./web.nix else ./place-holder.nix)
    (if config.web.whoogle.enable then ./whoogle.nix else ./place-holder.nix)
    (if config.web.adguard.enable then ./adguard.nix else ./place-holder.nix)
    (if config.web.plex.enable then ./plex-server.nix else ./place-holder.nix)
    (if config.web.jellyfin.enable then ./jellyfin.nix else ./place-holder.nix)
    (if config.web.nextCloud.enable then ./next-cloud.nix else ./place-holder.nix)
    (if config.web.codeServer.enable then ./code-server.nix else ./place-holder.nix)
  ];
}
