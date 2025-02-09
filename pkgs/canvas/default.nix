{
  lib,
  fetchFromGitHub,
  pkgs,
  ...
}:
pkgs.stdenv.mkDerivation rec {
  pname = "canvas";
  version = "unstable-2023-08-22";

  src = fetchFromGitHub {
    owner = "adi1090x";
    repo = "${pname}";
    rev = "b4b1e3456d86db98052bd7735ae3c0a8799b1061";
    hash = "sha256-yyZjwU3n1UJfVQ05if3oKBNKfjURmvfHFe2zC91Zu8g=";
  };

  phases = [ "installPhase" ];
  nativeBuildInputs = [ pkgs.makeWrapper ];
  installPhase = ''
    mkdir -p $out/bin
    cp $src/canvas $out/bin
    chmod +x $out/bin/canvas
    wrapProgram $out/bin/canvas \
      --prefix PATH : ${
        with pkgs;
        lib.makeBinPath [
          imagemagick
          feh
          xcolor
          xorg.xrandr
        ]
      }
  '';

  meta = with lib; {
    description = "A Gradient / Blured Wallpaper Generator And Setter";
    homepage = "https://github.com/adi1090x/canvas";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [ "witttccchhher" ];
    mainProgram = "canvas";
    platforms = platforms.all;
  };
}
