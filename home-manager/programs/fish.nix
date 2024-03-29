{config, lib, pkgs, ...}:
{
  programs.fish = {
  # what to do with these?
    #  # cleaning home directory
    #set XDG_CONFIG_HOME $HOME/.config
    #set XDG_CACHE_HOME $HOME/.cache
    #set XDG_DATA_HOME $HOME/.local/share
    #
    #set XCOMPOSEFILE $XDG_CONFIG_HOME/X11/xcompose
    #set XCOMPOSECACHE $XDG_CACHE_HOME/X11/xcompose
    #set PYTHONPYCACHEPREFIX $XDG_CACHE_HOME/python
    #set TEXMFHOME $XDG_DATA_HOME/texmf
    #set TEXMFVAR $XDG_CACHE_HOME/texlive/texmf-va
    #set TEXMFCONFIG $XDG_CONFIG_HOME/texlive/texmf-config
    #
    ## my standard home directories
    #set XDG_DESKTOP_DIR "$HOME/desk"
    #set XDG_DOCUMENTS_DIR "$HOME/docs"
    #set XDG_DOWNLOAD_DIR "$HOME/dl"
    #set XDG_MUSIC_DIR "$HOME/mus"
    #set XDG_PICTURES_DIR "$HOME/pics"
    #set XDG_PUBLICSHARE_DIR "$HOME/pub"
    #set XDG_TEMPLATES_DIR "$HOME/templ"
    #set XDG_VIDEOS_DIR "$HOME/vids"

    enable = true;
    shellAbbrs = {
      b = "bat";
      gc = "git commit";
      gp = "git push";
      gs = "git status";
      l = "exa --icons";
      ll = "exa -hal --icons";
      llt = "exa -hal --tree --icons";
      n = "nvim";
      p = "python";
      pmix = "pulsemixer";
      y = "yay";
      z = "zathura";
    };
    interactiveShellInit = ''
      fish_config theme choose Nord
      fish_vi_key_bindings
      set fish_greeting
    '';
  };
}
