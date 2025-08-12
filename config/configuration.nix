{
  config,
  pkgs,
  ...
}: {
  # Set the initially-installed version
  system.stateVersion = "25.05";

  # Configure hardware
  hardware = {
    # Enable firmware regardless of license
    enableAllFirmware = true;

    # Enable updating CPU microcode
    enableRedistributableFirmware = true;
  };

  # Configure system services
  services.fwupd.enable = true;

  # Set up bootloader
  boot.loader = {
    efi.canTouchEfiVariables = true;

    systemd-boot = {
      enable = true;
      configurationLimit = 10;
    };
  };

  # Enable and configure `nix` and flakes
  nix = {
    # Configure nix
    settings = {
      # Enable flakes
      experimental-features = "nix-command flakes";

      # Automatically optimise the nix store
      auto-optimise-store = true;

      # Experimental settings
      accept-flake-config = true;

      # Allow admin trusted access
      trusted-users = [
        "root"
        "zoe"
        "@wheel"
      ];

      # Cachix package caches
      extra-substituters = ["https://nix-community.cachix.org"];
      extra-trusted-substituters = ["https://nix-community.cachix.org"];
      extra-trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
    };

    # Enable garbage collection
    gc = {
      automatic = true;
      dates = "weekly";
      persistent = true;
    };
  };

  # Set the system time zone
  time.timeZone = "America/Denver";

  # Select internationalisation options
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };
  };

  # Configure env
  environment = {
    enableAllTerminfo = true;

    # TODO Set global environment variables
    variables = {
      EDITOR = "hx";
    };
  };

  # Tune up bash a little bit
  # TODO add more shell aliases
  programs.bash = {
    blesh.enable = true;
    shellAliases = {
      update = "sudo nixos-rebuild --refresh switch --flake github:going-zowhere/zowhere-net#zowhere-mini";
    };
  };

  # Configure users
  users = {
    mutableUsers = false;
    users.zoe = {
      isNormalUser = true;
      description = "Zoe Lehane";
      extraGroups = ["wheel"];
      initialHashedPassword = "$y$j9T$B5fJfnrDZZ9bvZcA/kJ8p/$TgUROKxCvZzBq4YGiojTJiv2LpSUf/1h3D/1k.l46p.";
    };
  };
}
