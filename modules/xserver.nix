{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    compton
  ];

  services.xserver = {
    enable = true;
    autorun = true;
    layout = "us";

    desktopManager.default = "none";
    desktopManager.xterm.enable = false;
    displayManager.lightdm.enable = true;
  };

  services.compton = {
    enable = true;
    shadow = false;
    vSync = true;
    backend = "glx";
  };
}
