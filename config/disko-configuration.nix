{
  disko.devices = {
    disk = {
      main = {
        type = "disk";
        device = "/dev/disk/by-diskseq/1"; # FIXME
        content = {
          type = "gpt";
          partitions = {
            # UEFI partition
            ESP = {
              priority = 1;
              name = "ESP";
              start = "1M";
              end = "128M";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = ["umask=0077"];
              };
            };

            # Swap partition
            swap = {
              size = "16G";
              content = {
                type = "swap";
                discardPolicy = "both";
                resumeDevice = true;
              };
            };

            # Root partition
            root = {
              size = "100%";
              content = {
                type = "btrfs";
                extraArgs = ["-f"];
                subvolumes = {
                  # Root
                  "/root" = {
                    mountpoint = "/";
                  };

                  # Home + user home
                  "/home" = {
                    mountOptions = ["compress=zstd"];
                    mountpoint = "/home";
                  };
                  "/home/zoe" = {};

                  # Nix store
                  "/nix" = {
                    mountOptions = [
                      "compress=zstd"
                      "noatime"
                    ];
                    mountpoint = "/nix";
                  };

                  # Server stuff
                  "/srv" = {
                    mountOptions = ["compress=zstd"];
                    mountpoint = "/srv";
                  };
                  "/srv/copyparty" = {};
                  "/srv/uploads" = {};
                  "/srv/softserve" = {};
                  "/srv/wastebin" = {};
                  "/srv/website" = {};
                };
              };
            };
          };
        };
      };
    };
  };
}
