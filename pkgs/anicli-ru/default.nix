{
  lib,
  pkgs,
  fetchPypi,
  python3Packages,
  ...
}:
python3Packages.buildPythonApplication rec {
  pname = "anicli-ru";
  version = "5.0.14";
  pyproject = true;

  src = fetchPypi {
    pname = "anicli_ru";
    inherit version;
    hash = "sha256-P4dJL9V1uihNsF9mqjay3PbncjnBuKbmPhufDv5l7Uk=";
  };

  build-system = with python3Packages; [
    hatchling
    setuptools
  ];

  dependencies = [
    python3Packages.setuptools
    (pkgs.callPackage ./eggella.nix { })
    (pkgs.callPackage ./anicli_api.nix { })
  ];

  meta = with lib; {
    description = "Script to watch anime from terminal with russian translation, written in python.";
    homepage = "https://github.com/vypivshiy/ani-cli-ru";
    license = with licenses; [ gpl3Plus ];
    maintainers = with maintainers; [ DADA30000 ];
    mainProgram = "anicli-ru";
    platforms = platforms.unix;
  };
}
