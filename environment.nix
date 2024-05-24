{ pkgs, inputs, ... }: {

  environment = {
    localBinInPath = true;
    sessionVariables = { NIXOS_OZONE_WL = "1"; };
    shellInit = "export PKG_CONFIG_PATH=${pkgs.openssl.dev}/lib/pkgconfig;";
    systemPackages = with pkgs; [
      alacritty
      appimage-run
      brave
      cargo
      cmake
      expat
      fontconfig
      freetype
      gcc
      gnome.gnome-tweaks
      gnomeExtensions.appindicator
      gparted
      inputs.helix.packages."${pkgs.system}".helix
      microcodeIntel
      neovim
      nixd
      nixpkgs-fmt
      nodejs_22
      openssl
      openssl.dev
      pkg-config
      rustc
      taplo
      telegram-desktop
      transmission-gtk
      vlc
      vscode-fhs
      vscode-langservers-extracted
      whatsapp-for-linux
    ];
    gnome.excludePackages = with pkgs; [
      epiphany
      gnome-text-editor
      gnome-tour
      gnome.geary
      simple-scan
      yelp
    ];
  };
}
