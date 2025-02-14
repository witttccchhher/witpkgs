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
      minbrowser = pkgs.callPackage ./pkgs/minbrowser/default.nix { };
      goto = pkgs.callPackage ./pkgs/goto/default.nix { };
    };

    devShells.${system}.default = pkgs.mkShell {
      name = "witpkgs";
      packages = [
        # self.packages.${system}.anicli-ru
        self.packages.${system}.canvas
        self.packages.${system}.distrohoop
        self.packages.${system}.minbrowser
        self.packages.${system}.goto
      ];
    };

    formatter.${system} = pkgs.nixfmt-rfc-style;
  };
}
