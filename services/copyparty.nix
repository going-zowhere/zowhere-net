{config, ...}: {
  # TODO ensure correct/safe, add optional deps
  # also maybe make logues/readmes elsewhere
  services.copyparty = {
    enable = true;

    # Global settings
    settings = {
      name = "party at zowhere";
      usernames = true;
      stats = true;
      xff-hdr = "cf-connecting-ip";
      no-robots = true;
      force-js = true;
      vague-403 = true;
      shr = "/public";
      shr-adm = "zoe";
      e2dsa = true;
      e2ts = true;
      z = true;
    };

    # Create user accounts
    accounts = {
      zoe.passwordFile = config.age.secrets.cpp-zoe.path;
      guest.passwordFile = config.age.secrets.cpp-gue.path;
    };

    # Create volume(s)
    volumes = {
      # Webroot from /srv/copyparty
      "/" = {
        path = "/srv/copyparty/root";
        access = {
          r = "guest";
          A = "zoe";
        };
        flags = {
          fk = 4;
          scan = 60;
        };
      };

      # Unsorted uploads from /srv/uploads
      "/uploads" = {
        path = "/srv/uploads/copyparty";
        access = {
          wG = "*";
          rw = "guest";
          A = ["zoe"];
        };
        flags = {
          fk = 4;
          og = true;
          scan = 60;
          e2d = true;
          d2t = true;
          nohtml = true;
          dthumb = true;
          xdev = true;
          xvol = true;
        };
      };
    };
  };
}
