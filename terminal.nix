{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    rxvt_unicode
    urxvt_perls
    (import ./vim.nix)
  ];

  services.urxvtd.enable = true;

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
      }
      interactiveShellInit = ''
        export ZSH=${pkgs.oh-my-zsh}/share/oh-my-zsh/

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
