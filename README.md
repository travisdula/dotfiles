# dotfiles
The dotfiles for my GNU/Linux systems

## How do I use this?
Clone this repo into your home directory, cd into the dotfiles directory that was created, and use GNU Stow on a subdirectory to create symlinks in the proper places.

## Credits
* Much of my Neovim config comes from and is inspired by [christatmachine](https://github.com/ChristianChiarulli/nvim).
* The same goes for my Firefox config, which is mostly copied from [noib3](https://github.com/noib3/macOS-dotfiles/tree/master/firefox)

Folder | Programs | Description | Configuration | Status | In use
--- | --- | --- | --- | --- | ---
alacritty | Alacritty | Minimal GPU accelerated terminal emulator | Fonts | Memory leak | No
kitty | Kitty | GPU accelerated terminal with ligature support | TODO | Good | Yes
bash | Bash | A shell | vi mode, a few aliases | Working, lacking | No, using fish
bspwm | bspwm, polybar, sxhkd | Window manager - corresponding bar and hotkey daemon included in this folder | Not much more than the defaults | Bar broken | No
dunst | dunst | Notification daemon | A minimal, dark look | Good | No, awesome handles this
dwm-tools | dwmstatus, startdwm | Status bar, starting loop, and .xinitrc for dwm | Minimal | Good | No, not using dwm
firefox | Firefox | Web browser | Made to work well with "Tree Style Tabs" and "Tab Count in Window Title", more minimal look | Good | Yes
fish | Fish | A good shell, amazing for interactive use | Some abbreviations, vi mode, and an included prompt | Good | Yes, default shell
leftwm | LeftWM | A tiling WM written in Rust | vi keys | Good | No, using awesome
nvim | Neovim | A more modern version of Vim, with Lua extension support | Two extensions, some simple settings | Good | Yes, primary editor
picom | Picom | A compositor with file based configuration | Some transparency | picom is bloat, use xcompmgr | No, using xcompmgr or nothing
wm-tools | N/A | Contains several helper scripts | N/A | Good | Yes, some
xdg-user-dirs | xdg-user-dirs | Contains some default directories | Lowercase shortened directory names | Good | Yes
zathura | zathura | Minimal PDF viewer | Nord theme, some sensible defaults | Good | Yes
