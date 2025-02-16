{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs =
    inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      systems = inputs.nixpkgs.lib.systems.flakeExposed;
      perSystem =
        { pkgs, lib, ... }:
        let
          mkPackage =
            packageList: lib.genAttrs packageList (packageName: pkgs.callPackage ./pkgs/${packageName} { });
          packagesList = [
            # "anicli-ru" (Broken)
            "canvas"
            "distrohoop"
            "minbrowser"
            "goto"
          ];
        in
        {
          packages = mkPackage packagesList;
          formatter = pkgs.nixfmt-rfc-style;
        };
    };
}
