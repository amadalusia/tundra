{ inputs, ... }:
{
  imports = [ inputs.self.homeManagerModules.vesktop ];

  programs.armcord.enable = true;
}
