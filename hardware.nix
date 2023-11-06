{ config, pkgs, lib, ... }: {
  hardware = {
    pulseaudio.enable = false;
    opengl = {
      enable = true;
      driSupport32Bit = true;
      extraPackages = with pkgs; [
        intel-media-driver
        intel-ocl
        intel-gmmlib
        intel-compute-runtime
        vaapi-intel-hybrid
      ];
    };
    cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  };
}
