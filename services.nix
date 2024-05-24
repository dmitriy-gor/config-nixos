{ pkgs, ... }: {
  services = {
    
    displayManager = {
      autoLogin = {
        enable = false;
        user = "dg";
      };
    };
    xserver = {
      enable = true;
      xkb = {
        layout = "us";
        variant = "";
      };
      displayManager = {
        gdm.enable = true;
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
