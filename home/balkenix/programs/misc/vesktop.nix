{ inputs, ... }:
{
  imports = [ inputs.self.homeManagerModules.vesktop ];

  programs.vesktop = {
    enable = true;
    settings = {
      discordBranch = "stable";
    };
  };

  stylix.targets.vesktop.enable = true;
}
