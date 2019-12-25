{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
  ];

  services.xserver = {
    enable = true;
    autorun = false;
    layout = "us";

    desktopManager.default = "none";
    desktopManager.xterm.enable = false;
    displayManager.lightdm.enable = true;
  }
}
