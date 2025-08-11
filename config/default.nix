{config, ...}: {
  imports = [
    ./configuration.nix
    ./disko-configuration.nix
    ./hardware-configuration.nix
    ./network.nix
    ./packages.nix
  ];
}
