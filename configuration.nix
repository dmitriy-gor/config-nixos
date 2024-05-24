{ pkgs, modulesPath, ... }: {
  
  imports = [
    "${ modulesPath }/installer/scan/not-detected.nix"
    ./boot.nix
    ./environment.nix
    ./fileSystems.nix
    ./hardware.nix
    ./programs.nix
    ./services.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  networking = { hostName = "dg-pc"; networkmanager.enable = true; };
  nixpkgs = { config.allowUnfree = true; hostPlatform = "x86_64-linux"; };
  security.rtkit.enable = true;
  sound.enable = true;
  swapDevices = [{ device = "/dev/nvme0n1p2"; }];
  system.stateVersion = "nixos-unstable";
  systemd.tmpfiles.rules = [ "L+ /run/gdm/.config/monitors.xml - - - - ${ pkgs.writeText "monitors.xml" (builtins.readFile ./monitors.xml)}" ];
  time.timeZone = "Europe/Kyiv";
  users.users.dg = { isNormalUser = true; extraGroups = [ "networkmanager" "wheel" ]; };
}
