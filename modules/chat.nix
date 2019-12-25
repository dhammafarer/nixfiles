{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    pidgin
    purple-facebook
  ];
}
