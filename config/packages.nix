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
    git
    yazi
    bottom
  ];
}
