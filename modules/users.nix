{ config, pkgs, ... }:

{
  networking.hostName = "pawel";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users = {
    defaultUserShell = pkgs.zsh;
    users.pawel = {
      isNormalUser = true;
      uid = 1987;
      name = "pawel";
      description = "Pawel Lisewski";
      createHome = true;
      home = "/home/pawel";
      extraGroups = [
        "networkmanager"
        "wheel"
      ];
    };
  };

  environment = {
    variables = {
      URXVT_PERL_PLUGINS = "${pkgs.rxvt_unicode-with-plugins}/lib/urxvt/perl";
    };
  };
}
