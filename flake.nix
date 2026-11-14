{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs =
    inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } (
      { self, config, ... }:
      {
        systems = [
          # systems for which you want to build the `perSystem` attributes
          "x86_64-linux"
        ];

        perSystem =
          {
            system,
            pkgs,
            ...
          }:
          {
            devShells.default = pkgs.mkShell {
              packages = with pkgs; [
                godot
              ];
            };
          };
      }
    );
}
