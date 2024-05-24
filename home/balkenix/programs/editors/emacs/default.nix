{pkgs, ...}: {
  programs.emacs = {
    enable = true;
    package = pkgs.emacs-unstable;
    extraConfig = builtins.readFile ./init.el;
    extraPackages = epkgs:
      with epkgs; [
        use-package
        async
        avy
      ];
  };

  services.emacs = {
    enable = true;
    defaultEditor = true;
    startWithUserSession = "graphical";
    client.enable = false;
  };
}
