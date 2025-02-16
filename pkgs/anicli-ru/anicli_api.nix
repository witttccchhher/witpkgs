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
  version = "0.6.13";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-pHseojH4KLzC3K8ChotAX3C7ITjlxuOtCvfScAn4Ryw";
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
    # http2 = httpx.optional-dependencies.http2;
    # socks = httpx.optional-dependencies.socks;
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
