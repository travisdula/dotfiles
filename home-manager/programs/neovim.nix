{ config, pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    sideloadInitLua = true;
    extraPackages = with pkgs; [
      lua-language-server
      nixd
      nixfmt
      vimPlugins.telescope-nvim
    ];

    withPython3 = false;
    withRuby = false;
  };

  xdg.configFile."nvim" = {
    source = config.lib.file.mkOutOfStoreSymlink ./nvim;
    recursive = true;
  };
}
