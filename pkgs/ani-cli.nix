{ pkgs, lib, ... }:

{
  home.packages = [
    (pkgs.fetchFromGitHub {
      owner = "pystardust";
      repo = "ani-cli";
      rev = "3da894148b395078c3e8673e5a6535dfb215f893"; #3.2.2
      sha256 = "sha256-rtoQUJsvQzWqrOIC4vhtfdSvgfbl9BXn++TddngtS08=";#lib.fakeSha256;
    })
  ];
}
