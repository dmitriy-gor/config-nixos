{ pkgs, lib, modulesPath, ... }: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    ./hardware.nix
    ./fileSystems.nix
    ./boot.nix
    ./services.nix
    ./environment.nix
    ./programs.nix
  ];

  system.stateVersion = "unstable";

  swapDevices = [ ];
  sound.enable = true;

  systemd = {
    services = {
      "getty@tty1".enable = false;
      "autovt@tty1".enable = false;
    };
    tmpfiles.rules = [
      "L+ /run/gdm/.config/monitors.xml - - - - ${ 
      pkgs.writeText "monitors.xml" (builtins.readFile /etc/nixos/monitors.xml)
    }"
    ];
  };

  nixpkgs = {
    config.allowUnfree = true;
    hostPlatform = lib.mkDefault "x86_64-linux";
  };
  
  networking = {
    hostName = "dg-pc";
    networkmanager.enable = true;
    useDHCP = lib.mkDefault true;
  };

  time.timeZone = "Europe/Kyiv";
  i18n.defaultLocale = "en_US.UTF-8";

  security.rtkit.enable = true;

  users.users.dg = {
    isNormalUser = true;
    description = "dg";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  powerManagement.cpuFreqGovernor = lib.mkDefault "perfomance";
}
