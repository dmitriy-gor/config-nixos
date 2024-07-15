{ pkgs, ... }: {
  hardware = {
    pulseaudio = {
      enable = false;
      #support32Bit = true;
    };
    sensor.iio.enable = true;
    opengl = {
      enable = true;
      extraPackages = with pkgs; [
        intel-compute-runtime
        intel-gmmlib
        intel-graphics-compiler
        intel-media-driver
        intel-ocl
        vaapi-intel-hybrid
      ];
    };
    cpu.intel.updateMicrocode = true;
  };
}
