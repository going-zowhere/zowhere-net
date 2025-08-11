{config, ...}: {
  # TODO Configure and generate
  services.static-web-server = {
    enable = true;
    root = /srv/website;
    configuration = {
      general = {
        page404 = "./content/404.html";
        page50x = "./content/50x.html";
      };
    };
  };
}
