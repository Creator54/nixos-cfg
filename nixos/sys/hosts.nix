{
  networking.extraHosts = let
    adawayHosts = builtins.readFile "${builtins.fetchurl https://adaway.org/hosts.txt}";
    adguardHosts = builtins.readFile "${builtins.fetchurl https://adguardteam.github.io/AdGuardSDNSFilter/Filters/filter.txt}";
    stevenBlackHosts = builtins.readFile "${builtins.fetchurl https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts}";
    youtubeAdBlockHosts = builtins.readFile "${builtins.fetchurl https://raw.githubusercontent.com/Ewpratten/youtube_ad_blocklist/master/blocklist.txt}";
  in adawayHosts + adguardHosts + stevenBlackHosts + youtubeAdBlockHosts; #this reads them out together which gets captured and saved in extraHosts, use nix repl to learn.
}

