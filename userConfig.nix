{
  userConfig = {
    hostName = "creator54.me";
    userName = "creator54";
    userEmail = "hi.creator54@gmail.com";
    path = "/home/creator54/website-stuff";
    hostSrc = builtins.fetchTarball https://github.com/creator54/creator54.me/tarball/main;
    blogSrc = builtins.fetchTarball https://github.com/creator54/blog.creator54.me/tarball/main + "/_site/";
  };
}
