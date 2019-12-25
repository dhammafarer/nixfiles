{ config, pkgs, ... }:

{
  fonts = {
    enableFontDir = true;
    enableGhostscriptFonts = true;
    fonts = with pkgs; [
      ubuntu_font_family
      fira-code
      dejavu_fonts
      font-awesome-ttf
      powerline-fonts
      noto-fonts-cjk
    ];
    fontconfig.defaultFonts.monospace = [
      "Fira Code"
      "DejaVu Sans Mono"
    ];
    fontconfig.defaultFonts.serif = [
      "Ubuntu"
      "DejaVu Serif"
    ];
    fontconfig.defaultFonts.sansSerif = [
      "Ubuntu"
    ];
  };
}
