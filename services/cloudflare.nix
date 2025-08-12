{config, ...}: {
  services.cloudflared = {
    enable = true;

    # Account cert.pem file via agenix
    certificateFile = config.age.secrets.cloud.path;

    # Configure main tunnel setup
    # FIXME disabled until config(s) are stable
    tunnels = {
      "985d435b-8a3b-46eb-a8a5-f92f15246e1e" = {
        credentialsFile = config.age.secrets.tunnel.path;
        default = "http_status:404";
        ingress = {
          # Main website
          "zowhere.net" = "http://localhost:8787";

          # Web-based services
          "party.zowhere.net" = "http://localhost:3923";
          #"soft.zowhere.net" = "http://localhost:23232";
          #"waste.zowhere.net" = "http://localhost:8088";

          # SSH-based services
          #"ssh.zowhere.net" = "ssh://localhost:22";
          #"git.zowhere.net" = "ssh://localhost:23231";
        };
      };
    };
  };
}
