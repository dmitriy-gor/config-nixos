{ pkgs, ... }: {
  services = {
    xserver = {
      enable = true;
      layout = "us";
      xkbVariant = "";
      displayManager = {
        gdm.enable = true;
        autoLogin = {
          enable = true;
          user = "dg";
        };
      };
      desktopManager = {
        xterm.enable = false;
        gnome.enable = true;
      };
      excludePackages = [
        pkgs.xterm
      ];
    };
    udev.packages = with pkgs; [
      gnome.gnome-settings-daemon
    ];
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };
}
