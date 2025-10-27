{ lib, buildPythonPackage, fetchPypi, poetry-core, httpx }:

buildPythonPackage rec {
  pname = "hping";
  version = "0.7.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-Ywqb33BhqrVsRg/OIa8UXD9QaAymzYHDQbLybIOxQEI=";
  };

  build-system = [ poetry-core ];

  dependencies = [ httpx ];

  doCheck = false;

  meta = with lib; {
    homepage = "https://github.com/lukas-holzner/hping";
    description = "`htping` is a command-line tool that works like `ping`, but instead of sending ICMP packets, it repeatedly makes HTTP GET requests to check if a website is available.";
    maintainers = with maintainers; [ lukas-holzner ];
  };
}