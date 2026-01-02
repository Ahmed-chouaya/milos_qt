{ pkgs ? import <nixpkgs> { } }:

pkgs.stdenv.mkDerivation {
  pname = "milos-qt";
  version = "0.1.0";
  src = ./.;
  buildInputs = with pkgs.qt6; [
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
}
