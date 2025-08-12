{config, ...}: {
  # TODO Configure and generate
  services.static-web-server = {
    enable = true;
    root = /srv/website;
    configuration = {
      general = {
        maintenance-mode = true;
      };
    };
  };
}
