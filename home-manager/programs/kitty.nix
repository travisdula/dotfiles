{ ... }:
{
  programs.kitty = {
    enable = true;
    shellIntegration.enableFishIntegration = true;
    font = {
      name = "JetBrains Mono";
      size = 16;
    };
    extraConfig = builtins.readFile ./kitty.conf;
    themeFile = "Nord";
  };
}
