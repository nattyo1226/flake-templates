{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs =
    inputs@{
      nixpkgs,
      flake-parts,
      ...
    }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = nixpkgs.lib.platforms.all;
      perSystem =
        { pkgs, ... }:
        let
          tex = pkgs.texliveSmall.withPackages (
            ps: with ps; [
              collection-langjapanese
              collection-mathscience
              latexmk
              biblatex
              biber
            ]
          );
        in
        {
          devShells.default = pkgs.mkShell {
            buildInputs = [
              tex
            ];
            env = {
              LATEX_DRIVER = "lualatex";
            };
          };
        };
    };
}
