{config, ...}: {
  services.soft-serve = {
    enable = true;
    settings = {
      name = "zoe's ice cream shoppe";
      log_format = "txt";
      data_path = "/srv/softserve";
      initial_admin_keys = ""; # TODO load as env secret file?
      stats.listen_addr = ":23233";

      # SSH config
      ssh = {
        listen_addr = ":23231";
        public_url = "ssh://git.zowhere.net";
        key_path = "";
        client_key_path = "";
        max_timeout = 0;
        idle_timeout = 120;
      };

      # Git daemon config
      git = {
        listen_addr = ":9418";
        max_timeout = 0;
        idle_timeout = 3;
        max_connections = 32;
      };

      # HTTP server config
      http = {
        listen_addr = ":23232";
        public_url = "http://git.zowhere.net";
      };
    };
  };
}
