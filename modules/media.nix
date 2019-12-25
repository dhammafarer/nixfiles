{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    #minitube
    mpv
    vlc
    youtube-dl
  ];
}
