{ config, ... }:
{
  xdg.configFile."qtile/config.py" = {
    source = config.lib.file.mkOutOfStoreSymlink ./config.py;
  };
}
