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
        ];
      };
    };
  };
}
