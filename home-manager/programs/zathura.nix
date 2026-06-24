{ ... }:
{
  programs.zathura = {
    enable = true;
    extraConfig = ''
      set recolor "true"

      set completion-bg "#313244"
      set completion-fg "#cdd6f4"
      set completion-group-bg "#313244"
      set completion-group-fg "#f38ba8"
      set completion-highlight-bg "#cdd6f4"
      set completion-highlight-fg "#1e1e2e"

      set recolor-lightcolor "#1e1e2e"
      set recolor-darkcolor "#cdd6f4"
      set default-bg "#1e1e2e"

      set inputbar-bg "#313244"
      set inputbar-fg "#cdd6f4"
      set notification-bg "#313244"
      set notification-fg "#cdd6f4"
      set notification-error-bg "#f38ba8"
      set notification-error-fg "#1e1e2e"
      set notification-warning-bg "#f9e2af"
      set notification-warning-fg "#1e1e2e"
      set statusbar-bg "#313244"
      set statusbar-fg "#cdd6f4"
      set index-bg "#1e1e2e"
      set index-fg "#cdd6f4"
      set index-active-bg "#cdd6f4"
      set index-active-fg "#1e1e2e"
      set render-loading-bg "#1e1e2e"
      set render-loading-fg "#cdd6f4"

      set window-title-home-tilde true
      set statusbar-basename true
      set selection-clipboard clipboard

      set first-page-column 1
    '';
  };
}
