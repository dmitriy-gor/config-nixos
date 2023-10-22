{ ... }: {
  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/3edb64fe-6de3-43ff-b951-f1c443f3ed2d";
      fsType = "btrfs";
      options = [ "subvol=@" ];
    };

    "/boot" = {
      device = "/dev/disk/by-uuid/23E0-BD6F";
      fsType = "vfat";
    };
  };
}
