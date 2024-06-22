{ inputs, ... }:
{
  imports = [ inputs.self.homeManagerModules.armcord ];

  # needs agenix
  programs.armcord.enable = true;
}
