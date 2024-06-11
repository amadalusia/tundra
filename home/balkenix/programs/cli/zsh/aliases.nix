{ pkgs, ... }:
{
  programs.zsh = {
    shellAliases = {
      "rebuild" = "sudo nixos-rebuild switch --flake ~/.config/tundra#snoland";
    };
  };
}
