{ pkgs, ... }:
let
  pkgs-unstable = import <nixpkgs-unstable> {
    config = {
      allowUnfree = true;
    };
    hostPlatform = "x86_64-linux";
  };
in
{
  environment = {
    localBinInPath = true;
    shellInit = "export PKG_CONFIG_PATH=${pkgs.openssl.dev}/lib/pkgconfig;";
    systemPackages = (with pkgs; [
      brave
      cmake
      expat
      fontconfig
      freetype
      gcc
      gnome.gnome-tweaks
      gnomeExtensions.appindicator
      gparted
      helix
      microcodeIntel
      openssl
      openssl.dev
      pkg-config
      steam-run
      telegram-desktop
      transmission-gtk
      vlc
      whatsapp-for-linux
      wl-clipboard
      vscode
      torchlight
      rustrover
      zed
    ]) ++ (with pkgs-unstable;[
      cargo
      rustc
      nixd
      nixpkgs-fmt
      nodePackages_latest.nodejs
    ]);

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
