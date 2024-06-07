_: {
  services.dunst = {
    enable = true;
    settings = {
      global = {
        width = 400;
        height = 250;
        offset = [ "10" "42" ];
      };
    };
  };

  stylix.targets.dunst.enable = true;
}
