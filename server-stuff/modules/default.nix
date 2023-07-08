let
  uc = (import ../../userConfig.nix).userConfig;
in
{
  imports = [
    (if uc.docker.enable then ./docker.nix else {})
    (if uc.web.enable then ./web.nix else {})
    (if uc.web.whoogle.enable then ./whoogle.nix else {})
    (if uc.web.adguard.enable then ./adguard.nix else {})
    (if uc.web.plex.enable then ./plex-server.nix else {})
    (if uc.web.jellyfin.enable then ./jellyfin.nix else {})
    (if uc.web.nextCloud.enable then ./next-cloud.nix else {})
    (if uc.web.codeServer.enable then ./code-server.nix else {})
  ];
}
