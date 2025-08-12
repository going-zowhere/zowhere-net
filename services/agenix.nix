{config, ...}: {
  # Configure secrets
  age.secrets = {
    cloud = {
      file = ../secrets/cloud.age;
      path = "/home/zoe/.cloudflared/cert.pem";
    };
    tunnel = {
      file = ../secrets/tunnel.age;
      path = "/home/zoe/.cloudflared/985d435b-8a3b-46eb-a8a5-f92f15246e1e.json";
    };
    cpp-zoe = {
      file = ../secrets/cpp-zoe.age;
      path = "/run/secrets/copyparty/zo_password";
    };
    cpp-gue = {
      file = ../secrets/cpp-gue.age;
      path = "/run/secrets/copyparty/gu_password";
    };
    softsrv = {
      file = ../secrets/softsrv.age;
      path = "/run/secrets/soft-serve/secrets.env";
    };
    waste = {
      file = ../secrets/waste.age;
      path = "/run/secrets/wastebin/wastebin.env";
    };
  };
}
