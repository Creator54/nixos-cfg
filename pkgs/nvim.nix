{ config, pkgs, lib, ... }:
let
  nvimConfig = if builtins.pathExists "${config.home.homeDirectory}/nvim" then "${config.home.homeDirectory}/nvim" else (
    pkgs.fetchFromGitHub{
      owner = "creator54";
      repo = "starter";
      rev = "main";
      sha256 = "sha256-LXm8DEcjTdTFifgWbcwK16wEovOTLg7YQ4/hwQ9QUyU=";
    }
  );
in
{
  programs.neovim = {
    enable = true;
    vimAlias = true;
  };

  home = {
    file.".config/nvim".source = config.lib.file.mkOutOfStoreSymlink nvimConfig;
    packages = [ pkgs.luajit ]; #dep for some plugins
  };
}

