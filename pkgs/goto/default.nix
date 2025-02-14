{
  lib,
  buildGoModule,
  fetchFromGitHub,
  ...
}:

buildGoModule rec {
  pname = "goto";
  version = "1.2.0";

  src = fetchFromGitHub {
    owner = "grafviktor";
    repo = "goto";
    rev = "v${version}";
    hash = "sha256-ix85mYDsHubX77AUSYeIqdK+sr9ZNX8wSUsBIjB7RQc=";
  };

  vendorHash = "sha256-NOgG1rvuEZrAMffLBZzj5cROCYTLRvrPF7gRqYUPS5U=";

  ldflags = [ "-s" "-w" ];

  meta = {
    description = "A simple terminal SSH manager that provides you with an easy access to the list of your favorite SSH servers. Binaries included";
    homepage = "https://github.com/grafviktor/goto";
    changelog = "https://github.com/grafviktor/goto/blob/${src.rev}/CHANGELOG.md";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ "witttccchhher" ];
    mainProgram = "goto";
  };
}
