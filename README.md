# dotfiles
The dotfiles for my GNU/Linux systems

## How do I use this?
Clone the repo into your home directory, cd into the dotfiles directory that was created, and use GNU Stow on a folder to create symlinks in the proper places.

## What's it got?
Oh, some dotfiles. There are and will be dotfiles for multiple programs that serve the same purpose (such as bspwm and dwm-tools, both configs and tools for window managers).
There will be conflicts if you stow multiple programs of the same purpose.

## Why only two of the window managers you have used?
I may add more later, but bspwm and dwm are my favorites. I currently use my own fork of dwm on all of my Linux systems as I prefer dynamic tilers, but if I were to use a manual tiler, I would use bspwm.
I've used i3, i3-gaps, and xmonad in the past. i3 didn't have gaps, i3-gaps is hacky weirdness, and xmonad is more difficult to configure than dwm.

## Why does the bspwm polybar look so bad?
I tried using someone else's config and tweaking it, but I just partially broke it instead. I may fix this later, but I give no guarantees.

## Why not have multiple configs in the same directory for things you use on every system?
Consistency and flexibility. It allows me to easily switch what program I use for a given purpose, and it leaves no mystery as to what program is in a given directory.
Wasted space is not really a concern, as directories themselves take 4K per directory.
