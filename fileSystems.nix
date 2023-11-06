{ ... }: {
  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/49796923-481a-497c-9742-11f73dfd1b41";
      fsType = "btrfs";
      options = [ "subvol=@" ];
    };

    "/boot" = {
      device = "/dev/disk/by-uuid/23E0-BD6F";
      fsType = "vfat";
    };
  };
}
