{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  # Enable non-free packages and addl overlays
  nixpkgs = {
    config.allowUnfree = true;
    overlays = [inputs.copyparty.overlays.default];
  };

  # Install packages
  # TODO add server stuff
  environment.systemPackages = with pkgs; [
    # General tools
    helix
    bat
    pciutils
    gitFull
    yazi
    bottom

    # Server packages
    inputs.agenix.packages.x86_64-linux.default
    pkgs.copyparty
    pkgs.cloudflared
    pkgs.soft-serve
    pkgs.wastebin
  ];

  # TODO Configure git
  programs.git = {
    enable = true;
    package = pkgs.gitFull;
  };
}
