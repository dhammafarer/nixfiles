{ config, pkgs, ... }:

{
    imports =
        [
            ./hardware-configuration.nix
            ./users.nix
            ./xserver.nix
            ./xmonad.nix
            ./audio.nix
            ./fonts.nix
        ];
}
