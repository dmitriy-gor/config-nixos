{ ... }: {
  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/bd19c09d-f919-4f29-9e76-67aa5649cd83";
      fsType = "btrfs";
      options = [ "subvol=@" ];
    };

    "/boot" = {
      device = "/dev/disk/by-uuid/42B2-2703";
      fsType = "vfat";
    };
  };
}
