{ config, pkgs, ... }:

{
    imports =
        [
            ./hardware-configuration.nix
            ./users.nix
            ./xmonad.nix
            ./audio.nix
        ];
}
