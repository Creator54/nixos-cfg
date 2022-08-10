{
  userConfig = {
    serverHostName = "server";
    hostName = "creator54.me";
    userName = "creator54";
    userEmail = "hi.creator54@gmail.com";
    path = "/home/creator54/website-stuff";
    codeServer = {
      host = "code.creator54.me";
      port = 5000;
    };
    nextCloud.host = "cloud.creator54.me";
    adguard = {
      host = "ag.creator54.me";
      port = 3000; #set this port only in the webUI
    };
    whoogle = {
      host = "search.creator54.me";
      port = "8050"; #strings allowed here
    };
    stateVersion = "22.05";
    hostSrc = builtins.fetchTarball https://github.com/creator54/creator54.me/tarball/main;
    blogSrc = builtins.fetchTarball https://github.com/creator54/blog.creator54.me/tarball/main + "/_site/";
  };
}
