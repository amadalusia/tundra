{ inputs, pkgs, ... }:
{
  imports = [ inputs.self.homeManagerModules.armcord ];

  # needs agenix
  programs.armcord = {
    enable = true;
    settings = {
      windowStyle = "default";
      channel = "stable";
      armcordCSP = true;
      minimizeToTray = true;
      keybinds = [ ];
      multiInstance = false;
      spellcheck = true;
      performanceMode = "none";
      skipSplash = false;
      inviteWebsocket = true;
      startMinimized = false;
      dynamicIcon = false;
      mods = "shelter";
      tray = false;
      customJsBundle = "https://armcord.app/placeholder.js";
      customCssBundle = "https://armcord.app/placeholder.css";
      disableAutogain = false;
      useLegacyCapturer = false;
      mobileMode = false;
      trayIcon = "default";
      doneSetup = true;
      clientName = "ArmCord";
      customIcon = "${pkgs.armcord}/opt/ArmCord/resources/app.asar/assets/desktop.png";
    };
    shelter = {
      enable = true;
    };
  };
}
