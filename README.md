# dotfiles

The dotfiles for my GNU/Linux systems

## How do I use this?

Clone this repo into your home directory, cd into the dotfiles directory that was created, and use GNU Stow on a subdirectory to create symlinks in the proper places.

The `nixos` folder (for NixOS, of course) requires `nixos/configuration.nix` to be linked to `/etc/nixos/configuration.nix`.

Some things, such as Firefox and NixOS, have my username hardcoded, so you'll need to change that to use this.

## Credits

-   My Neovim config was based on [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim)
-   The same goes for my Firefox config, which is mostly copied from [noib3](https://github.com/noib3/macOS-dotfiles/tree/master/firefox)

| Folder        | Description                                           | Configuration                                       |
|---------------|-------------------------------------------------------|-----------------------------------------------------|
| firefox       | Web browser                                           | Minimal appearance                                  |
| fish          | Best shell, amazing for interactive and scripting use | Some abbreviations, vi mode, and an included prompt |
| kitty         | GPU accelerated terminal with ligature support        | Font and theme                                      |
| lf            | Minimal terminal file manager written in go           | Previewer and copying files                         |
| nixos         | A configurable operating system                       | Previewer and copying files                         |
| nvim          | Modern version of Vim, with Lua extension support     | Mostly just kickstart.nvim                          |
| qtile         | Dynamic window manager written in Python              | Nord theme                                          |
| scripts       | Contains several helper scripts                       | N/A                                                 |
| xdg-user-dirs | Contains some default directories                     | Lowercase shortened directory names                 |
| zathura       | Minimal PDF viewer                                    | Nord theme, some sensible defaults                  |
