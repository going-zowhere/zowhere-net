{config, ...}: {
  # Configure secrets
  age.secrets = {
    # Cloudflare tunnel
    cloud = {
      file = ../secrets/cloud.age;
      path = "/home/zoe/.cloudflared/cert.pem";
    };
    tunnel = {
      file = ../secrets/tunnel.age;
      path = "/home/zoe/.cloudflared/985d435b-8a3b-46eb-a8a5-f92f15246e1e.json";
    };

    # Copyparty user passwords
    cpp-zoe.file = ../secrets/cpp-zoe.age;
    cpp-gue.file = ../secrets/cpp-gue.age;

    # FIXME Disabled for now
    #waste = {
    #  file = ../secrets/waste.age;
    #  path = "/run/secrets/wastebin/wastebin.env";
    #};
  };
}
