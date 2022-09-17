{ config, pkgs, lib, ... }:

{
  programs.kitty = {
    enable = true;
    extraConfig =
    "
      #: Fonts {{{
       font_family      FiraCode Nerd Font
       bold_font        auto
       italic_font      auto
       bold_italic_font auto

       font_size 12
       force_ltr yes
       adjust_line_height  0
       adjust_column_width 0
       disable_ligatures never
      #: }}}

      #: Cursor customization {{{
       cursor #dc3232
      #: Default cursor color
       cursor_text_color #FFFFFF
       cursor_shape beam
      #: }}}

      #: Scrollback {{{
       scrollback_lines 2000
       wheel_scroll_multiplier 5.0
       touch_scroll_multiplier 1.0
      #: }}}

      #: Mouse {{{
       mouse_hide_wait 0.0
       url_color #0087bd
       url_style curly
       open_url_with default
       focus_follows_mouse yes
      #: }}}

      # Window settings
      #: Window layout {{{
       map alt+1 first_window
       map alt+2 second_window
       map alt+3 third_window
       map alt+tab next_window
       map alt+shift+tab previous_window
       window_border_width 0
       draw_minimal_borders no
       window_padding_width 30
       placement_strategy center
       active_border_color #00ff00
       inactive_border_color #cccccc
       hide_window_decorations yes
      #: }}}

      #Tab bar settings
      #: Tab bar {{{
       tab_bar_edge bottom
       tab_bar_margin_width 0.0
       tab_bar_style powerline
      #: }}}

      #Color Settings (Gruvbox)
      #: Color scheme {{{
       background_opacity 0.9
       dynamic_background_opacity no

       background #1E1E1E
       foreground #ebdbb2

       selection_background #d4be98
       selection_foreground #1d2021

       cursor #a89985
       cursor_text_color background

       active_tab_background #0E0E10
       active_tab_foreground #d4be98
       active_tab_font_style bold
       inactive_tab_background #1d2021
       inactive_tab_foreground #a89984
       inactive_tab_font_style normal

       color0 #665c54
       color8 #928374
       color1 #ea6962
       color9 #ea6962
       color2 #a9b665
       color10 #a9b665
       color3 #e78a4e
       color11 #d8a657
       color4 #7daea3
       color12 #7daea3
       color5 #d3869b
       color13 #d3869b
       color6 #89b482
       color14 #89b482
       color7 #d4be98
       color15 #d4be98

      #: }}}

      #Clipboard Settings
      #: Clipboard {{{
       map cmd+c        copy_to_clipboard
      #: }}}

      # Resizing fonts
      #: Font sizes {{{
       map cmd+plus            change_font_size all +2.0
       map cmd+minus           change_font_size all -2.0
      #: }}}

      #: Terminal bell {{{
       enable_audio_bell no
       window_alert_on_bell no
      #: }}}

      #for opening preview in nnn
      allow_remote_control yes

      # 0 disables it; -1 enables it
      confirm_os_window_close 0
    ";
  };
}
