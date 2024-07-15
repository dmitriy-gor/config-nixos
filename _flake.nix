{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    #helix.url = "github:helix-editor/helix/master";
  };

  outputs = inputs@ { ... }: {    
    nixosConfigurations.dg-pc = inputs.nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        ./configuration.nix
      ];
    };
  };
}
