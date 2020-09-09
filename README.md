# dotfiles
The dotfiles for my GNU/Linux systems

## How do I use this?
Clone the repo into your home directory, cd into the dotfiles directory that was created, and use GNU Stow on a folder to create symlinks in the proper places.

## Why only two of the window managers you have used?
I may add more later, but bspwm and dwm are my favorites. I currently use my own fork of dwm on all of my Linux systems as I prefer dynamic tilers, but if I were to use a manual tiler, I would use bspwm.
I've used i3, i3-gaps, and xmonad in the past. i3 didn't have gaps, i3-gaps is hacky weirdness, and xmonad is more difficult to configure than dwm.

## Why not have multiple configs in the same directory for things you use on every system?
Consistency and flexibility. It allows me to easily switch what program I use for a given purpose, and it leaves no mystery as to what program is in a given directory.
Wasted space is not really a concern, as directories themselves take 4K per directory.

## Credits
* Much of my (Neovim) config comes from and is inspired by [christatmachine](https://github.com/ChristianChiarulli/nvim).

Folder | Programs | Description | Configuration | Status
--- | --- | --- | --- | ---
alacritty | Alacritty | Minimal GPU accelerated terminal emulator | Fonts | Good
bash | Bash | A shell | vi mode, a few aliases | Working, lacking
bspwm | bspwm, polybar, sxhkd | Window manager - corresponding bar and hotkey daemon included in this folder | Not much more than the defaults | Bar broken, not in use
dunst | dunst | Notification daemon | A minimal, dark look | Good
dwm-tools | dwmstatus, startdwm | Status bar, starting loop, and .xinitrc for dwm | Minimal | Good
firefox | Firefox | Web browser | Made to work well with "Tree Style Tabs" and "Tab Count in Window Title" | Good
fish | Fish | A good shell, amazing for interactive use | Some abbreviations, vi mode, and an included prompt | Good
leftwm | LeftWM | A tiling WM written in Rust | vi keys | Good
nvim | Neovim | A more modern version of Vim, with Lua extension support | Two extensions, some simple settings | Good
picom | Picom | A compositor with file based configuration | Some transparency | Good
wm-tools | N/A | Contains only a script to start programs when I start my WM | Good
xdg-user-dirs | xdg-user-dirs | Contains some default directories | Good
