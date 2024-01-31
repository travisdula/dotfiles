{ config, pkgs, ... }:

{
  imports = [
    ./programs/firefox.nix
    ./programs/fish.nix
  ];
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "travis";
  home.homeDirectory = "/home/travis";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.lf = {
    enable = true;
    previewer.source = pkgs.writeShellScript "pv.sh" '' 
      case "$1" in
          *.tar*) tar tf "$1";;
          *.zip) unzip -l "$1";;
          *.rar) unrar l "$1";;
          *.7z) 7z l "$1";;
          *.pdf) pdftotext "$1" -;;
          *.jpg | *.png | *.jpeg) identify "$1" | tr ' ' '\n';;
          *) highlight -O ansi "$1" || cat "$1";;
      esac
            '';
    keybindings = {
      Y = "&echo $f | xclip -i -selection clipboard";
    };
  };

  # look into https://github.com/TLATER/dotfiles/blob/b39af91fbd13d338559a05d69f56c5a97f8c905d/home-config/config/graphical-applications/firefox.nix

  # this will be hard
  #programs.neovim = { TODO
  #  enable = true;
  #  settings = {
  #    relativeNumber = true;
  #    number = true;
  #  };


  programs.git = {
    enable = true;
    userName = "Travis A. Dula";
    userEmail = "travisadula@gmail.com";
  };

  programs.kitty = {
    enable = true;
    shellIntegration.enableFishIntegration = true;
    font = {
      name = "JetBrains Mono";
      size = 16;
    };
    extraConfig = builtins.readFile ./programs/kitty.conf;
    theme = "Nord";
  };
  
  programs.zathura = {
    enable = true;
    extraConfig =''
      set recolor "true"

      set completion-bg "#2E3440"
      set completion-fg "#E5E9F0"
      set completion-group-bg "#2E3440"
      set completion-group-fg "#BF616A"
      set completion-highlight-bg "#E5E9F0"
      set completion-highlight-fg "#2E3440"
      
      set recolor-lightcolor "#2E3440"
      set recolor-darkcolor "#E5E9F0"
      set default-bg "#2E3440"
      
      set inputbar-bg "#2E3440"
      set inputbar-fg "#E5E9F0"
      set notification-bg "#2E3440"
      set notification-fg "#E5E9F0"
      set notification-error-bg "#88C0D0"
      set notification-error-fg "#E5E9F0"
      set notification-warning-bg "#88C0D0"
      set notification-warning-fg "#E5E9F0"
      set statusbar-bg "#2E3440"
      set statusbar-fg "#E5E9F0"
      set index-bg "#2E3440"
      set index-fg "#E5E9F0"
      set index-active-bg "#E5E9F0"
      set index-active-fg "#2E3440"
      set render-loading-bg "#2E3440"
      set render-loading-fg "#E5E9F0"
      
      set window-title-home-tilde true
      set statusbar-basename true
      set selection-clipboard clipboard
      
      set first-page-column 1
    '';
  };
  xdg.userDirs = {
    enable = true;
    createDirectories = true;
    desktop = "${config.home.homeDirectory}/desk";
    documents = "${config.home.homeDirectory}/docs";
    download = "${config.home.homeDirectory}/dl";
    music = "${config.home.homeDirectory}/mus";
    pictures = "${config.home.homeDirectory}/pics";
    publicShare = "${config.home.homeDirectory}/pub";
    templates = "${config.home.homeDirectory}/templ";
    videos = "${config.home.homeDirectory}/vids";
  };
}
