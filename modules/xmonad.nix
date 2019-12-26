{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    compton
    numix-cursor-theme
    haskellPackages.xmonad
    haskellPackages.xmonad-extras
    haskellPackages.xmonad-contrib
    haskellPackages.xmobar
    stalonetray
    xorg.xmodmap
    xscreensaver
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
        kupfer &
        /home/pawel/.xmonad/bin/elapsed "9:00" "18:30" &
        dropbox &
        xscreensaver -no-splash &
        xsetroot -solid "#2f343f" &
        ${pkgs.xorg.xrdb}/bin/xrdb -merge <${pkgs.writeText "Xresources" ''
            Xcursor.theme: Numix
            Xcursor.size: 64

            ! SOURCE TERMINAL COLORS !
            #include "/home/pawel/.xres/themes/arc"

            !! General
            URxvt.depth:                32
            URxvt.scrollBar:            false
            URxvt.scrollBar_right:      false
            URxvt.cursorBlink:          false
            URxvt.cursorUnderline:      false
            URxvt.urgentOnBell:         true
            URxvt.iso14755:             false
            URxvt.iso14755_52:          false
            URxvt.clipboard.autocopy:   true

            !! Text
            URxvt.font:                 xft:Fira Code:style=Regular:size=14,xft:DejaVu Sans Mono:style=Book:size=14
            URxvt.letterSpace:          -1
            URxvt.lineSpace:            4

            !! Extensions
            URxvt.perl-lib:              ${pkgs.rxvt_unicode-with-plugins}/lib/urxvt/perl
            URxvt.perl-ext-common:       default,keyboard-select,url-select,clipboard
            URxvt.url-select.launcher:   ${pkgs.google-chrome}/bin/google-chrome-stable
            URxvt.url-select.underline:  true

            !! Keymaps
            URxvt.modifier:               super
            URxvt.keysym.Shift-Control-V: perl:clipboard:paste
            URxvt.keysym.Shift-Control-C: eval:selection_to_clipboard
            URxvt.keysym.M-Escape:        perl:keyboard-select:activate
            URxvt.keysym.M-s:             perl:keyboard-select:search
            URxvt.keysym.M-u:             perl:url-select:select_next
            URxvt.keysym.Control-Up:      \033[1;5A
            URxvt.keysym.Control-Down:    \033[1;5B
            URxvt.keysym.Control-Left:    \033[1;5D
            URxvt.keysym.Control-Right:   \033[1;5C
          ''}
        '';
  };
}
