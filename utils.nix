{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    curl
    dropbox
    elinks
    fzf
    goldendict
    htop
    kupfer
    mate.atril
    mate.caja
    mate.caja-dropbox
    mate.eom
    mupdf
    pass
    ranger
    scrot
    taskwarrior
    translate-shell
    tree
    unzip
    usbutils
    wget
    xclip
    xorg.xev
    xorg.xprop
    xsel
    zip
  ];
}
