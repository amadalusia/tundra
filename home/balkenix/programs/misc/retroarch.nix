{ inputs, pkgs, ... }:
{
  imports = [ inputs.self.homeManagerModules.retroarch ];

  programs.retroarch = {
    enable = true;
    cores = with pkgs.libretro; [
      mesen
      melonds
    ];
    extraConfig = {
      menu_driver = "rgui";
      rgui_aspect_ratio = 1;
      rgui_aspect_ratio_lock = 2;
      rgui_background_filler_thickness_enable = true;
      rgui_border_filler_enable = false;
      rgui_border_filler_thickness_enable = true;
      rgui_browser_directory = "default";
      rgui_config_directory = "~/.config/retroarch/config";
      rgui_extended_ascii = true;
      rgui_inline_thumbnails = false;
      rgui_internal_upscale_level = 1;
      rgui_menu_color_theme = 20;
      rgui_menu_theme_preset = "";
      rgui_particle_effect = 1;
      rgui_particle_effect_screensaver = true;
      rgui_particle_effect_speed = 0.8;
      rgui_show_start_screen = false;
      rgui_swap_thumbnails = false;
      rgui_switch_icons = true;
      rgui_thumbnail_delay = 0;
      rgui_thumbnail_downscaler = 0;
    };
  };
}
