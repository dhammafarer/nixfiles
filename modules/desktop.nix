{ config, pkgs, expr, buildVM, ... }:

let
  iconTheme = pkgs.arc-icon-theme;
  themeEnv = ''
    # GTK3: remove local user overrides (for determinisim, causes hard to find bugs)
    rm -f ~/.config/gtk-3.0/settings.ini

    # GTK3: add theme to search path for themes
    export XDG_DATA_DIRS="${pkgs.arc-theme}/share:$XDG_DATA_DIRS"

    # GTK3: add /etc/xdg/gtk-3.0 to search path for settings.ini
    # We use /etc/xdg/gtk-3.0/settings.ini to set the icon and theme name for GTK 3
    export XDG_CONFIG_DIRS="/etc/xdg:$XDG_CONFIG_DIRS"

    # GTK2 theme + icon theme
    export GTK2_RC_FILES=${pkgs.writeText "iconrc" ''gtk-icon-theme-name="Arc"''}:${pkgs.arc-theme}/share/themes/Arc/gtk-2.0/gtkrc:$GTK2_RC_FILES

    # SVG loader for pixbuf (needed for GTK svg icon themes)
    export GDK_PIXBUF_MODULE_FILE=$(echo ${pkgs.librsvg.out}/lib/gdk-pixbuf-2.0/*/loaders.cache)
  '';

in {
  environment.extraInit = ''
    ${themeEnv}

    # these are the defaults, but some applications are buggy so we set them
    # here anyway
    export XDG_CONFIG_HOME=$HOME/.config
    export XDG_DATA_HOME=$HOME/.local/share
    export XDG_CACHE_HOME=$HOME/.cache
  '';

  # GTK3 global theme (widget and icon theme)
  environment.etc."xdg/gtk-3.0/settings.ini" = {
    text = ''
      [Settings]
      gtk-icon-theme-name = Arc
      gtk-theme-name = Arc-Dark
      gtk-font-name = Ubuntu Regular 12
      gtk-application-prefer-dark-theme = true
    '';
    mode = "444";
  };

  environment.systemPackages = with pkgs; [
    arc-theme
    arc-icon-theme
  ];
}
