{ inputs, ... }:
{
  imports = [ inputs.nixvim.homeManagerModules.nixvim ];

  programs.nixvim = {
    enable = true;
    plugins = {
      telescope = {
        enable = true;
      };
    };
  };

  stylix.targets.nixvim.enable = true;
}
