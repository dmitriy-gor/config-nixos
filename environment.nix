{ config, pkgs, ... }: {
    
  environment = {
    shellInit = "export PKG_CONFIG_PATH=${pkgs.openssl.dev}/lib/pkgconfig;";
    localBinInPath = true;
    homeBinInPath = true;
    #shells = with pkgs; [ zsh ];
    systemPackages = with pkgs; [
      git
      gcc
      openssl
      openssl.dev
      pkg-config
      nixpkgs-fmt
      nixd
      rustc
      cargo
      nodejs_21
      vscode-langservers-extracted
      vscode-fhs
      #taplo
      #helix
      #
      gnomeExtensions.appindicator
      gnome.gnome-tweaks
      #
      brave
      telegram-desktop
      transmission-gtk
      vlc
      #
      intel-media-driver
      intel-ocl
      intel-gmmlib
      intel-compute-runtime
      intel-graphics-compiler
      vaapi-intel-hybrid
      microcodeIntel
      throttled
      #
      steam-run
      lutris
      wine-wayland
    ];
    gnome.excludePackages = (with pkgs; [
      gnome-tour
    ]) ++ (with pkgs.gnome; [
      yelp
      geary
      epiphany
      simple-scan
    ]);
  };
}
