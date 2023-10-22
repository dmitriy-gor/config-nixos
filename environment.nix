{ pkgs, ... }: {
  environment = {
    localBinInPath = true;
    systemPackages = with pkgs; [
      git
      nil
      gcc
      nixpkgs-fmt
      gnomeExtensions.appindicator
      gnome.gnome-tweaks
      rustup
      taplo
      nodejs_20
      vscode-fhs
      brave
      telegram-desktop
      transmission-gtk
      vlc
      jetbrains-toolbox
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
