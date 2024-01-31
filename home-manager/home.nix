{ config, pkgs, ... }:

{
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
  programs.firefox = { # TODO move to own file
    enable = true;
    profiles.travis = {
      userChrome = builtins.readFile ./firefoxUserChrome.css;
      # needs NUR to work
      #extensions = with pkgs.nur.repos.rycee.firefox-addons; [
      #  clearurls
      #  darkreader
      #  privacy-badger
      #  ublock-origin
      #  vimium
      #];
      # some taken from https://shen.hong.io/nixos-for-philosophy-installing-firefox-latex-vscodium/
      settings = {
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "browser.download.dir" = "/home/travis/dl";
        "browser.toolbars.bookmarks.visibility" = "never";
        "layout.css.devPixelsPerPx" = 1.2; # increase UI size
        # HTTPS
        "dom.security.https_only_mode" = true;
        "dom.security.https_only_mode_ever_enabled" = true;
        # Privacy settings
        "privacy.donottrackheader.enabled" = true;
        "privacy.trackingprotection.enabled" = true;
        "privacy.trackingprotection.socialtracking.enabled" = true;
        "privacy.partition.network_state.ocsp_cache" = true;
        # Disable all sorts of telemetry
        "browser.newtabpage.activity-stream.feeds.telemetry" = false;
        "browser.newtabpage.activity-stream.telemetry" = false;
        "browser.ping-centre.telemetry" = false;
        "toolkit.telemetry.archive.enabled" = false;
        "toolkit.telemetry.bhrPing.enabled" = false;
        "toolkit.telemetry.enabled" = false;
        "toolkit.telemetry.firstShutdownPing.enabled" = false;
        "toolkit.telemetry.hybridContent.enabled" = false;
        "toolkit.telemetry.newProfilePing.enabled" = false;
        "toolkit.telemetry.reportingpolicy.firstRun" = false;
        "toolkit.telemetry.shutdownPingSender.enabled" = false;
        "toolkit.telemetry.unified" = false;
        "toolkit.telemetry.updatePing.enabled" = false;
        
        # As well as Firefox 'experiments'
        "experiments.activeExperiment" = false;
        "experiments.enabled" = false;
        "experiments.supported" = false;
        "network.allow-experiments" = false;
        # Disable Pocket Integration
        "browser.newtabpage.activity-stream.section.highlights.includePocket" = false;
        "extensions.pocket.enabled" = false;
        "extensions.pocket.api" = "";
        "extensions.pocket.oAuthConsumerKey" = "";
        "extensions.pocket.showHome" = false;
        "extensions.pocket.site" = "";
      };
    };
    
  };

  # this will be hardest
  #programs.neovim = { TODO
  #  enable = true;
  #  settings = {
  #    relativeNumber = true;
  #    number = true;
  #  };
  #programs.fish = { TODO
  #  enable = true;
  #  shellAbbrs = {};
  #};

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
    extraConfig = builtins.readFile ./kitty.conf;
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
