{config, ...}: {
  # Enable ssh on boot
  boot.initrd.network.ssh.enable = true;

  # FIXME Authorize keys for user
  #users.users.zoe.openssh.authorizedKeys.keys = [];

  # Configure ssh
  services.openssh = {
    enable = true;

    # Basic hardening
    settings = {
      PermitRootLogin = "no";
      KbdInteractiveAuthentication = false;
      PasswordAuthentication = false;
      AllowUsers = ["zoe"];
    };
  };

  # Configure networking
  networking = {
    # System hostname
    hostName = "zowhere";

    # TODO Firewall configs
    firewall.enable = true;

    # Cloudflare DNS
    nameservers = [
      "1.1.1.1"
      "1.0.0.1"
    ];
  };
}
