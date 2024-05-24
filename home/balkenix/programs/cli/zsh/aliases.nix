{pkgs, ...}: {
  programs.zsh = {
    aliases = {
      "rebuild" = "sudo nixos-rebuild switch --flake ~/.config/tundra#snoland";
    };
    initExtra = builtins.readFile functions.zsh;
  };
}