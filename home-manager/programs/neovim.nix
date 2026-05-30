{ config, pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    extraPackages = with pkgs; [
      lua-language-server
      nixd
      nixfmt
    ];
  };
  xdg.configFile."nvim" = {
    source = config.lib.file.mkOutOfStoreSymlink ./nvim;
    recursive = true;
  };
}
