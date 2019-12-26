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
      ../../modules/samba.nix

      ../../modules/audio.nix

      ../../modules/utils.nix
      ../../modules/browser.nix
      ../../modules/media.nix
      ../../modules/chat.nix
      ../../modules/graphics.nix
      ../../modules/desktop.nix
    ];

  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.device = "/dev/sda";

  networking.useDHCP = false;
  networking.interfaces.enp3s0.useDHCP = true;

  programs.gnupg.agent = { enable = true; enableSSHSupport = true; };

  services.openssh.enable = true;

  system.stateVersion = "19.09"; # Did you read the comment?

  environment.systemPackages = with pkgs; [
    cudatoolkit
  ];

  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.opengl.driSupport32Bit = true;
  hardware.nvidia.modesetting.enable = true;

  services.xserver = {
    displayManager.job.logToJournal = true;
    displayManager.lightdm.autoLogin = {
      enable = true;
      user = "pawel";
    };
    displayManager.lightdm.greeter.enable = false;
  };
}
