{config, ...}: {
  # Configure secrets
  age.secrets = {
    cloud.file = ../secrets/cloud.age;
    tunnel.file = ../secrets/tunnel.age;
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
