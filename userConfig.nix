{
  userConfig = {
    serverHostName = "server";
    hostName = "creator54.me";
    userName = "creator54";
    userPassword = "$1$DWB64kU7$qILCX4xO8DkGDAcvcqANc."; #generate hashed password via openssl passwd -1
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
    plex = {
      user = "creator54";
      host = "plex.creator54.me";
      dataDir = "/var/lib/plex";
      port = 32400; #plex runs on this port by default, no option to change currently
    };
    whoogle = {
      host = "search.creator54.me";
      port = "8050"; #strings allowed here
    };
    sshKeys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDUG+dQCoGoq1cHa6yYmx925i1GJqgFY/+NRh9mnecxzNiqm4BdsBz/wfn7WKJzGjQNKb5QX3QD72xJHXojziFhVA531rJoQavM93IKDI1vlng7v4mHnQVMQqT6l67zZDEraVs2/V3Rz+5YYo2ecvRhY4i5evzR8t2h89jWVYjUHcgGQPwnHzFjLItI7rnaYS50QaeCgfpRMqjwosp/FDKZYHz+gCMTOH6l5wFkmRJBBWviwVybwDC3Hpp88hS3DrC/HrFrOpzhFzCIs18RxefEEp0EDAIf5pS5gbHgIfkuX4SQTIWA2ZOeHTMDQrOx12EsqSccFxB0eczdtu/MoOBh webserver"
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDHSEw5zX0noyIHiLM3DuNsHaSKP/1wiwKJQWPBGzOgALwarc6HFW5kY1uzS6YFAyVtMG8jh3AsGdEV4V3p8rvFdyupxvC0lkFWI3eq2JI7AZRjSZyPmwUDo1OGDUCyK2nMg5O4vXOMWN5TG5z2CduOWkpKMRK7AF5jN5cIYhMmg9eYMjxAfppYPrfdOr8YRsadNJs8MtFwtwLn4jFpc781uw8zo9oyLZQ9knja0EgXrDSA6SGo+nQNMEbogU2xxVD18WfwoucHm+vw+DuBWQcMMHqXvfdv4KVatNBQt0V3XNdax0nRT2a6F4f/L6XAgUs2pQRgold7lN42RGiyBV6RZd/RAPvhdSU5kHcft7B1wCUvHivwH2DQlQs76H+52u456ruytkjaqpS7A6QHCAUdmP9RHuz85f9g/qQuVpmsW3u1pphTilt786UHGv1aEkxAI1AN/irK6DO7GAJEKkf1OuaEuKYIRzRkhRUSjEVYQb26v4v4O5ZPc5duWFUY8ZWinBTZ7SWcSeFE6gxuDx6UTVki/UKGyHJsU3sJl80ma9YoGYN0P4BfXVycUO4kgQGrSDbu6uXQ41vjiYXr/tLosSLtoXOwmO5K5nfFTCH/CCtWEgqKOn/8avZ4mV6UjIBlQE38GLu4Yq7622V4aCxCJpUC2IVteJRPabWmra4kQQ== hi.creator54@gmail.com"
    ];
    stateVersion = "22.05";
    hostSrc = builtins.fetchTarball https://github.com/creator54/creator54.me/tarball/main;
    blogSrc = builtins.fetchTarball https://github.com/creator54/blog.creator54.me/tarball/main + "/_site/";
  };
}
