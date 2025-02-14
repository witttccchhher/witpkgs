{
  lib,
  fetchurl,
  appimageTools,
  ...
}:

appimageTools.wrapType2 {
  pname = "minbrowser";
  version = "1.34.0";

  src = fetchurl {
    url = "https://github.com/witttccchhher/witpkgs/releases/download/0.1/Min-1.34.0.AppImage";
    hash = "sha256-AgTqA/g+LP1q82Eo0X2jBjHgV4ZWD+uSDtW8VldqCCc=";
  };

  meta = {
    description = "A fast, minimal browser that protects your privacy";
    homepage = "https://github.com/minbrowser/min";
    license = lib.licenses.asl20;
    maintainers = with lib.maintainers; [ "witttccchhher" ];
    mainProgram = "minbrowser";
    platforms = lib.platforms.all;
  };
}
