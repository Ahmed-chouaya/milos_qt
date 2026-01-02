{
  description = "Milos-QT - Neobrutalist Qt6 Desktop for NixOS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        qt6 = pkgs.qt6;
      in
      {
        packages.milos-qt = pkgs.stdenv.mkDerivation {
          pname = "milos-qt";
          version = "0.1.0";
          src = ./.;
          buildInputs = with qt6; [
            qtbase
            qtdeclarative
            qtwayland
          ];
          nativeBuildInputs = [ pkgs.cmake pkgs.pkg-config ];
          buildPhase = ''
            cmake -B build -DCMAKE_BUILD_TYPE=Release
            cmake --build build
          '';
          installPhase = ''
            install -D build/milos-qt $out/bin/milos-qt
          '';
        };

        devShells.default = pkgs.mkShell {
          buildInputs = with qt6; [
            qtbase
            qtdeclarative
            qtwayland
            qtcreator
          ];
          nativeBuildInputs = [ pkgs.cmake pkgs.pkg-config ];
        };
      }
    );
}
