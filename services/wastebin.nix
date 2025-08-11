{config, ...}: {
  services.wastebin = {
    enable = true;
    stateDir = "/srv/wastebin";
    secretFile = "/run/secrets/wastebin/wastebin.env";
    settings = {
      WASTEBIN_TITLE = "zoe's endless wasteland";
      WASTEBIN_BASE_URL = "https://waste.zowhere.net";
      WASTEBIN_DATABASE_PATH = "/var/lib/wastebin/sqlite3.db";
    };
  };
}
