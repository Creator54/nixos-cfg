let
  modules = (import ../../userConfig.nix).userConfig.modules;
in
{
  imports = [
    (if modules.web then ./web.nix else ./place-holder.nix)
    (if modules.whoogle then ./whoogle.nix else ./place-holder.nix)
    (if modules.adguard then ./adguard.nix else ./place-holder.nix)
    (if modules.nextCloud then ./next-cloud.nix else ./place-holder.nix)
    (if modules.plexServer then ./plex-server.nix else ./place-holder.nix)
    (if modules.codeServer then ./code-server.nix else ./place-holder.nix)
  ];
}
