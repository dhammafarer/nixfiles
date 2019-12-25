{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    alsaUtils
    pamixer
    paprefs
    pavucontrol
  ];

  hardware.pulseaudio = {
    enable = true;
    support32Bit = true;
    package = pkgs.pulseaudio;
  };
}
