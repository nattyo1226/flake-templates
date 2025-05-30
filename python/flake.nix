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
        perSystem = { pkgs, ... }: {
            devShells.default = pkgs.mkShell {
                packages = with pkgs; [
                    python313
                    uv
                ];

                UV_PYTHON_DOWNLOADS = "never";
                UV_PYTHON_EXECUTABLE = "${pkgs.python314}/bin/python3";
            };
        };
    };
}
