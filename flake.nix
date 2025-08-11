{
  description = "nix(os) configuration for a lil server and website";

  # Get inputs
  inputs = {
    # Packages
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # Declarative partition setup
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Secrets
    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Simple python file server
    copyparty = {
      url = "github:9001/copyparty";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  # Configure options passed to nix.conf
  nixConfig = {
    # Basic settings
    experimental-features = "nix-command flakes";
    auto-optimise-store = true;

    # Experimental settings
    accept-flake-config = true;

    # Trust users
    trusted-users = [
      "root"
      "zoe"
      "@wheel"
    ];

    # Binary caches
    extra-substituters = ["https://nix-community.cachix.org"];
    extra-trusted-substituters = ["https://nix-community.cachix.org"];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  # Configure outputs
  outputs = {
    self,
    nixpkgs,
    disko,
    agenix,
    copyparty,
    ...
  } @ inputs: {
    # Define NixOS configuration(s)
    nixosConfigurations = {
      # Main configuration
      zowhere = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs;};
        modules = [
          # External modules
          agenix.nixosModules.default
          disko.nixosModules.disko
          copyparty.nixosModules.default

          # Internal modules
          ./config
          ./services
          ./website

          # Ensure core tools/overlays/configs
          ({
            config,
            pkgs,
            ...
          }: {
            # Overlays
            nixpkgs.overlays = [copyparty.overlays.default];

            # Global packages
            environment.systemPackages = [
              agenix.packages.x86_64-linux.default
              pkgs.copyparty
              pkgs.cloudflared
              pkgs.soft-serve
              pkgs.wastebin
            ];

            # User secrets
            age.secrets.user.file = ./secrets/user.age;
            users.users.zoe.hashedPasswordFile = config.age.secrets.user.path;
          })
        ];
      };

      # Slimmed install configs
      zowhere-mini = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs;};
        modules = [
          # External modules
          agenix.nixosModules.default
          disko.nixosModules.disko

          # Internal modules
          ./config

          # Initial user/tool config
          {
            # Global packages
            environment.systemPackages = [agenix.packages.x86_64-linux.default];

            # Initial user password
            user.users.zoe.initialHashedPassword = "$y$j9T$B5fJfnrDZZ9bvZcA/kJ8p/$TgUROKxCvZzBq4YGiojTJiv2LpSUf/1h3D/1k.l46p.";
          }
        ];
      };
    };
  };
}
