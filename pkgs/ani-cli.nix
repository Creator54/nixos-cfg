{ pkgs, lib, ... }:
let
  ani-cli = pkgs.ani-cli.overrideAttrs (old: {
    src = builtins.fetchTarball "https://github.com/pystardust/ani-cli/tarball/v4";
  });
in
{
  home.packages = [ ani-cli ];
}
