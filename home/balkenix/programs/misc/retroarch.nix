{ inputs, pkgs, ... }: {
  imports = [
    inputs.self.homeManagerModules.retroarch
  ];
  
  programs.retroarch = {
    enable = true;
    cores = with pkgs.libretro; [
      mesen
      melonds
    ];
    extraConfig = {
      menu_driver = "rgui";
    };
  };
}
