{ config, pkgs, lib, ... }:

{
  programs.htop = {
    enable = true;
    settings = {
      enable_mouse = true;
      color_scheme = 6;
      detailed_cpu_time = true;
      header_margin = true;
      highlight_megabytes = true;
      show_cpu_frequency = true;
      show_cpu_usage = true;
      show_thread_names = true;
      sort_descending = true;
      tree_view = true;
      update_process_names = true;
      hide_userland_threads = true;
      vim_mode = true;
    };
  };
}
