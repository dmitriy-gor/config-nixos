{ ... }: {
  fileSystems = {
    "/" = {
      device = "/dev/nvme0n1p3";
      fsType = "btrfs";
      options = [ "subvol=@" ];
    };

    "/boot" = {
      device = "/dev/nvme0n1p1";
      fsType = "vfat";
    };
  };
}
