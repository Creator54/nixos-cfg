{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation rec {
  pname = "adi1090x-plymouth";
  version = "0.0.1";
  src = builtins.fetchGit {
    url = "https://github.com/adi1090x/plymouth-themes.git";
  };

  buildInputs = [ pkgs.git ];

  configurePhase = ''
    mkdir -p $out/share/plymouth/themes/
  '';
  buildPhase = '''';

  installPhase = ''
    cp -r pack_1/blockchain $out/share/plymouth/themes
    cat pack_1/blockchain/blockchain.plymouth | sed  "s@\/usr\/@$out\/@" > $out/share/plymouth/themes/blockchain/blockchain.plymouth
  '';
}

