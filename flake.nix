{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    packages.${system} = {
      # anicli-ru = pkgs.callPackage ./pkgs/anicli-ru { };
      canvas = pkgs.callPackage ./pkgs/canvas { };
      distrohoop = pkgs.callPackage ./pkgs/distrohoop { };
    };

    devShells.${system}.default = pkgs.mkShell {
      name = "witpkgs";
      packages = [
        # self.packages.${system}.anicli-ru
        self.packages.${system}.canvas
        self.packages.${system}.distrohoop
      ];
    };

    formatter.${system} = pkgs.nixfmt-rfc-style;
  };
}
