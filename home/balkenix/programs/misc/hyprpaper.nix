{
  pkgs,
  config,
  nix-colors,
  ...
}:
let
  nix-colors-lib = nix-colors.lib.contrib { inherit pkgs; };
  wallpaper = nix-colors-lib.nixWallpaperFromScheme {
    scheme = config.colorScheme;
    logoScale = 4;
    width = 1920;
    height = 1080;
  };
in
{
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [ "${wallpaper}" ];
      wallpaper = [ "eDP-1,${wallpaper}" ];
    };
  };
}
