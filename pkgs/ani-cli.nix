{ pkgs, ... }:

{
  home.packages = [
    (pkgs.fetchFromGitHub {
      owner = "pystardust";
      repo = "ani-cli";
      rev = "v3.2";
      sha256 = "sha256-LSyqcJX+bPW/qtO3FaZh9RaXW2xeGc/9tdC2CmhDwUw=";
    })
  ];
}
