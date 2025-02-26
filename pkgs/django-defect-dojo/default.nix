{
  lib,
  pkgs,
  fetchFromGitHub,
  python3Packages,
  ...
}:

python3Packages.buildPythonApplication rec {
  pname = "django-defect-dojo";
  version = "2.43.3";
  pyproject = false;

  src = fetchFromGitHub {
    owner = "DefectDojo";
    repo = "django-DefectDojo";
    rev = version;
    hash = "sha256-HaZc3/EVjDqYCZLJnMG01OLRI2LhardiNiLt9uxyqnY=";
    fetchSubmodules = true;
  };

  build-system = with python3Packages; [
    setuptools
  ];

  dependencies = with python3Packages; [
    asteval
    bleach
    celery
    defusedxml
    django-celery-results
    django-auditlog
    # django-dbbackup
    django-environ
    django-filter
    # django-imagekit
    django-multiselectfield
    django-polymorphic
    django-crispy-forms
    django-extensions
    # django-slack
    django-tagging
    # django-watson
    django-prometheus
    django
    djangorestframework
    html2text
    humanize
    jira
    pygithub
    lxml
    markdown
    openpyxl
    pillow
    psycopg-c
    cryptography
    python-dateutil
    pytz
    redis
    requests
    sqlalchemy
    urllib3
    pkgs.uwsgi
    vobject
    whitenoise
    titlecase
    social-auth-app-django
    social-auth-core
    gitpython
    python-gitlab
    cpe
    packageurl-python
    # django-crum
    jsonformatter
    django-split-settings
    django-debug-toolbar
    # django-debug-toolbar-request-history
    vcrpy
    # vcrpy-unittest
    # django-tagulous
    pyjwt
    cvss
    # django-fieldsignals
    hyperlink
    # django-test-migrations
    djangosaml2
    drf-spectacular
    drf-spectacular-sidecar
    django-ratelimit
    argon2-cffi
    # blackduck
    pycurl
    boto3
    netaddr
    # vulners
    fontawesomefree
    pyyaml
    pyopenssl
  ];

  meta = {
    description = "DevSecOps, ASPM, Vulnerability Management. All on one platform";
    homepage = "https://github.com/DefectDojo/django-DefectDojo";
    license = lib.licenses.bsd3;
    maintainers = with lib.maintainers; [ ];
    mainProgram = "django-defect-dojo";
    platforms = lib.platforms.all;
  };
}
