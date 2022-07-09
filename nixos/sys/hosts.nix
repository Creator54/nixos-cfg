{
  networking.hostFiles = [
    (builtins.fetchurl https://adaway.org/hosts.txt)
    (builtins.fetchurl https://adguardteam.github.io/AdGuardSDNSFilter/Filters/filter.txt)
    (builtins.fetchurl https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts)
    (builtins.fetchurl https://raw.githubusercontent.com/creator54/youtube_ad_blocklist/master/blocklist.txt)
  ];
}

