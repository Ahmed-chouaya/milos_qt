{
  description = "Minimal NixOS Niri Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs = nixpkgs;
    milos-qt.url = "github:Ahmed-chouaya/milos-qt";
    milos-qt.inputs.nixpkgs = nixpkgs;
  };

  outputs = { self, nixpkgs, home-manager, milos-qt }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      nixosConfigurations = {
        niri-host = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./hosts/default.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.ahmed = import ./home/default.nix {
                inherit pkgs;
                milos-qt = milos-qt.packages.${system}.milos-qt;
              };
            }
          ];
        };
      };

      packages.${system} = {
        milos-qt = milos-qt.packages.${system}.milos-qt;
      };

      devShells.${system}.default = pkgs.mkShell {
        buildInputs = with pkgs; [
          niri
          home-manager
        ];
      };
    };
}
