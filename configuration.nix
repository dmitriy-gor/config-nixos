{ pkgs, modulesPath, ... }: {

  imports = [
    "${ modulesPath }/installer/scan/not-detected.nix"
    ./boot.nix
    ./environment.nix
    ./fileSystems.nix
    ./hardware.nix
    ./programs.nix
    ./services.nix
    ./nixpkgs.nix
  ];

  powerManagement.cpuFreqGovernor = "performance";

  networking = { hostName = "dg-pc"; networkmanager.enable = true; };
  security.rtkit.enable = true;
  sound.enable = true;
  swapDevices = [{ device = "/dev/nvme0n1p2"; }];
  system.stateVersion = "nixos-24.05";
  systemd.tmpfiles.rules = [ "L+ /run/gdm/.config/monitors.xml - - - - ${ pkgs.writeText "monitors.xml" (builtins.readFile ./monitors.xml)}" ];
  time.timeZone = "Europe/Kyiv";
  users.users.dg = { isNormalUser = true; extraGroups = [ "audio" "networkmanager" "wheel" ]; };
}
