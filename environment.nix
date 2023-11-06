{ pkgs, ... }: {
  environment = {
    localBinInPath = true;
    homeBinInPath = true;
    #shells = with pkgs; [ zsh ];
    systemPackages = with pkgs; [
      git
      gcc
      nixpkgs-fmt
      nil
      rustup
      nodejs_21
      vscode-langservers-extracted
      vscode-fhs
      neovim
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
