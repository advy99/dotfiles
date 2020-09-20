# dotfiles

Here are the dotfiles I use for my personal system.

# Repository structure

In this repo you can find my dotfiles as if the repo root is ~ in my personal system, except for the (not yet here) `bin` folder.

# bin folder

The `bin` folder is a folder with two simple scripts and a txt file:

- `deploy.sh`: Deploy the dotfiles in this repo to the system.
- `pull.sh`: Pull the dotfiles of the system in this repo.
- `tracked_files.txt` : Files to deploy or pull.

IMPORTANT: The script support both files or directories, but only will respect the full path of the dotfile if the path starts with "~/".

## Usage of scripts

To use this scripts first you need to move inside `bin` folder:

```sh
cd bin
```

Then you execute one of the scripts. Before changing anything in your system or the dotfiles in the repo you need to confirm the action as the (your system or this repo) dotfiles will be overwrited.

```sh
./pull.sh
```

or

```sh
./deploy.sh
```

# Tracked files

- `nvidia_optimus` : personal script to exec arguments under nvidia card - for nvidia hybrid systems.
- `atom-packages` : txt file with the atom packages i used in Atom (just in case i return to Atom).
- `.zshrc` : configuration file for zsh.
- `.vimrc` : configuration file for Vim.
- `.config/i3/config` : configuration file for i3.
- `.config/i3/launchscripts/*` : scripts used by i3 when is launched.
- `.config/i3/scripts/*` : scripts used while using i3.
- `.config/polybar/*` : configuration files for polybar.
- `.config/picom/picom.conf` : configuration file for picom.
- `.config/kitty/kitty.conf` : configuration file for kitty.
- `.config/rofi/*` : configuration files for rofi.

# System Information

- OS: Arch Linux
- WM: i3
- Theme: Arc-Dark
- Icons: Papirus-Dark
- Terminal: kitty
- Terminal Font: Roboto Mono
- Compositor: Picom


