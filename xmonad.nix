{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    compton
    haskellPackages.xmonad
    haskellPackages.xmonad-extras
    haskellPackages.xmonad-contrib
    haskellPackages.xmobar
    stalonetray
    xorg.modmap
  ];

  services.xserver = {
    windowManager.xmonad = {
      enable = true;
      enableContribAndExtras = true;
      extraPackages = haskellPackages: [
        haskellPackages.xmonad-contrib
        haskellPackages.xmonad-extras
        haskellPackages.xmonad
      ];
    };

    windowManager.default = "xmonad";

    displayManager.sessionCommands = with pkgs; lib.mkAfter
        ''
        xmodmap /home/pawel/dotfiles/.Xmodmap &
        stalonetray -c /home/pawel/.xmonad/stalonetrayrc-single &
        '';
  }
}
