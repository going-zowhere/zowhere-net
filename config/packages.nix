{
  config,
  lib,
  pkgs,
  ...
}: {
  # Enable non-free packages and addl overlays
  nixpkgs.config.allowUnfree = true;

  # Install packages
  environment.systemPackages = with pkgs; [
    # General tools
    helix
    bat
    pciutils
    gitFull
    yazi
    bottom
  ];

  # TODO Configure git
  programs.git = {
    enable = true;
    package = pkgs.gitFull;
  };

  # Enable and configure `nh` helper
  programs.nh = {
    enable = true;
    flake = "github:going-zowhere/zowhere-net#zowhere-mini";
    clean = {
      enable = true;
      extraArgs = "--keep 10";
    };
  };
}
