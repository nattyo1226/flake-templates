{
    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
        flake-parts.url = "github:hercules-ci/flake-parts";
        rust-overlay.url = "github:oxalica/rust-overlay";
    };

    outputs = inputs@{
        nixpkgs,
        flake-parts,
        rust-overlay,
        ...
    }: flake-parts.lib.mkFlake { inherit inputs; } {
        systems = nixpkgs.lib.platforms.all;
        perSystem = { system, ... }: let
            pkgs = import nixpkgs {
                inherit system;
                overlays = [ rust-overlay.overlays.default ];
            };
        in {
            devShells.default = pkgs.mkShell {
                packages = with pkgs; [
                    rust-bin.stable.latest.default
                ];
            };
        };
    };
}
