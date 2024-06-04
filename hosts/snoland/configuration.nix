# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).
{ config
, lib
, pkgs
, inputs
, ...
}: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
    inputs.disko.nixosModules.disko
    inputs.stylix.nixosModules.stylix
    ./disk-config.nix
    ./certificates.nix
    ./hardware-configuration.nix
  ];

  stylix = {
    autoEnable = false;
    base16Scheme = {
      base00 = "1F1F28";
      base01 = "2A2A37";
      base02 = "223249";
      base03 = "727169";
      base04 = "C8C093";
      base05 = "DCD7BA";
      base06 = "938AA9";
      base07 = "363646";
      base08 = "C34043";
      base09 = "FFA066";
      base0A = "DCA561";
      base0B = "98BB6C";
      base0C = "7FB4CA";
      base0D = "7E9CD8";
      base0E = "957FB8";
      base0F = "D27E99";
    };
    cursor.size = 28;
    image = ../../home/balkenix/wallpapers/cafe.jpg;
    fonts = {
      emoji = {
        name = "Noto Color Emoji";
        package = pkgs.noto-fonts-color-emoji;
      };
      monospace = {
        name = "Maple Mono NF";
        package = pkgs.maple-mono-NF;
      };
      sansSerif = {
        name = "Inter";
        package = pkgs.inter;
      };
      serif = {
        name = "Merriweather";
        package = pkgs.merriweather;
      };
    };
    homeManagerIntegration = {
      autoImport = true;
      followSystem = true;
    };
    targets = {
      console.enable = true;
      grub.enable = true;
    };
    polarity = "dark";
  };

  # enable flakes lmao
  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      substituters = [
        "https://nix-community.cachix.org"
        "https://cache.nixos.org/"
      ];
      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
    };
  };

  # non foss
  nixpkgs.config.allowUnfree = true;

  # overlays
  nixpkgs.overlays = [
    inputs.emacs-overlay.overlays.default
    inputs.norshfetch.overlays.default
    inputs.self.overlays.unstable-packages
    inputs.self.overlays.modifications
    inputs.self.overlays.additions
  ];

  security.polkit.enable = true;
  security.pam.services.swaylock.text = "auth include login";
  systemd.user.services.polkit-kde-authentication-agent-1 = {
    description = "polkit-kde-authentication-agent-1";
    wantedBy = [ "graphical-session.target" ];
    wants = [ "graphical-session.target" ];
    after = [ "graphical-session.target" ];
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.polkit-kde-agent}/libexec/polkit-kde-authentication-agent-1";
      Restart = "on-failure";
      RestartSec = 1;
      TimeoutStopSec = 10;
    };
  };


  # Use the systemd-boot EFI boot loader.
  boot.loader.grub = {
    enable = true;
    efiSupport = true;
    device = "nodev";
  };

  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "snoland"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager = {
    enable = true;
    wifi.backend = "iwd";
  };

  # Set your time zone.
  time.timeZone = "Europe/London";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true; # use xkb.options in tty.
  };

  # enable OpenGL
  hardware.opengl.enable = true;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  # Enable XDG Desktop Portal
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    config = {
      common.default = [ "wlr" "gtk" ];
    };
  };

  # Enable DConf
  programs.dconf.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users = {
    defaultUserShell = pkgs.zsh;

    users.balkenix = {
      useDefaultShell = true;
      isNormalUser = true;
      extraGroups = [ "video" "audio" "wheel" "input" "networkmanager" ];
      packages = with pkgs; [
        firefox
        tree
      ];
    };
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs; };
    backupFileExtension = "backup";
    users.balkenix = import ../../home/balkenix;
  };

  programs.zsh.enable = true;

  environment.systemPackages = with pkgs; [
    git
    vim
    wget
    norshfetch
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Enable the power-profiles-daemon.
  services.power-profiles-daemon.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "23.11"; # Did you read the comment?
}
