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
            ./dev.nix

            ./network.nix

            ./audio.nix

            ./utils.nix
            ./browser.nix
            ./media.nix
            ./chat.nix
        ];
}
