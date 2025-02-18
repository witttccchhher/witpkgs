{
  lib,
  fetchPypi,
  fetchFromGitHub,
  python3Packages,
  python3,
  ...
}:
python3Packages.buildPythonApplication rec {
  pname = "anicli_api";
  version = "0.7.3";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-eFAVr43lE+c7hFIyyKcq4W8MmzkPHdZ1z4fiYQxaHY8=";
  };

  build-system = with python3Packages; [
    poetry-core
  ];

  dependencies = with python3Packages; let
    httpx = python3Packages.httpx.overrideAttrs {
      version = "0.27.2";
      src = fetchFromGitHub {
        owner = "encode";
        repo = "httpx";
        tag = version;
        hash = "sha256-N0ztVA/KMui9kKIovmOfNTwwrdvSimmNkSvvC+3gpck=";
      };
    };
  in [
    (python3.withPackages (ps: [
      httpx
      h2
      socksio
    ]))
    attrs
    parsel
    tqdm
  ];
  dontCheckRuntimeDeps = true;

  meta = with lib; {
    description = "anicli-api";
    homepage = "https://github.com/vypivshiy/anicli-api";
    maintainers = with maintainers; [ DADA30000 ];
    mainProgram = "anicli-api";
    platforms = platforms.unix;
  };
}
