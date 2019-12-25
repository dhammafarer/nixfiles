{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
  ];

  networking = {
    networkmanager = {
      enable = true;
    };
  };

  services = {
    openssh = {
      enable = true;
    };
  };
}
