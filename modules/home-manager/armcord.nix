{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.programs.armcord;
  jsonFormat = pkgs.formats.json { };

  inherit (lib)
    mkEnableOption
    mkOption
    literalExpression
    mkIf
    ;
  inherit (lib.types) path listOf str;
in
{
  options.programs.armcord = {
    enable = mkEnableOption "Whether to enable armcord.";

    tokenFile = mkOption {
      type = path;
      default = "/";
      example = literalExpression "config.sops.secrets.discordToken.path";
      description = "The file that contains the desired discord accounts token.";
    };

    settings = mkOption {
      type = jsonFormat.type;
      default = { };
      example = literalExpression ''
        {
            windowStyle = "default";
            channel = "stable";
            armcordCSP = true;
            minimizeToTray = true;
            keybinds = [];
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
            customIcon = "\${pkgs.armcord}/opt/ArmCord/resources/app.asar/assets/desktop.png";
        }
      '';
      description = ''
        Configuration written to
        {file}`$XDG_CONFIG_HOME/ArmCord/storage/settings.json`
      '';
    };

    vencord = {
      enable = mkEnableOption "Whether to enable vencord";
      themes = mkOption {
        type = listOf str;
        default = [ ];
        example = literalExpression ''[ "https://catppuccin.github.io/discord/dist/catppuccin-mocha-pink.theme.css" ]'';
      };
      plugins = mkOption {
        type = listOf str;
        default = [ ];
        example = literalExpression ''[ "https://yellowsink.github.io/shelter-plugins/antitrack/" "https://yellowsink.github.io/shelter-plugins/no-devtools-detect" ]'';
      };
    };
    shelter = {
      enable = mkEnableOption "Whether to enable shelter";
      plugins = mkOption {
        type = listOf str;
        default = [ ];
        example = literalExpression ''[ "https://yellowsink.github.io/shelter-plugins/antitrack/" "https://yellowsink.github.io/shelter-plugins/no-devtools-detect" ]'';
      };
    };
    extraCss = mkOption {
      type = str;
      default = "";
      example = ''@import url("https://catppuccin.github.io/discord/dist/catppuccin-mocha-mauve.theme.css")'';
    };
    extraJs = mkOption {
      type = str;
      default = "";
      example = ''console.log("hello world!");'';
    };
  };

  config = mkIf cfg.enable {
    programs.armcord.settings.mods =
      if cfg.vencord.enable then
        "vencord"
      else if cfg.shelter.enable then
        "shelter"
      else
        "none";

    home.packages =
      let
        tokenOptionalString = ''sed -i "1ilet token = \"$(cat ${cfg.tokenFile})\"" .config/ArmCord/plugins/loader/hm/main.js'';
        armcord-wrapper = pkgs.writeShellScriptBin "armcord" ''
          mkdir -p ${config.xdg.configHome}/ArmCord/plugins/loader/hm
          cp -f ${config.xdg.configHome}/ArmCord_hm/manifest.json ${config.xdg.configHome}/ArmCord/plugins/loader/manifest.json
          cp -f ${config.xdg.configHome}/ArmCord_hm/content.js ${config.xdg.configHome}/ArmCord/plugins/loader/content.js
          cp -f ${config.xdg.configHome}/ArmCord_hm/hm/main.js ${config.xdg.configHome}/ArmCord/plugins/loader/hm/main.js
          cp -f ${config.xdg.configHome}/ArmCord_hm/hm/main.css ${config.xdg.configHome}/ArmCord/plugins/loader/hm/main.css

          ${lib.optionalString (cfg.tokenFile != "/") tokenOptionalString}

          "${pkgs.armcord}/bin/armcord"
        '';
      in
      [
        armcord-wrapper
        (pkgs.makeDesktopItem {
          name = "ArmCord";
          desktopName = "ArmCord";
          exec = "${armcord-wrapper}/bin/armcord";
        })
      ];

    xdg.configFile = {
      "ArmCord/storage/settings.json".source = jsonFormat.generate "armcord-settings" cfg.settings;
      "ArmCord_hm/manifest.json" = {
        text = ''
          {
              "manifest_version": 3,
              "name": "ArmCord Mod Loader",
              "description": "Loads Mods into ArmCord. Managed by the client",
              "version": "1.0.0",
              "author": "Vendicated",
              "homepage_url": "https://github.com/Vendicated/Vencord",

              "host_permissions": [
                  "*://*.discord.com/*",
                  "https://raw.githubusercontent.com/*"
              ],

              "permissions": ["declarativeNetRequest"],

              "content_scripts": [
                  {
                      "run_at": "document_start",
                      "matches": ["*://*.discord.com/*"],
                      "js": ["content.js"]
                  }
              ],

              "web_accessible_resources": [
                  {
                      "resources": ["dist/bundle.js", "hm/main.js", "dist/bundle.css", "hm/main.css"],
                      "matches": ["*://*.discord.com/*"]
                  }
              ],

              "declarative_net_request": {
                  "rule_resources": [
                      {
                          "id": "modifyResponseHeaders",
                          "enabled": true,
                          "path": "modifyResponseHeaders.json"
                      }
                  ]
              }
          }
        '';
      };
      "ArmCord_hm/content.js" = {
        text = ''
          if (typeof browser === "undefined") {
              var browser = chrome;
          }
          try {
          const script = document.createElement("script");
          script.src = browser.runtime.getURL("dist/bundle.js");
          document.documentElement.appendChild(script);
          document.documentElement.append(script);

          const hmScript = document.createElement("script");
          hmScript.src = browser.runtime.getURL("hm/main.js");
          document.documentElement.appendChild(hmScript);
          document.documentElement.append(hmScript);

          const style = document.createElement("link");
          style.type = "text/css";
          style.rel = "stylesheet";
          style.href = browser.runtime.getURL("dist/bundle.css");

          const hmStyle = document.createElement("link");
          hmStyle.type = "text/css";
          hmStyle.rel = "stylesheet";
          hmStyle.href = browser.runtime.getURL("hm/main.css");

          document.addEventListener(
              "DOMContentLoaded",
              () => {
                  document.documentElement.append(style);
                  document.documentElement.append(hmStyle); 
              },
              { once: true }
          );
          } catch(e){console.error(e)}
        '';
      };

      "ArmCord_hm/hm/main.js" = {
        text =
          let
            tokenOptionalString = ''
              function login(token) {
                setTimeout(() => {
                  if (window.location.href === "https://discord.com/login" || token != (webpackChunkdiscord_app.push([[""],{},e=>{m=[];for(let c in e.c)m.push(e.c[c])}]),m).find(m=>m?.exports?.default?.getToken!==void 0).exports.default.getToken()) {
                    setInterval(() => {
                      document.body.appendChild(document.createElement('iframe')).contentWindow.localStorage.token = '"' + token + '"';
                    }, 50);
                    setTimeout(() => {
                      location.reload();
                    }, 2500);
                  }
                }, 1500);
              }

              login(token);
            '';

            shelterOptionalString = ''
              function waitForShelter(callback) {
                  if (typeof shelter !== 'undefined') {
                      callback();
                  } else {
                      setTimeout(function() {
                          waitForShelter(callback);
                      }, 1000);
                  }
              }

              waitForShelter(function() {
              const installedShelterPlugins = shelter.plugins.installedPlugins();
              const loadedShelterPlugins = shelter.plugins.loadedPlugins();

              for (let pluginId in installedShelterPlugins) {
                  if (loadedPlugins && loadedShelterPlugins.hasOwnProperty(pluginId)) {
                      shelter.plugins.stopPlugin(pluginId);
                  }
                  if (installedShelterPlugins && installedPlugins.hasOwnProperty(pluginId)) {
                      shelter.plugins.removePlugin(pluginId);
                  }
              }

              ${generateShelterPlugins cfg.shelter.plugins}
              });
            '';
            generateShelterPlugins =
              urls:
              let
                pluginCode = builtins.concatStringsSep "\n" (
                  builtins.genList (i: ''
                    shelter.plugins.addRemotePlugin("hm_shelterPlugin_${toString (i + 1)}", "${builtins.elemAt urls i}");
                    shelter.plugins.startPlugin(id = "hm_shelterPlugin_${toString (i + 1)}");
                  '') (builtins.length urls)
                );
              in
              pluginCode;

            vencordOptionalString = ''
              function waitForVencord(callback) {
                  if (typeof Vencord !== 'undefined') {
                      callback();
                  } else {
                      setTimeout(function() {
                          waitForVencord(callback);
                      }, 1000);
                  }
              }

              waitForVencord(function() {
              const installedVencordPlugins = Vencord.Api.Settings.SettingsStore.store.plugins;

              for (let plugin in installedVencordPlugins) {
                  installedVencordPlugins[plugin].enabled = false;
              }

              Vencord.Api.Settings.SettingsStore.store.plugins.NoTrack.enabled = true;
              Vencord.Api.Settings.SettingsStore.store.plugins.Settings.enabled = true;
              Vencord.Api.Settings.SettingsStore.store.plugins.SupportHelper.enabled = true;

              ${generateVencordPlugins cfg.vencord.plugins}
              });
            '';
            generateVencordPlugins =
              urls:
              let
                pluginCode = builtins.concatStringsSep "\n" (
                  builtins.genList (i: ''
                    Vencord.Api.Settings.SettingsStore.store.plugins.${builtins.elemAt urls i}.enabled = true;
                  '') (builtins.length urls)
                );
              in
              pluginCode;
          in
          ''
            ${lib.optionalString (cfg.tokenFile != "/") tokenOptionalString}
            ${lib.optionalString (cfg.settings.mods == "shelter") shelterOptionalString}
            ${lib.optionalString (cfg.settings.mods == "vencord") vencordOptionalString}
            ${cfg.extraJs}
          '';
      };
      "ArmCord_hm/hm/main.css".text = ''
        ${cfg.extraCss}
      '';
    };
  };
}
