# dotfiles

The dotfiles for my NixOS system

## Setup

Clone this repo into your home directory, cd into the dotfiles directory that was created, and use GNU Stow on the directories `qtile`, `nvim`, and `scripts` to create symlinks in the proper places (not for `home-manager` or `nixos`).

The `nixos` folder requires `nixos/configuration.nix` to be linked to `/etc/nixos/configuration.nix`.

Some things, such as Firefox and NixOS, have my username hardcoded, so you'll need to change that to use this.

For GitHub use, generate and link a new SSH key.

## Credits

-   My Neovim config was based on [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim)
-   The same goes for my Firefox config, which is mostly copied from [noib3](https://github.com/noib3/macOS-dotfiles/tree/master/firefox)
