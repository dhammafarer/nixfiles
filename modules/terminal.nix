{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    rxvt_unicode-with-plugins
    (import ./vim.nix)
  ];

  services.urxvtd.enable = true;

  environment = {
      variables = {
        URXVT_PERL_PLUGINS = "${pkgs.rxvt_unicode-with-plugins}/lib/urxvt/perl";
      };
    };

  programs = {
    bash = {
      enableCompletion = true;
    };
    zsh = {
      enable = true;
      autosuggestions = {
        enable = true;
      };
      ohMyZsh = {
        enable = true;
        theme = "avit";
        plugins = ["git" "pass" "taskwarrior"];
      };
      interactiveShellInit = ''
        export ZSH=${pkgs.oh-my-zsh}/share/oh-my-zsh/

        export PATH=":/home/pawel/.npm-global/bin:$PATH"

        if [ -f ~/.aliases ]; then
          source ~/.aliases
        fi

        source $ZSH/oh-my-zsh.sh
      '';
      promptInit = "";
      syntaxHighlighting = {
        enable = true;
      };
    };
  };
}
