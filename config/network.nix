{config, ...}: {
  # Enable ssh on boot
  boot.initrd.network.ssh.enable = true;

  # Authorize keys for user
  users.users.zoe.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOyXLtQgXfkilT9AjSjqFa8CV2maM67rkisubJX8pYFY"
  ];

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
