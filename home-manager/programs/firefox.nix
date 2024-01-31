{ config, pkgs, ... }:
{
  # look into https://github.com/TLATER/dotfiles/blob/b39af91fbd13d338559a05d69f56c5a97f8c905d/home-config/config/graphical-applications/firefox.nix
  programs.firefox = {
    enable = true;
    profiles.travis = {
      search.engines = {
        "Nix Packages" = {
          urls = [{
              template = "https://search.nixos.org/packages";
              params = [
                { name = "type"; value = "packages"; }
                { name = "query"; value = "{searchTerms}"; }
              ];
          }];
          icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
          definedAliases = [ "@np" ];
        };
        "NixOS Wiki" = {
          urls = [{ template = "https://nixos.wiki/index.php?search={searchTerms}"; }];
          iconUpdateURL = "https://nixos.wiki/favicon.png";
          updateInterval = 24 * 60 * 60 * 1000; # every day
          definedAliases = [ "@nw" ];
        };
        "Bing".metaData.hidden = true;
        "Google".metaData.alias = "@g"; # builtin engines only support specifying one additional alias

      };
      userChrome = builtins.readFile ./firefoxUserChrome.css;
      # needs NUR to work
      #extensions = with pkgs.nur.repos.rycee.firefox-addons; [
      #  clearurls
      #  darkreader
      #  privacy-badger
      #  ublock-origin
      #  vimium
      #];
      settings = {
        # my customizations
        "browser.aboutConfig.showWarning" = false;
        "browser.ctrlTab.previews" = true;
        "browser.ctrlTab.sortByRecentlyUsed" = true; # enables previews
        "browser.download.dir" = "/home/travis/dl";
        "browser.newtab.url" = "about:blank";
        "browser.startup.homepage" = "about:blank";
        "browser.toolbars.bookmarks.visibility" = "never";
        "layout.css.devPixelsPerPx" = 1.2; # increase UI size
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "browser.urlbar.suggest.quicksuggest.sponsored" = false;
        "toolkit.telemetry.pioneer-new-studies-available" = false;

        # some taken from https://shen.hong.io/nixos-for-philosophy-installing-firefox-latex-vscodium/
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
}
