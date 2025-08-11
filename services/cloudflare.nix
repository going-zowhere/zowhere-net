{config, ...}: {
  services.cloudflared = {
    enable = true;

    # obtained via 'cloudflared login'
    certificateFile = "${config.age.secrets.cloud.file}";

    # PLACEHOLDER remove prior to install and configure
    # see https://wiki.nixos.org/wiki/Cloudflared
    tunnels = {
      "00000000-0000-0000-0000-000000000000" = {
        credentialsFile = "${config.age.secrets.tunnel.file}";
        default = "http_status:404";
      };
    };
  };
}
