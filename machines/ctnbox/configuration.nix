{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ../../modules/base.nix
      ../../modules/users.nix

      ../../modules/xserver.nix
      ../../modules/xmonad.nix

      ../../modules/fonts.nix
      ../../modules/terminal.nix
      ../../modules/dev.nix

      ../../modules/network.nix

      ../../modules/audio.nix

      ../../modules/utils.nix
      ../../modules/browser.nix
      ../../modules/media.nix
      ../../modules/chat.nix
    ];

  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.device = "/dev/sda";

  networking.useDHCP = false;
  networking.interfaces.enp3s0.useDHCP = true;

  programs.gnupg.agent = { enable = true; enableSSHSupport = true; };


  services.openssh.enable = true;

  system.stateVersion = "19.09"; # Did you read the comment?

}

