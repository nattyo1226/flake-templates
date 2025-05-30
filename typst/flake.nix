{
    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
        flake-parts.url = "github:hercules-ci/flake-parts";
    };

    outputs = inputs@{
        nixpkgs,
        flake-parts,
        ...
    }: flake-parts.lib.mkFlake { inherit inputs; } {
        systems = nixpkgs.lib.platforms.all;
        perSystem = { pkgs, ... }: let
            fonts = with pkgs; [
                source-han-serif
                plemoljp
            ];
        in {
            devShells.default = pkgs.mkShell {
                packages = with pkgs; [
                    typst
                ];

                TYPST_FONT_PATHS = builtins.concatStringsSep ":" fonts;
            };
        };
    };
}
