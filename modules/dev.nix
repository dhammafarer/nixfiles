{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    git
    git-lfs
    neovim
    nodejs
    python
    python3
  ];

  programs.npm = {
    enable = true;
    npmrc = ''
      prefix=~/.npm-global
    '';
    };
}
