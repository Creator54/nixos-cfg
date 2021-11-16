{ config, pkgs, lib, ... }:

{
  services.samba = {
    enable = true;
    extraConfig = ''
      server string = Home Server
      workgroup = HOME
      guest account = nobody
      map to guest = bad user
      name resolve order = bcast host
    '';
    securityType = "user";
    shares = {
      private = { #create an useraccount and set password via "sudo smbpasswd -a username"
        path = "/run/mount/data1";
        "read only" = "no";
        "create mask" = "0664"; #permissions 
        "force create mask" = "0664";
        "directory mask" = "0775";
        "force directory mode" = "0775";
        private = "yes";
        writable = "yes";
        browseable = "yes";
        "guest ok" = "no";
        comment = "SMB: Local DATA Drive";
      };
    };
  };
}
 
