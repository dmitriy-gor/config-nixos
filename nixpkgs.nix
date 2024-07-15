{ ... }: {
  nixpkgs = {
    config = {
      allowUnfree = true;
      packageOverrides = pkgs: {
        vscode-fhs = ((pkgs.vscode-fhs.override { }).overrideAttrs {
          src = (builtins.fetchTarball "https://code.visualstudio.com/sha/download?build=stable&os=linux-x64");
          version = "latest";
        });
        torchlight = (pkgs.writeShellScriptBin "torchlight" ''
          steam-run /home/dg/GOG\ Games/Torchlight\ 2/game/Torchlight2.bin.x86_64
        '');
        rustrover = (pkgs.writeShellScriptBin "rustrover" ''
          steam-run /home/dg/.local/rustrover/bin/rustrover.sh
        '');
        zed = (pkgs.writeShellScriptBin "zed" ''
          steam-run /home/dg/.local/zed/bin/zed
        '');
      };
    };
    hostPlatform = "x86_64-linux";
  };
}
