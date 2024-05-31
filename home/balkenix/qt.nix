{config, pkgs, ...}: let
  catppuccin-kvantum = pkgs.catppuccin-kvantum.override {
    variant = "Macchiato";
    accent = "Mauve";
  };
in {
  qt = {
    enable = true;
    style = {
      name = "Kvantum";
    };
  };

  xdg.configFile = {
    "Kvantum/Catppuccin-Macchiato-Mauve".source = "${catppuccin-kvantum}/share/Kvantum/Catppuccin-Macchiato-Mauve";
    "Kvantum/kvantum.kvconfig".text = ''
      [General]
      theme=Catppuccin-Macchiato-Mauve
    '';
  };
}
