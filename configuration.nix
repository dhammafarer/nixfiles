{ config, pkgs, ... }:

{
    imports =
        [
            ./hardware-configuration.nix
            ./base.nix
            ./users.nix
            ./xserver.nix
            ./xmonad.nix
            ./fonts.nix
            ./terminal.nix
            ./audio.nix
        ];
}
