{
  lib,
  pkgs,
  fetchFromGitHub,
  appimageTools,
  ...
}:

let
  source = fetchFromGitHub {
    owner = "minbrowser";
    repo = "min";
    rev = "9d7e4ec16d5a9b0991e2c00a9e14e33d07461e83";
    hash = "sha256-5aOwNONWT4uX75+zLqCEyTY4lRfS6wGIC66ozzrvLl0=";
  };

  file = pkgs.runCommand "appimage-gen" { } ''
    cd ${source.out}
    ${pkgs.nodejs}/bin/npm run buildAppImage
    mv ./dist/app/Min-1.34.0.AppImage $out
  '';
in appimageTools.wrapType2 {
  pname = "minbrowser";
  version = "1.34.0";

  src = file;

  meta = {
    description = "A fast, minimal browser that protects your privacy";
    homepage = "https://github.com/minbrowser/min";
    license = lib.licenses.asl20;
    maintainers = with lib.maintainers; [ "witttccchhher" ];
    mainProgram = "minbrowser";
    platforms = lib.platforms.all;
  };
}
