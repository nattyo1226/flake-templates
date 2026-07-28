{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.11";
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
          fonts = with pkgs; [
            source-han-serif
            plemoljp
          ];
        in
        {
          devShells.default = pkgs.mkShell {
            buildInputs = with pkgs; [
              tinymist
              typst
              typstyle
            ];

            env = {
              TYPST_FONT_PATHS = builtins.concatStringsSep ":" fonts;
            };
          };
        };
    };
}
