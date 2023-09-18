{ config, pkgs, ... }:
let
  link = config.lib.file.mkOutOfStoreSymlink;
in
{
  home.file = {
    ".config/nixpkgs/config.nix".source                   = link ./config.nix;
    ".config/nixpkgs/home.nix".source                     = link ../home.nix;
    ".config/fish".source                                 = link ./fish;
    ".config/starship.toml".source                        = link ./starship.toml;
    ".config/htop".source                                 = link ./htop;
    ".tmux.conf".source                                   = link ./tmux.conf;
    ".bashrc".source                                      = link ./bashrc;
  };
}
