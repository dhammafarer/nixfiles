{ config, pkgs, ... }:

{
  boot = {
    loader = {
      grub.device = "/dev/sda1";
    }
  }

  time.timeZone = "Asia/Taipei";

  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };
}
