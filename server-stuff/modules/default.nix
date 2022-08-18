let
  web = (import ../../userConfig.nix).userConfig.web;
in
{
  imports = [
    (if web.enable then ./web.nix else ./place-holder.nix)
    (if web.whoogle.enable then ./whoogle.nix else ./place-holder.nix)
    (if web.adguard.enable then ./adguard.nix else ./place-holder.nix)
    (if web.plex.enable then ./plex-server.nix else ./place-holder.nix)
    (if web.jellyfin.enable then ./jellyfin.nix else ./place-holder.nix)
    (if web.nextCloud.enable then ./next-cloud.nix else ./place-holder.nix)
    (if web.codeServer.enable then ./code-server.nix else ./place-holder.nix)
  ];
}
