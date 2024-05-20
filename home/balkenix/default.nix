{pkgs, ...}: {
  imports = [
    ./programs/editors/emacs
  ];

  home.packages = with pkgs; [
    vesktop
  ];

  home.stateVersion = "23.11";
}
