{ config, pkgs, lib, ... }:

{
  programs.zathura = {
    enable = true;
    options = {
      font = "'Fira Code NerdFont' 13";
      statusbar-home-tilde = true;
      window-title-home-tilde = true;
      completion-bg = "#282828";
      completion-fg = "#ebdbb2";
      completion-group-bg = "#282828";
      completion-group-fg = "#ebdbb2";
      completion-highlight-bg = "#ebdbb2";
      completion-highlight-fg = "#282828";
      default-bg = "#282828";
      default-fg = "#ebdbb2";
      highlight-color = "#8ec07c";
      inputbar-bg = "#282828";
      inputbar-fg = "#ebdbb2";
      statusbar-bg = "#282828";
      statusbar-fg = "#ebdbb2";
    };
  };
}
