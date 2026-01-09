{
    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs?ref=nixpkgs-25.11";
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
            overlays = [ rust-overlay.overlays.default ];
            pkgs = import nixpkgs {
                inherit system overlays;
            };
            rustToolchain = pkgs.rust-bin.fromRustupToolchain {
                channel = "stable";
                components = [
                    "clippy"
                    "rustfmt"
                    "rust-src"
                ];
                # targets = [];
            };
        in {
            devShells.default = pkgs.mkShell {
                buildInputs = [
                    rustToolchain
                ];
            };
        };
    };
}
