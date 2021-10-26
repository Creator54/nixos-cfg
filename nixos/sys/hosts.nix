{
  networking.extraHosts = let
    hostsPath = https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts;
    hostsFile = builtins.fetchurl hostsPath;
  in builtins.readFile "${hostsFile}";
}

